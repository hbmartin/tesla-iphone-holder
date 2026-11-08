"""Measure the exported single-piece V10 holder and preserve V9 artifacts."""
import json
import hashlib
import math
from pathlib import Path
import cadquery as cq
import numpy as np
import trimesh
from scipy.interpolate import PchipInterpolator
from build_model import ROOT,rounded_solid,camera_rect
from model_v4 import seating_volumes
from model_v9 import nub_cutter
from verify_v5 import curves,crossings,bracket,close


def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def volume(wp):return sum(s.Volume(1e-7) for s in wp.solids().vals())


def geometry(out=ROOT/'output/v10'):
    out=Path(out);r=json.loads((out/'validation/geometry_report.json').read_text());p=r['parameters']
    path=out/'holder_single_PROTOTYPE.stl';mesh=trimesh.load_mesh(path,process=True)
    cad=cq.importers.importStep(str(path.with_suffix('.step')))
    assert cad.val().isValid() and len(cad.solids().vals())==1
    assert mesh.is_watertight and mesh.is_winding_consistent and len(mesh.split(only_watertight=False))==1
    delta=abs(mesh.volume-volume(cad))/volume(cad);assert delta<.002
    assert mesh.bounds[0,2]>=-1e-5;close(mesh.bounds[1,2],4.4,.0001)
    assert np.max(mesh.vertices[:,2]-(1+p['outer_top_slope']*mesh.vertices[:,1]))<2e-4
    baseline=json.loads((ROOT/'output/v9/parameters.json').read_text())
    oldmeshes={s:trimesh.load_mesh(ROOT/f'output/v9/{s}_insert_PROTOTYPE.stl') for s in ['left','right']}
    oldparts={s:cq.importers.importStep(str(ROOT/f'output/v9/{s}_insert_PROTOTYPE.step')) for s in oldmeshes}
    bound=np.array([np.min([m.bounds[0] for m in oldmeshes.values()],axis=0),np.max([m.bounds[1] for m in oldmeshes.values()],axis=0)])
    assert np.allclose(mesh.bounds,bound,atol=.0002)
    expected={'left':dict(cx=-1.,clearance=.3,lo=94.3,hi=159.2,dx=-.5),'right':dict(cx=93.,clearance=.2,lo=24.45,hi=160.07,dx=0)}
    widths=[];ends=[];rails=[];physical=PchipInterpolator([0,2,4.4],[17,12,7.5])
    for side,e in expected.items():
        for z in [.001,.2,.5,1,1.4,2,2.5,3,3.5,4,4.2]:
            lines=curves(mesh,[0,0,z],[0,0,1]);oldlines=curves(oldmeshes[side],[0,0,z],[0,0,1])
            for y in ([100,120,140,154] if side=='left' else [30,40,80,120,145,155]):
                if z>=1+p['outer_top_slope']*y-.03:continue
                xs=crossings(lines,1,y,0);l,rr=bracket(xs,e['cx'])
                ol,orr=bracket(crossings(oldlines,1,y,0),baseline[side+'_nub_x']+baseline[side+'_opening_x_offset'])
                want=float(physical(z))+2*e['clearance']
                close(rr-l,want,.035);close((l+rr)/2,e['cx'],.02)
                close((l+rr-ol-orr)/2,e['dx'],.02);close((rr-l)-(orr-ol),0,.035)
                rail=min(l-max(v for v in xs if v<l-.01),min(v for v in xs if v>rr+.01)-rr)
                assert rail>=1.565,(side,y,z,rail)
                widths.append(dict(side=side,y=y,z=z,width_mm=rr-l,center_x_mm=(l+rr)/2));rails.append(float(rail))
            ys=crossings(lines,0,e['cx'],1)
            for label,y in [('lower',e['lo']),('upper',e['hi'])]:
                if z>=1+p['outer_top_slope']*y-.03:continue
                actual=min(ys,key=lambda v:abs(v-y));close(actual,y,.025)
                ends.append(dict(side=side,end=label,z=z,y_mm=actual))
    print('V10 nub sections pass',flush=True)
    # Added bridge must preserve the entire camera clearance volume.
    assert volume(cad.intersect(rounded_solid(*camera_rect(p),10,z=-1)))<1e-6
    for v in seating_volumes(p):assert volume(cad.intersect(v))<1e-6
    section=curves(mesh,[0,0,1.2],[0,0,1])
    l,rr=bracket(crossings(section,1,125.75,0),46.5);close(l,13.95);close(rr,79.05)
    # There is now actual material immediately ABOVE the camera aperture.
    # Its lower edge remains the exact top of the existing camera keepout.
    ys=crossings(section,0,46.5,1);top=min(v for v in ys if v>140);close(top,146.8,.025)
    hexchecks=[]
    for cx,cy in r['bridge']['hole_centers_mm']:
        l,rr=bracket(crossings(section,1,cy,0),cx)
        b,t=bracket(crossings(section,0,cx,1),cy)
        close(rr-l,6.,.025);close(t-b,12/math.sqrt(3),.025)
        hexchecks.append(dict(center_x_mm=cx,center_y_mm=cy,flat_to_flat_mm=rr-l,height_mm=t-b))
    assert len(hexchecks)==9 and r['bridge']['minimum_hex_web_mm']>=1.595 and r['bridge']['minimum_hex_border_mm']>=2.395
    joins=[]
    for x in [12.,81.]:
        slab=cq.Workplane('XY').box(.2,17,10,centered=False).translate((x-.1,147,-1))
        joinvol=volume(cad.intersect(slab));assert joinvol>13.,(x,joinvol)
        joins.append(dict(x_mm=x,test_slab_width_mm=.2,solid_volume_mm3=joinvol))
    old=cq.Workplane('XY').add(cq.Compound.makeCompound([v.val() for v in oldparts.values()]))
    bridge_region=cq.Workplane('XY').box(73,24.5,10,centered=False).translate((10,140.5,-1))
    permitted=[bridge_region,nub_cutter(baseline,'left'),nub_cutter(p,'left')]
    residual=0.
    for d in [old.cut(cad),cad.cut(old)]:
        for region in permitted:
            if not d.solids().vals():break
            d=d.cut(region)
        residual+=volume(d)
    assert residual<1e-5,residual
    assert r['physical_diagnostics']==json.loads((ROOT/'output/v9/validation/geometry_report.json').read_text())['physical_diagnostics']
    preserved={}
    for version in ['v4','v5','v6','v7','v8','v9']:
        manifest=json.loads((ROOT/f'revisions/{version}/output_sha256.json').read_text())
        present={n:h for n,h in manifest.items() if (ROOT/n).exists()}
        if version=='v9':assert len(present)==len(manifest)
        for n,h in present.items():assert sha(ROOT/n)==h,n
        preserved[version]=len(present)
    for n,h in p['v10_evidence']['photos'].items():assert sha(ROOT/n)==h,n
    result=dict(computational_geometry_status='PASS',physical_fit_status='UNTESTED SINGLE-PIECE FIT',
        mesh_checks=[dict(file=path.name,sha256=sha(path),cad_valid_single_solid=True,watertight_single_component=True,
                         max_z_mm=float(mesh.bounds[1,2]),cad_stl_volume_difference_percent=100*delta)],
        absolute_height_width_sections=widths,end_position_checks=ends,minimum_sampled_nub_rail_mm=min(rails),
        bridge_hex_checks=hexchecks,bridge_attachment_checks=joins,change_outside_left_opening_and_bridge_mm3=residual,
        camera_clearance_preserved=True,phone_seating_keepout_clear=True,nub_opening_center_spacing_mm=94.,
        preserved_output_files=preserved,physical_diagnostics=r['physical_diagnostics'])
    (out/'validation/geometry_verification.json').write_text(json.dumps(result,indent=2)+'\n')
    print(json.dumps(dict(geometry='PASS',solids=1,width_checks=len(widths),end_checks=len(ends),bridge_hexagons=9,preserved=preserved)),flush=True)
    return result


if __name__=='__main__':geometry()
