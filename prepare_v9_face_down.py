"""Rigidly orient V9 outward face down, level its taper plane, and slice."""
import json
import hashlib
import math
import shutil
from pathlib import Path
import numpy as np
import trimesh
from prepare_slicer import ROOT,run_project
from prepare_v9 import validate_slice

OUT=ROOT/'output/v9/outward_face_down'
NAME='Holder_V9_A1_PLA_OUTWARD_FACE_DOWN'


def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()


def main():
    base=ROOT/'output/v9';p=json.loads((base/'parameters.json').read_text())
    for f in [OUT,OUT/'slicer',OUT/'validation',OUT/'previews']:f.mkdir(parents=True,exist_ok=True)
    # The original outward plane is z = 1 + slope*y. This is a rotation,
    # not a reflection. Map its normal onto the plate's downward normal.
    angle=math.pi-math.atan(p['outer_top_slope'])
    rotation=trimesh.transformations.rotation_matrix(angle,[1,0,0])
    assert np.isclose(np.linalg.det(rotation[:3,:3]),1)
    normal=np.array([0,-p['outer_top_slope'],1]);normal/=np.linalg.norm(normal)
    assert np.allclose(rotation[:3,:3]@normal,[0,0,-1])
    rows=[]
    for side in ['left','right']:
        original=base/f'{side}_insert_PROTOTYPE.stl'
        m=trimesh.load_mesh(original);oldvolume=m.volume
        m.apply_transform(rotation)
        translation=-m.bounds[0];m.apply_translation(translation)
        transform=rotation.copy();transform[:3,3]+=translation
        target=OUT/original.name;m.export(target)
        exported=trimesh.load_mesh(target)
        assert exported.is_watertight and len(exported.split())==1
        assert abs(exported.volume-oldvolume)/oldvolume<1e-5
        contact=np.max(exported.triangles[:,:,2],axis=1)<.002
        contact_area=float(exported.area_faces[contact].sum())
        assert contact_area>500 and abs(exported.bounds[0,2])<1e-5
        contact_vertices=exported.triangles[contact].reshape(-1,3)
        assert np.ptp(contact_vertices[:,1])>.9*exported.extents[1]
        rows.append(dict(part=side,source=str(original.relative_to(ROOT)),source_sha256=sha(original),
            print_mesh=target.name,print_mesh_sha256=sha(target),rigid_transform=transform.tolist(),
            outward_plane_normal_after_rotation=(rotation[:3,:3]@normal).tolist(),
            bed_contact_area_mm2=contact_area,bed_contact_y_span_mm=float(np.ptp(contact_vertices[:,1])),
            print_bounds_mm=exported.bounds.tolist(),volume_change_percent=float((exported.volume-oldvolume)/oldvolume*100)))
    for name in ['machine','process','filament']:
        settings=json.loads((base/f'slicer/{name}.json').read_text())
        if name=='process':
            for k in ['name','print_settings_id']:settings[k]+=' - outward face down'
        (OUT/f'slicer/{name}.json').write_text(json.dumps(settings,indent=2)+'\n')
    report=dict(status='PASS',orientation='Outward/phone-facing taper plane down, laid flat on the plate',
        rotation_x_degrees=math.degrees(angle),source_geometry_unchanged=True,parts=rows,printer_dispatch=False)
    (OUT/'validation/orientation.json').write_text(json.dumps(report,indent=2)+'\n')
    entry=run_project(OUT,NAME,[OUT/f'{s}_insert_PROTOTYPE.stl' for s in ['left','right']],v4=True)
    for place in entry['placements']:place['print_orientation']=report['orientation']
    (OUT/'validation/slicer_report.json').write_text(json.dumps([entry],indent=2)+'\n')
    # Layer/settings verification is reused; this directory contains already
    # rotated printing meshes, so there is no second flip in run_project.
    sliced=validate_slice(OUT,entry,2,True,orientation_label='outward face down, taper plane flat')
    sliced['print_leading_edge_extrusion_points']=sliced.pop('lower_edge_model_extrusion_points')
    (OUT/'validation/slice_verification.json').write_text(json.dumps(sliced,indent=2)+'\n')
    print(json.dumps(dict(orientation=report['orientation'],angle=report['rotation_x_degrees'],
        contact_areas_mm2=[r['bed_contact_area_mm2'] for r in rows],
        minutes=sliced['estimated_minutes'],grams=sliced['filament_grams'],warnings=sliced['warnings']),indent=2))


if __name__=='__main__':main()
