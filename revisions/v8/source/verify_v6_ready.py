"""Check Bambu Studio's saved V6 project and exported sliced plate."""
from pathlib import Path
import hashlib,json,re,zipfile
import xml.etree.ElementTree as ET
import numpy as np
import trimesh
from scipy.spatial import cKDTree
from slice_v4 import inspect

ROOT=Path(__file__).resolve().parent
OUT=ROOT/'output/v6'
NAME='Holder_V6_A1_PLA_PROTOTYPE'


def main():
    expected={'printer_model':'Bambu Lab A1','nozzle_diameter':['0.4'],'filament_type':['PLA'],
              'layer_height':'0.2','wall_loops':'3','sparse_infill_density':'20%',
              'sparse_infill_pattern':'gyroid','enable_support':'1','support_type':'normal(auto)',
              'support_on_build_plate_only':'1','curr_bed_type':'Textured PEI Plate'}
    baseline=json.loads((OUT/'slicer'/NAME/'result.json').read_text())['sliced_plates'][0]
    ns={'m':'http://schemas.microsoft.com/3dmanufacturing/core/2015/02'}
    with zipfile.ZipFile(OUT/(NAME+'_SLICED.3mf')) as z:
        assert z.testzip() is None
        settings=json.loads(z.read('Metadata/project_settings.config'))
        assert all(settings[k]==v for k,v in expected.items())
        model=ET.fromstring(z.read('3D/3dmodel.model'))
        config=ET.fromstring(z.read('Metadata/model_settings.config'))
        items=model.findall('m:build/m:item',ns);assert len(items)==2
        for item in items:
            oid=item.get('objectid')
            obj=config.find(f"./object[@id='{oid}']")
            name=obj.find("./metadata[@key='name']").get('value')
            stats=obj.find('./part/mesh_stat')
            assert all(int(stats.get(k))==0 for k in ['edges_fixed','degenerate_facets','facets_removed','facets_reversed','backwards_edges'])
            component=model.find(f"./m:resources/m:object[@id='{oid}']/m:components/m:component",ns)
            path=component.get('{http://schemas.microsoft.com/3dmanufacturing/production/2015/06}path')
            component=ET.fromstring(z.read(path.lstrip('/')))
            vertices=np.array([[float(v.get(k)) for k in 'xyz'] for v in component.findall('.//m:vertices/m:vertex',ns)])
            transform=np.array([float(v) for v in item.get('transform').split()])
            assert np.allclose(transform[:9],np.eye(3).ravel())
            vertices+=transform[9:]
            mesh=trimesh.load_mesh(OUT/(name+'.stl'))
            box=next(o['bbox'] for o in baseline['objects'] if o['name']==name)
            target=mesh.vertices-mesh.bounds[0]+[box['x'],box['y'],0]
            assert cKDTree(target).query(vertices)[0].max()<.0001
            assert cKDTree(vertices).query(target)[0].max()<.0001
    sliced=OUT/(NAME+'.gcode.3mf')
    with zipfile.ZipFile(sliced) as z:
        assert z.testzip() is None
        settings=json.loads(z.read('Metadata/project_settings.config'))
        assert all(settings[k]==v for k,v in expected.items())
        raw=z.read('Metadata/plate_1.gcode');code=raw.decode()
        assert hashlib.md5(raw).hexdigest()==z.read('Metadata/plate_1.gcode.md5').decode().strip().lower()
        layers=[float(n) for n in re.findall(r'^; Z_HEIGHT: ([0-9.]+)',code,re.M)]
        assert np.allclose(layers,np.arange(1,23)*.2)
        info=ET.fromstring(z.read('Metadata/slice_info.config'))
        meta={m.get('key'):m.get('value') for m in info.findall('./plate/metadata')}
        assert meta['outside']=='false' and meta['support_used']=='true' and meta['printer_model_id']=='N2S'
        assert len(info.findall('./plate/object'))==2
        warnings=[w.get('msg') for w in info.findall('./plate/warning')]
        assert all(w=='not_support_traditional_timelapse' for w in warnings),warnings
        layer_checks=inspect(code,OUT,version='V6',placements=baseline['objects'])
    report={'status':'PASS','editable_project':NAME+'_SLICED.3mf','sliced_plate':sliced.name,
            'sliced_plate_sha256':hashlib.sha256(sliced.read_bytes()).hexdigest(),
            'embedded_gcode_checksum_verified':True,'settings_verified':expected,
            'editable_geometry_matches_stls':True,'layers':22,'layer_checks':layer_checks,
            'warnings':warnings,'estimated_seconds':int(meta['prediction']),'filament_grams':float(meta['weight']),
            'print_dispatch':False}
    (OUT/'validation/gui_ready_verification.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({'status':'PASS','models_match':True,'gcode_checksum':'PASS','layers':22,
                      'estimated_minutes':int(meta['prediction'])/60,'grams':float(meta['weight'])},indent=2))


if __name__=='__main__':main()
