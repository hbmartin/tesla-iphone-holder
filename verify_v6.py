"""Verify exported V6 solids/meshes and the actual A1 slice independently."""
from pathlib import Path
import hashlib
import json
import math
import re
import zipfile
import xml.etree.ElementTree as ET

import cadquery as cq
import numpy as np
import trimesh

from build_model import ROOT, rounded_solid
from verify_v5 import curves, crossings, bracket, close, sha


def geometry(out,report):
    p=report['parameters']; rows=[]; section_rows=[]
    meshes={s:trimesh.load_mesh(out/f'{s}_insert_PROTOTYPE.stl') for s in ('left','right')}
    cad={s:cq.importers.importStep(str(out/f'{s}_insert_PROTOTYPE.step')) for s in meshes}
    old={s:trimesh.load_mesh(ROOT/f'output/v5/{s}_insert_PROTOTYPE.stl') for s in meshes}
    for side,m in meshes.items():
        assert m.is_watertight and m.is_winding_consistent and m.volume>0
        assert len(m.split(only_watertight=False))==1
        assert cad[side].val().isValid() and len(cad[side].solids().vals())==1
        delta=abs(m.volume-cad[side].val().Volume())/cad[side].val().Volume()
        assert delta<.003,(side,delta)
        assert m.bounds[0,2]>=-1e-5 and m.bounds[1,2]<=4.4+1e-5
        assert np.max(m.vertices[:,2]-(1+p['outer_top_slope']*m.vertices[:,1]))<1e-4
        close(m.bounds[0,1],0,.001)
        leading=m.vertices[np.abs(m.vertices[:,1])<.001]
        close(leading[:,2].max(),1,.002)
        # Same physical mouths/endpoints, new monotone interior at all levels.
        cx,cy=p[side+'_nub_x'],p[side+'_nub_y']
        widths=[];lower=[];upper=[];differences=[]
        for u in [1e-5,.125,.25,.5,.75,.875,.99999]:
            origin=[0,0,u];normal=[0,-u*p['outer_top_slope'],1]
            lines=curves(m,origin,normal);old_lines=curves(old[side],origin,normal)
            left,right=bracket(crossings(lines,1,cy,0),cx)
            bottom,top=bracket(crossings(lines,0,cx,1),cy)
            old_width=np.diff(bracket(crossings(old_lines,1,cy,0),cx))[0]
            width=right-left
            assert 5.59<=width<=13.51
            widths.append(width);lower.append(bottom);upper.append(top)
            differences.append(abs(width-old_width))
            if u<.001 or u>.999:
                ob,ot=bracket(crossings(old_lines,0,cx,1),cy)
                close(bottom,ob);close(top,ot)
                close(width,13.5 if u<.001 else 5.6)
            if u>.999:
                for yy in np.linspace(bottom+5,top-5,5):
                    a,b=bracket(crossings(lines,1,yy,0),cx);close(b-a,5.6)
            section_rows.append(dict(part=side,local_height_fraction=u,width_mm=width,
                                     lower_end_y_mm=bottom,upper_end_y_mm=top))
        assert all(a>b for a,b in zip(widths,widths[1:]))
        assert all(a<b for a,b in zip(lower,lower[1:]))
        assert all(a>b for a,b in zip(upper,upper[1:]))
        assert max(differences)>.03,'Nub contour did not change from V5'
        rows.append(dict(part=side,watertight_single_solid=True,maximum_z_mm=float(m.bounds[1,2]),
                         cad_stl_volume_difference_percent=100*delta,
                         largest_sampled_nub_width_change_vs_v5_mm=max(differences),
                         sha256=sha(out/f'{side}_insert_PROTOTYPE.stl')))
    close(meshes['right'].bounds[1,2],4.4,.00001)
    # Upper left wall remains exactly at the prior 2 mm inward setting.
    top_new=min(crossings(curves(meshes['left'],[0,0,2],[0,0,1]),1,120,0))
    top_old=min(crossings(curves(old['left'],[0,0,2],[0,0,1]),1,120,0))
    close(top_new,top_old,.005)
    # Verify actual extra underside relief, independently of its table formula.
    low_new=min(crossings(curves(meshes['left'],[0,0,.1],[0,0,1]),1,75,0))
    low_old=min(crossings(curves(old['left'],[0,0,.1],[0,0,1]),1,75,0))
    assert .05<low_new-low_old<3.01
    front=[]
    for side,x in [('left',0),('right',93)]:
        n=min(crossings(curves(meshes[side],[0,0,.1],[0,0,1]),0,x,1))
        o=min(crossings(curves(old[side],[0,0,.1],[0,0,1]),0,x,1))
        assert .01<n-o<1.51,(side,n,o)
        front.append(dict(part=side,section_z_mm=.1,additional_front_setback_mm=n-o))
    overlap=cad['left'].intersect(cad['right']).val().Volume();assert overlap<1e-7
    phone=rounded_solid(46.5,75,71.1,150,p['phone_corner_radius'],12,z=-1)
    low=cq.Workplane('XY').box(200,37,12,centered=False).translate((-50,-1,-1)).intersect(phone)
    slope=p['phone_support_top_height']/150
    above=cq.Workplane('YZ',origin=(-60,0,0)).polyline([(-1,-slope),(151,151*slope),(151,20),(-1,20)]).close().extrude(200).intersect(phone)
    for solid in cad.values():
        assert solid.intersect(low).val().Volume()<1e-6
        assert solid.intersect(above).val().Volume()<1e-6
    lines=[c for m in meshes.values() for c in curves(m,[0,0,1.2],[0,0,1])]
    l,r=bracket(crossings(lines,1,125.75,0),46.5)
    close(l,13.95);close(r,79.05);close(r-l,65.1)
    rlines=curves(meshes['right'],[0,0,1.2],[0,0,1])
    bottom,top=bracket(crossings(rlines,0,75,1),125.75)
    inset=6.3-math.sqrt(6.3**2-(75-(79.05-6.3))**2)
    close(bottom,104.7+inset);close(top,146.8-inset)
    for row in report['parts']:
        if row['hexagonal_openings']:
            assert row['min_hex_web_mm_before_chamfer']>=1.595
            # A 3 mm setback reserve is kept beyond the 2.4 mm solid border.
            assert row['min_hex_to_boundary_mm_before_chamfer']>=5.395
    # All dimensioned endpoints remain the established V5 values.
    expected={'phone_width':71.1,'phone_length':150,'camera_width':64.5,'camera_length':41.5,
              'camera_bottom_y':105,'camera_clearance':.3,'thickness':4.4,'maximum_allowed_thickness':4.5,
              'left_outer_edge_inset':2,'left_lower_outer_corner_radius':15,'phone_seating_relief_length':36,
              'left_nub_upper_bottom_reduction':2,'left_nub_upper_top_reduction':2,
              'right_nub_upper_bottom_reduction':6,'right_nub_upper_top_reduction':5}
    assert all(p[k]==v for k,v in expected.items())
    return dict(meshes=rows,nub_sections=section_rows,phone_keepout_clear=True,
                camera_opening_mm=[r-l,top-bottom+2*inset],overlap_mm3=overlap,
                upper_left_edge_matches_v5=True,additional_wall_setback_at_z_0_1_mm=low_new-low_old,
                front_edge_checks=front)


def slicing(out):
    name='Holder_V6_A1_PLA_PROTOTYPE';folder=out/'slicer'/name
    result=json.loads((folder/'result.json').read_text())
    settings=json.loads((folder/'effective_settings.json').read_text())
    assert result['return_code']==0 and len(result['sliced_plates'])==1
    plate=result['sliced_plates'][0]
    assert len(plate['objects'])==2 and not plate['warning_message']
    expected={'printer_model':'Bambu Lab A1','nozzle_diameter':['0.4'],'filament_type':['PLA'],
              'layer_height':'0.2','wall_loops':'3','sparse_infill_density':'20%',
              'sparse_infill_pattern':'gyroid','enable_support':'1','support_type':'normal(auto)',
              'support_on_build_plate_only':'1'}
    for k,v in expected.items():assert settings[k]==v,(k,settings[k])
    for obj in plate['objects']:
        b=obj['bbox'];assert b['x']>=0 and b['y']>=0 and b['x']+b['width']<=256 and b['y']+b['depth']<=256 and b['z']==0
        m=trimesh.load_mesh(out/(obj['name']+'.stl'))
        assert np.allclose(m.extents,[b['width'],b['depth'],b['height']],atol=.0001)
    code=(folder/'plate_1.gcode').read_text()
    layers=[float(v) for v in re.findall(r'^; Z_HEIGHT: ([0-9.]+)',code,re.M)]
    assert len(layers)==22 and np.allclose(layers,np.arange(1,23)*.2)
    assert re.search(r'^; FEATURE: Support$',code,re.M)
    assert re.search(r'^; FEATURE: Support interface$',code,re.M)
    with zipfile.ZipFile(out/(name+'.3mf')) as z:
        embedded=json.loads(z.read('Metadata/project_settings.config'))
        assert all(embedded[k]==v for k,v in expected.items())
        root=ET.fromstring(z.read('3D/3dmodel.model'))
        ns={'m':'http://schemas.microsoft.com/3dmanufacturing/core/2015/02'}
        assert root.get('unit')=='millimeter' and len(root.findall('m:build/m:item',ns))==2
    from slice_v4 import inspect
    checks=inspect(code,out,version='V6',placements=plate['objects'])
    checks['method']=checks['method'].replace('GUI-exported','CLI-exported')
    return dict(native_project=name+'.3mf',native_project_contains_gcode=False,
                gcode=str((folder/'plate_1.gcode').relative_to(out)),layers=22,
                estimated_minutes=plate['total_predication']/60,
                filament_grams=sum(f['total_used_g'] for f in plate['filaments']),
                settings_verified=True,warnings=plate['warning_message'],layer_checks=checks,
                printer_dispatch=False)


def verify_v6(out,geometry_only=False):
    report=json.loads((out/'validation/geometry_report.json').read_text())
    result=dict(computational_geometry_status='PASS',physical_fit_status='UNTESTED',
                geometry=geometry(out,report),physical_diagnostics=report['physical_diagnostics'])
    for version in ['v4','v5']:
        manifest=json.loads((ROOT/f'revisions/{version}/output_sha256.json').read_text())
        # The original workspace verifies all prior outputs; the portable
        # package includes only the V5 comparison meshes needed by geometry().
        present={path:digest for path,digest in manifest.items() if (ROOT/path).exists()}
        assert all(sha(ROOT/path)==digest for path,digest in present.items()),version+' outputs changed'
        result[version+'_output_files_preserved']=len(present)
        result[version+'_reference_files_absent']=len(manifest)-len(present)
    name='geometry_verification.json' if geometry_only else 'final_verification.json'
    if not geometry_only:result['slicing']=slicing(out)
    (out/'validation'/name).write_text(json.dumps(result,indent=2)+'\n')
    return result
