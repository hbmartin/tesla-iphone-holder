"""Verify the face-down Studio export and its rigid transform from V9."""
import json
import zipfile
import numpy as np
import trimesh
from scipy.spatial import cKDTree
import verify_v9_ready as studio
from prepare_v9_face_down import OUT,NAME,ROOT,sha
from slice_v4 import paths


def main():
    orientation=json.loads((OUT/'validation/orientation.json').read_text())
    for row in orientation['parts']:
        source=ROOT/row['source'];target=OUT/row['print_mesh']
        assert sha(source)==row['source_sha256'] and sha(target)==row['print_mesh_sha256']
        original=trimesh.load_mesh(source);printed=trimesh.load_mesh(target)
        transform=np.array(row['rigid_transform']);rotation=transform[:3,:3]
        assert np.allclose(rotation.T@rotation,np.eye(3)) and abs(np.linalg.det(rotation)-1)<1e-8
        original.apply_transform(transform)
        deviation=max(cKDTree(original.vertices).query(printed.vertices)[0].max(),cKDTree(printed.vertices).query(original.vertices)[0].max())
        assert deviation<.00003
        assert np.allclose(row['outward_plane_normal_after_rotation'],[0,0,-1])
        row['rigid_mesh_deviation_mm']=float(deviation)
    studio.OUT=OUT
    plate=studio.check(NAME,True)
    plate['print_leading_edge_extrusion_points']=plate.pop('lower_edge_extrusion_points')
    baseline=json.loads((OUT/'slicer'/NAME/'result.json').read_text())['sliced_plates'][0]
    with zipfile.ZipFile(OUT/plate['sliced_plate']) as z:
        data=paths(z.read('Metadata/plate_1.gcode').decode())
    rails={}
    for layer in [.2,.4,.6,.8,1.]:
        counts=[]
        for obj in baseline['objects']:
            b=obj['bbox']
            # The installed bottom is at the print's HIGH Y after flipping.
            n=sum(len(v) for height,f,v in data if height==layer and not f.startswith('Support')
                  and ((v[:,0]>b['x']-.1)&(v[:,0]<b['x']+b['width']+.1)&(v[:,1]>b['y']+b['depth']-3)).any())
            assert n>0,(layer,obj['name']);counts.append(n)
        rails[str(layer)]=counts
    plate['original_lower_edge_extrusion_points']=rails
    result=dict(status='PASS',orientation=orientation,plates=[plate],printer_dispatch=False)
    (OUT/'validation/gui_ready_verification.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(dict(status='PASS',minutes=plate['estimated_seconds']/60,grams=plate['filament_grams'],
        orientation=orientation['orientation'],warnings=plate['warnings']),indent=2))


if __name__=='__main__':main()
