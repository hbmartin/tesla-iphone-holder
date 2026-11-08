"""Independent exported-solid checks for V9 and comparisons against V8."""
import hashlib
import json
import math
from pathlib import Path
import cadquery as cq
import numpy as np
import trimesh
from scipy.interpolate import PchipInterpolator
from build_model import ROOT
from model_v4 import seating_volumes
from model_v8 import nub_cutter as old_cutter
from model_v9 import nub_cutter as new_cutter
from verify_v5 import curves, crossings, bracket, close


def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()


def geometry(out=ROOT/'output/v9'):
    out=Path(out);r=json.loads((out/'validation/geometry_report.json').read_text());p=r['parameters']
    oldp=json.loads((ROOT/'output/v8/parameters.json').read_text())
    expected={'left':dict(x=-.5,c=.3,b=94.3,t=159.2,dx=-.5,dt=0),
              'right':dict(x=93.,c=.2,b=24.45,t=160.07,dx=0,dt=-.4)}
    meshes={};cad={};rows=[];sections=[];ends=[];unchanged=[];rails=[]
    interp=PchipInterpolator([0,2,4.4],[17,12,7.5])
    assert len(list(out.glob('*.stl')))==2
    for side,e in expected.items():
        print('Checking V9',side,'exported solid',flush=True)
        path=out/f'{side}_insert_PROTOTYPE.stl'
        mesh=trimesh.load_mesh(path,process=True);part=cq.importers.importStep(str(path.with_suffix('.step')))
        oldmesh=trimesh.load_mesh(ROOT/'output/v8'/path.name)
        old=cq.importers.importStep(str(ROOT/'output/v8'/path.with_suffix('.step').name))
        assert part.val().isValid() and len(part.solids().vals())==1
        assert mesh.is_watertight and mesh.is_winding_consistent and len(mesh.split(only_watertight=False))==1 and mesh.volume>0
        volume=part.val().Volume(1e-7);delta=abs(mesh.volume-volume)/volume;assert delta<.002
        assert mesh.bounds[0,2]>=-1e-5 and mesh.bounds[1,2]<4.5
        assert np.allclose(mesh.bounds,oldmesh.bounds,atol=.0002)
        assert np.max(mesh.vertices[:,2]-(1+p['outer_top_slope']*mesh.vertices[:,1]))<2e-4
        cad[side]=part;meshes[side]=mesh
        rows.append(dict(file=path.name,sha256=sha(path),cad_valid_single_solid=True,
            watertight_single_component=True,max_z_mm=float(mesh.bounds[1,2]),cad_stl_volume_difference_percent=delta*100))
        # Test actual mesh sections, including the tapered top's usable heights.
        for z in [.001,.2,.5,1,1.4,2,2.5,3,3.5,4,4.2]:
            lines=curves(mesh,[0,0,z],[0,0,1]);oldlines=curves(oldmesh,[0,0,z],[0,0,1])
            for y in ([100,120,140,154] if side=='left' else [30,40,80,120,145,155]):
                if z>=1+p['outer_top_slope']*y-.03:continue
                xs=crossings(lines,1,y,0);l,rr=bracket(xs,e['x'])
                ol,orr=bracket(crossings(oldlines,1,y,0),oldp[side+'_nub_x'])
                width=float(interp(z))+2*e['c']
                close(rr-l,width,.035);close((l+rr)/2,e['x'],.02)
                close((l+rr-ol-orr)/2,e['dx'],.02)
                close((rr-l)-(orr-ol),0 if side=='left' else -.2,.035)
                sections.append(dict(side=side,y=y,z=z,width_mm=rr-l,expected_width_mm=width,center_x_mm=(l+rr)/2))
                outer_l=max(v for v in xs if v<l-.01);outer_r=min(v for v in xs if v>rr+.01)
                rail=min(l-outer_l,outer_r-rr)
                # solid_border is the honeycomb setback, not the narrow
                # bottom rail beside the phone seating keepout. Require the
                # 1.6 mm structural web and compare with the printed baseline.
                oxs=crossings(oldlines,1,y,0)
                oldrail=min(ol-max(v for v in oxs if v<ol-.01),min(v for v in oxs if v>orr+.01)-orr)
                assert rail>=p['hex_web']-.035,(side,y,z,rail)
                assert rail>=oldrail-(.52 if side=='left' else .02),(side,y,z,rail,oldrail)
                rails.append(dict(side=side,y=y,z=z,minimum_side_rail_mm=rail,v8_minimum_side_rail_mm=oldrail))
            ys=crossings(lines,0,e['x'],1)
            oys=crossings(oldlines,0,oldp[side+'_nub_x'],1)
            for label,target,change in [('lower',e['b'],0),('upper',e['t'],e['dt'])]:
                if z>=1+p['outer_top_slope']*target-.03:continue
                val=min(ys,key=lambda v:abs(v-target));oldval=min(oys,key=lambda v:abs(v-(target-change)))
                close(val,target,.025);close(val-oldval,change,.025)
                ends.append(dict(side=side,end=label,z=z,y_mm=val,v8_y_mm=oldval,change_mm=val-oldval))
        # Whole-solid Boolean comparison: all changes must be inside the old
        # or new opening cutters. This covers contour, honeycomb and seating.
        a=old_cutter(oldp,side);b=new_cutter(p,side)
        difference_outside=0.;changed=0.
        for diff in [old.cut(part),part.cut(old)]:
            changed+=sum(s.Volume(1e-7) for s in diff.solids().vals())
            outside=diff
            # An empty Workplane retains its parent: another cut can find the
            # previous nonempty solid. Stop once no solids remain.
            for cutter in [a,b]:
                if not outside.solids().vals():break
                outside=outside.cut(cutter)
            difference_outside+=sum(s.Volume(1e-7) for s in outside.solids().vals())
        assert difference_outside<1e-5,(side,difference_outside)
        assert changed>1,side
        unchanged.append(dict(side=side,change_outside_opening_cutters_mm3=difference_outside,changed_volume_mm3=changed,
                              exterior_camera_honeycomb_and_phone_seating_match_v8=True))
        for v in seating_volumes(p):assert part.intersect(v).val().Volume()<1e-6
    overlap=cad['left'].intersect(cad['right']).val().Volume();assert overlap<1e-6
    close(meshes['right'].bounds[1,2],4.4,.0001)
    leading=meshes['right'].vertices[np.abs(meshes['right'].vertices[:,1])<.002]
    close(leading[:,2].max(),1,.005)
    lines=[c for m in meshes.values() for c in curves(m,[0,0,1.2],[0,0,1])]
    l,rr=bracket(crossings(lines,1,125.75,0),46.5);close(l,13.95);close(rr,79.05)
    b,t=bracket(crossings(curves(meshes['right'],[0,0,1.2],[0,0,1]),0,75,1),125.75)
    inset=6.3-math.sqrt(6.3**2-(75-(79.05-6.3))**2)
    close(b,104.7+inset);close(t,146.8-inset)
    oldreport=json.loads((ROOT/'output/v8/validation/geometry_report.json').read_text())
    for row,oldrow in zip(r['parts'],oldreport['parts'][:2]):
        assert row['hexagonal_openings']==oldrow['hexagonal_openings']
        if row['hexagonal_openings']:
            assert row['min_hex_web_mm_before_chamfer']>=1.595
            assert row['min_hex_to_boundary_mm_before_chamfer']>=2.395
    assert p['outer_top_slope']==oldp['outer_top_slope'] and r['physical_diagnostics']==oldreport['physical_diagnostics']
    preserved={}
    for version in ['v4','v5','v6','v7','v8']:
        manifest=json.loads((ROOT/f'revisions/{version}/output_sha256.json').read_text())
        present={name:digest for name,digest in manifest.items() if (ROOT/name).exists()}
        if version=='v8':assert len(present)==len(manifest)
        for name,digest in present.items():assert sha(ROOT/name)==digest,(version,name)
        preserved[version]=len(present)
    e=p['v9_evidence'];assert sha(ROOT/e['baseline'])==e['baseline_sha256']
    for name,digest in e['photos'].items():assert sha(ROOT/name)==digest
    result=dict(computational_geometry_status='PASS',physical_fit_status='UNTESTED',mesh_checks=rows,
        absolute_height_width_sections=sections,end_position_checks=ends,unchanged_v8_geometry_checks=unchanged,
        side_rail_checks=rails,insert_overlap_mm3=overlap,phone_seating_keepout_clear=True,
        camera_opening_mm=[65.1,42.1],preserved_output_files=preserved,physical_diagnostics=r['physical_diagnostics'])
    (out/'validation/geometry_verification.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(dict(geometry='PASS',width_checks=len(sections),end_checks=len(ends),minimum_nub_rail_mm=min(v['minimum_side_rail_mm'] for v in rails),preserved=preserved)),flush=True)
    return result


if __name__=='__main__':geometry()
