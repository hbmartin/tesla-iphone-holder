"""Verify Studio's V10 saved project and exported print-ready plate."""
from pathlib import Path
import hashlib
import json
import re
import zipfile
import xml.etree.ElementTree as ET
import numpy as np
import trimesh
from scipy.spatial import cKDTree
from slice_v4 import paths

ROOT = Path(__file__).resolve().parent
OUT = ROOT / 'output/v10'
EXPECTED = {
    'printer_model': 'Bambu Lab A1', 'nozzle_diameter': ['0.4'],
    'filament_type': ['PLA'], 'layer_height': '0.2', 'wall_loops': '3',
    'sparse_infill_density': '20%', 'sparse_infill_pattern': 'gyroid',
    'enable_support': '1', 'support_type': 'normal(auto)',
    'support_style': 'snug', 'support_on_build_plate_only': '1', 'support_threshold_angle': '45',
    'support_top_z_distance': '0.2', 'support_object_xy_distance': '0.35',
    'curr_bed_type': 'Textured PEI Plate',
    'xy_hole_compensation': '0', 'xy_contour_compensation': '0',
}


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def check(name, full):
    count = 1
    folder = OUT / 'slicer' / name
    baseline = json.loads((folder / 'result.json').read_text())['sliced_plates'][0]
    ns = {'m': 'http://schemas.microsoft.com/3dmanufacturing/core/2015/02'}
    editable = OUT / (name + '_SLICED.3mf')
    geometry_checks = []
    with zipfile.ZipFile(editable) as z:
        assert z.testzip() is None
        settings = json.loads(z.read('Metadata/project_settings.config'))
        for key, value in EXPECTED.items():
            assert settings[key] == value, (name, key, settings[key])
        model = ET.fromstring(z.read('3D/3dmodel.model'))
        config = ET.fromstring(z.read('Metadata/model_settings.config'))
        items = model.findall('m:build/m:item', ns)
        assert model.get('unit') == 'millimeter' and len(items) == count
        for item in items:
            oid = item.get('objectid')
            obj = config.find(f"./object[@id='{oid}']")
            objname = obj.find("./metadata[@key='name']").get('value')
            stats = obj.find('./part/mesh_stat')
            assert all(int(stats.get(k)) == 0 for k in [
                'edges_fixed', 'degenerate_facets', 'facets_removed',
                'facets_reversed', 'backwards_edges'])
            component = model.find(
                f"./m:resources/m:object[@id='{oid}']/m:components/m:component", ns)
            path = component.get('{http://schemas.microsoft.com/3dmanufacturing/production/2015/06}path')
            child = ET.fromstring(z.read(path.lstrip('/')))
            vertices = np.array([[float(v.get(k)) for k in 'xyz']
                                 for v in child.findall('.//m:vertices/m:vertex', ns)])
            transform = np.array([float(v) for v in item.get('transform').split()])
            assert np.allclose(transform[:9], np.eye(3).ravel())
            vertices += transform[9:]
            stl = (OUT / 'print') / (objname + '.stl')
            mesh = trimesh.load_mesh(stl)
            box = next(o['bbox'] for o in baseline['objects'] if o['name'] == objname)
            target = mesh.vertices - mesh.bounds[0] + [box['x'], box['y'], 0]
            deviation = max(cKDTree(target).query(vertices)[0].max(),
                            cKDTree(vertices).query(target)[0].max())
            assert deviation < .0001, (objname, deviation)
            geometry_checks.append(dict(name=objname, stl_sha256=sha(stl),
                                        maximum_vertex_deviation_mm=float(deviation),
                                        mesh_repairs=0))
    from prepare_v10 import check_structural_paths
    sliced = OUT / (name + '.gcode.3mf')
    with zipfile.ZipFile(sliced) as z:
        assert z.testzip() is None
        settings = json.loads(z.read('Metadata/project_settings.config'))
        for key, value in EXPECTED.items():
            assert settings[key] == value, (name, key, settings[key])
        raw = z.read('Metadata/plate_1.gcode')
        code = raw.decode()
        assert hashlib.md5(raw).hexdigest() == z.read('Metadata/plate_1.gcode.md5').decode().strip().lower()
        info = ET.fromstring(z.read('Metadata/slice_info.config'))
        meta = {m.get('key'): m.get('value') for m in info.findall('./plate/metadata')}
        assert meta['outside'] == 'false' and meta['support_used'] == 'true'
        assert meta['printer_model_id'] == 'N2S'
        objects = info.findall('./plate/object')
        assert len(objects) == count and all(o.get('skipped') == 'false' for o in objects)
        assert {o.get('name') for o in objects} == {o['name'] for o in baseline['objects']}
        warnings = sorted({w.get('msg') for w in info.findall('./plate/warning')})
        assert all(w == 'not_support_traditional_timelapse' for w in warnings), warnings
        data = paths(code)
        model_layers = sorted({z for z, f, _ in data if not f.startswith('Support')})
        support_layers = sorted({z for z, f, _ in data if f.startswith('Support')})
        assert len(model_layers) == 22 and np.allclose(model_layers, np.arange(1, 23) * .2)
        assert support_layers and support_layers[0] == .2
        assert re.search(r'^; FEATURE: Support interface$', code, re.M)
        # Studio can reverse path order and reroute support infill. Verify
        # model coverage independently of traversal order, sampling at 0.2 mm.
        cli_data = paths((folder / 'plate_1.gcode').read_text())
        comparisons = []
        for height in model_layers:
            arrays, lengths = [], []
            for source in [cli_data, data]:
                points, length = [], 0.
                for layer_z, feature, line in source:
                    if layer_z != height or feature.startswith('Support'):
                        continue
                    for a, b in zip(line[:-1], line[1:]):
                        distance = np.linalg.norm(b-a)
                        length += distance
                        points.append(np.linspace(a, b, max(2, int(np.ceil(distance/.2))+1)))
                arrays.append(np.vstack(points))
                lengths.append(length)
            deviation = max(cKDTree(arrays[0]).query(arrays[1])[0].max(),
                            cKDTree(arrays[1]).query(arrays[0])[0].max())
            relative_length_difference = abs(lengths[0]-lengths[1])/lengths[0]
            assert deviation <= .101 and relative_length_difference < .0001
            comparisons.append(dict(z=height, sampled_deviation_mm=float(deviation),
                                    relative_length_difference=relative_length_difference))
        support_bounds_deviation = 0.
        for height in support_layers:
            for obj in baseline['objects']:
                b = obj['bbox']
                bounds = []
                for source in [cli_data, data]:
                    segments = [v for z, f, v in source if z == height and f.startswith('Support')
                                and np.all((v[:, 0] >= b['x']-3) & (v[:, 0] <= b['x']+b['width']+3)
                                           & (v[:, 1] >= b['y']-3) & (v[:, 1] <= b['y']+b['depth']+3))]
                    if segments:
                        vertices = np.vstack(segments)
                        bounds.append(np.array([vertices.min(axis=0), vertices.max(axis=0)]))
                    else:
                        bounds.append(None)
                assert (bounds[0] is None) == (bounds[1] is None)
                if bounds[0] is not None:
                    delta = float(np.max(abs(bounds[0]-bounds[1])))
                    assert delta < .01, (obj['name'], height, delta)
                    support_bounds_deviation = max(support_bounds_deviation, delta)
        rails = {}
        if full:
            for height in [.2, .4, .6, .8, 1.]:
                rails[str(height)] = []
                for obj in baseline['objects']:
                    b = obj['bbox']
                    n = sum(len(v) for layer, f, v in data
                            if layer == height and not f.startswith('Support')
                            and np.any((v[:, 0] > b['x'] - .1)
                                       & (v[:, 0] < b['x'] + b['width'] + .1)
                                       & (v[:, 1] < b['y'] + 3)))
                    assert n > 0, (obj['name'], height)
                    rails[str(height)].append(n)
        structural = check_structural_paths(OUT, baseline, data)
        preview = OUT / 'previews' / ('ready_full_plate.png' if full else 'ready_fit_plate.png')
        preview.write_bytes(z.read('Metadata/plate_1.png'))
    return dict(status='PASS', editable_project=editable.name,
                editable_project_sha256=sha(editable), sliced_plate=sliced.name,
                sliced_plate_sha256=sha(sliced), objects=count,
                geometry_checks=geometry_checks, settings_verified=EXPECTED,
                embedded_gcode_checksum_verified=True,
                model_path_comparison_to_cli=comparisons,
                support_bounds_maximum_deviation_mm=support_bounds_deviation,
                support_routing_note='Support infill traversal may differ from CLI; per-object, per-layer bounds verified.',
                model_layers_mm=model_layers,
                support_layers_mm=support_layers,
                total_z_events=len(re.findall(r'^; Z_HEIGHT:', code, re.M)),
                print_leading_edge_extrusion_points=rails, structural_path_checks=structural, warnings=warnings,
                dispatch_guidance='Disable timelapse; enable bed leveling and flow calibration.',
                estimated_seconds=int(meta['prediction']), filament_grams=float(meta['weight']),
                preview=str(preview.relative_to(OUT)), printer_dispatch=False)


def main():
    plates = [check('Holder_V10_A1_PLA_OUTWARD_FACE_DOWN', True)]
    report = dict(status='PASS', plates=plates, printer_dispatch=False)
    (OUT / 'validation/gui_ready_verification.json').write_text(json.dumps(report, indent=2) + '\n')
    print(json.dumps({p['sliced_plate']: dict(status=p['status'], objects=p['objects'],
                     minutes=p['estimated_seconds']/60, grams=p['filament_grams'],
                     warnings=p['warnings']) for p in plates}, indent=2))


if __name__ == '__main__':
    main()
