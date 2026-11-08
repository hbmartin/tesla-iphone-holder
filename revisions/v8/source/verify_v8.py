"""Measure exported V8 CAD/STLs independently and verify preserved revisions."""
from pathlib import Path
import json
import math
import hashlib
import cadquery as cq
import numpy as np
import trimesh
from scipy.interpolate import PchipInterpolator
from build_model import ROOT,rounded_solid
from model_v4 import seating_volumes
from verify_v5 import curves,crossings,bracket,close


def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()


def measured_width(mesh,cx,y,z):
    lines=curves(mesh,[0,0,z],[0,0,1])
    l,r=bracket(crossings(lines,1,y,0),cx)
    return r-l,(l+r)/2


def expected_width(z,c=.3):
    return float(PchipInterpolator([0,2,4.4],[17,12,7.5])(z))+2*c


def geometry(out=ROOT/'output/v8'):
    out=Path(out);r=json.loads((out/'validation/geometry_report.json').read_text());p=r['parameters']
    cad={};meshes={};rows=[]
    paths=sorted(out.glob('*.stl'))+sorted((out/'fit_tests').glob('*.stl'))
    assert len(paths)==5
    for path in paths:
        mesh=trimesh.load_mesh(path,process=True);solid=cq.importers.importStep(str(path.with_suffix('.step')))
        assert solid.val().isValid() and len(solid.solids().vals())==1,path.name
        assert mesh.is_watertight and mesh.is_winding_consistent and len(mesh.split(only_watertight=False))==1 and mesh.volume>0,path.name
        # Curved lofts need explicit adaptive integration; the OCC default
        # mass calculation can differ by >0.5% even with converged tessellation.
        volume=solid.val().Volume(1e-7)
        diff=abs(mesh.volume-volume)/volume;assert diff<.002,(path.name,diff)
        assert mesh.bounds[0,2]>=-1e-5 and mesh.bounds[1,2]<4.5
        assert np.max(mesh.vertices[:,2]-(1+p['outer_top_slope']*mesh.vertices[:,1]))<2e-4,path.name
        meshes[path.stem]=mesh;cad[path.stem]=solid
        rows.append(dict(file=str(path.relative_to(out)),cad_valid_single_solid=True,watertight_single_component=True,
                         max_z_mm=float(mesh.bounds[1,2]),cad_stl_volume_difference_percent=100*diff,sha256=sha(path)))
    sections=[]
    for side,ys in [('left',[100,120,140]),('right',[40,80,120,145])]:
        m=meshes[side+'_insert_PROTOTYPE'];cx=0 if side=='left' else 93
        for z in [.001,.5,1.,1.5,2.,2.5,3.,3.5,4.]:
            for y in ys:
                if z>=1+p['outer_top_slope']*y-.02:continue
                w,center=measured_width(m,cx,y,z)
                close(w,expected_width(z),.035);close(center,cx,.02)
                sections.append(dict(part=side,y_mm=y,z_mm=z,actual_width_mm=w,expected_width_mm=expected_width(z),center_x_mm=center))
        # End positions are measured on actual horizontal sections low enough
        # that both ends intersect material, separately from rounded cap width.
        for z in [.001,.5,1.]:
            lines=curves(m,[0,0,z],[0,0,1]);b,t=bracket(crossings(lines,0,cx,1),p[side+'_nub_y'])
            close(b,p[side+'_nub_bottom_y']-.7,.025)
            close(t,p[side+'_nub_bottom_y']+p[side+'_nub_length']+.7,.025)
        if side=='right':
            close(m.bounds[0,1],0,.002)
            leading=m.vertices[np.abs(m.vertices[:,1])<.002]
            close(leading[:,2].max(),1,.005)
        else:
            assert 0 < m.bounds[0,1] < 6, m.bounds

    close(meshes['right_insert_PROTOTYPE'].bounds[1,2],4.4,.0001)
    # Side-gap wall positioning at the actual two given stations.
    wall=[];m=meshes['left_insert_PROTOTYPE']
    for y,gap in [(95.,10.3),(158.5,14.7)]:
        x=min(crossings(curves(m,[0,0,1.2],[0,0,1]),1,y,0))
        expect=-8.5-gap+.5+2
        close(x,expect,.025);wall.append(dict(y_mm=y,measured_gap_mm=gap,actual_outer_edge_x_mm=x,expected_outer_edge_x_mm=expect))
    # The new corner fills the old recessed area in the registered frame.
    old=trimesh.load_mesh(ROOT/'output/v7/left_insert_PROTOTYPE.stl')
    old.apply_translation([0,6.1,0])
    corner=[]
    for y in [8,10,15,20,25,30,35]:
        n=min(crossings(curves(m,[0,0,1],[0,0,1]),1,y,0))
        o=min(crossings(curves(old,[0,0,1],[0,0,1]),1,y,0))
        corner.append(dict(y_mm=y,new_outer_x_mm=n,v7_registered_outer_x_mm=o,outward_change_mm=o-n))
    assert max(q['outward_change_mm'] for q in corner)>3,corner
    overlap=cad['left_insert_PROTOTYPE'].intersect(cad['right_insert_PROTOTYPE']).val().Volume();assert overlap<1e-6
    for side in ['left','right']:
        part=cad[side+'_insert_PROTOTYPE']
        for volume in seating_volumes(p):assert part.intersect(volume).val().Volume()<1e-6
    lines=[c for side in ['left','right'] for c in curves(meshes[side+'_insert_PROTOTYPE'],[0,0,1.2],[0,0,1])]
    l,rr=bracket(crossings(lines,1,125.75,0),46.5);close(l,13.95);close(rr,79.05);close(rr-l,65.1)
    right_lines=curves(meshes['right_insert_PROTOTYPE'],[0,0,1.2],[0,0,1])
    b,t=bracket(crossings(right_lines,0,75,1),125.75)
    inset=6.3-math.sqrt(6.3**2-(75-(79.05-6.3))**2)
    close(b,104.7+inset);close(t,146.8-inset)
    fit=[]
    for side in ['left','right']:
        for c in [.3]:
            name=f'{side}_nub_fit_V8';m=meshes[name]
            for z in [.001,1,2,2.5]:
                w,center=measured_width(m,p[side+'_nub_x'],p[side+'_nub_y'],z)
                close(w,expected_width(z,c),.035);close(center,p[side+'_nub_x'],.02)
            fit.append(dict(name=name,clearance_per_side_mm=c,base_opening_mm=expected_width(0,c),reference_opening_at_z_4_4_mm=expected_width(4.4,c)))
    outside=cad['lower_left_corner_C8'].cut(cad['left_insert_PROTOTYPE']).val().Volume();assert outside<1e-6
    for row in r['parts']:
        if row.get('hexagonal_openings'):
            assert row['min_hex_web_mm_before_chamfer']>=1.595
            assert row['min_hex_to_boundary_mm_before_chamfer']>=p['solid_border']-.005
    preserved={};absent={}
    for version in ['v4','v5','v6','v7']:
        manifest=json.loads((ROOT/f'revisions/{version}/output_sha256.json').read_text())
        present={name:digest for name,digest in manifest.items() if (ROOT/name).exists()}
        for name,digest in present.items():assert sha(ROOT/name)==digest,(version,name)
        preserved[version]=len(present);absent[version]=len(manifest)-len(present)
    evidence=json.loads((ROOT/'output/v8/evidence/photo_estimates.json').read_text())
    for name,digest in evidence['source_sha256'].items():assert sha(ROOT/name)==digest
    assert sha(ROOT/'output/v8/evidence/photo_estimates.json')==p['v8_evidence']['source_sha256']
    result=dict(computational_geometry_status='PASS',physical_fit_status='UNTESTED; PHOTO ESTIMATES AUTHORIZED',mesh_checks=rows,
         absolute_height_width_sections=sections,wall_gap_checks=wall,corner_changes=corner,
         fit_samples=fit,corner_sample_is_subset_of_actual_insert=True,
         shared_taper='1 mm at Y=0 to 4.4 mm at assembly upper edge',
         insert_overlap_mm3=overlap,phone_seating_keepout_clear=True,camera_opening_mm=[65.1,42.1],
         source_photos_hash_verified=len(evidence['source_sha256']),preserved_output_files=preserved,prior_output_files_absent=absent,
         physical_diagnostics=r['physical_diagnostics'])
    (out/'validation/geometry_verification.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps({'geometry':'PASS','watertight_models':len(rows),'absolute_Z_width_checks':len(sections),'corner_max_outward_change_mm':max(q['outward_change_mm'] for q in corner),'preserved':preserved},indent=2),flush=True)
    return result


if __name__=='__main__':geometry()
