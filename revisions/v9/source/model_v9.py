"""V9 opening-only fit corrections; exterior datums remain those of V8."""
import hashlib
import json
import cadquery as cq
import numpy as np
from scipy.interpolate import PchipInterpolator
from shapely.geometry import Point, Polygon, box, mapping
from shapely.ops import unary_union
from build_model import ROOT, camera_rect, rounded_profile, rounded_solid, hexagons, validate_and_export
from model_v4 import derive, phone_rect, seating_volumes, diagnostics
from model_v8 import outer_body, nub_plan as v8_nub_plan


def prepare_parameters():
    p=json.loads((ROOT/'output/v8/parameters.json').read_text())
    p.update(revision='prototype-v9',
             left_opening_x_offset=-.5, right_opening_x_offset=0.,
             left_opening_side_clearance=.3, right_opening_side_clearance=.2,
             left_opening_lower_clearance=.7, right_opening_lower_clearance=.7,
             left_opening_upper_clearance=.7, right_opening_upper_clearance=.3)
    # Legacy scalar width fields do not describe the now-different openings.
    for k in ['nub_lower_opening_width','nub_upper_opening_width','fit_clearances']:
        p.pop(k,None)
    p['_notes'].update(
        nub_openings='V9 left: -0.5 mm X shift, 0.3 mm side / 0.7 mm each end. Right: 0.2 mm side, 0.7 mm lower / 0.3 mm upper; only upper end shortened 0.4 mm.',
        console='Exterior and all reference datums are unchanged from V8. Opening offsets are independent of exterior coordinates.',
        prototype='V9 responds to IMG_0201/0202 and user-approved fit adjustments. Physical fit untested.')
    p['v9_evidence']={
        'date':'2026-11-05',
        'basis':'User-approved V9 plan: left shift 0.5 mm; right narrower 0.2 mm total, upper end shortened 0.4 mm; bottom fixed.',
        'baseline':'output/v8/parameters.json',
        'baseline_sha256':hashlib.sha256((ROOT/'output/v8/parameters.json').read_bytes()).hexdigest(),
        'photos':{n:hashlib.sha256((ROOT/n).read_bytes()).hexdigest() for n in ['IMG_0201.jpeg','IMG_0202.jpeg']},
        'limitation':'Adjustments are fit-test corrections, not dimensions measured from these photographs.'}
    return derive(p)


def opening_center(p,side):
    return p[side+'_nub_x']+p[side+'_opening_x_offset']


def opening_ends(p,side):
    return (p[side+'_nub_bottom_y']-p[side+'_opening_lower_clearance'],
            p[side+'_nub_bottom_y']+p[side+'_nub_length']+p[side+'_opening_upper_clearance'])


def nub_width(p,side,z):
    a=np.asarray(p['nub_width_anchors'])
    return float(PchipInterpolator(a[:,0],a[:,1])(np.clip(z,a[0,0],a[-1,0])))+2*p[side+'_opening_side_clearance']


def nub_wire(p,side,z):
    w=nub_width(p,side,z);cx=opening_center(p,side)
    bottom,top=opening_ends(p,side);r=p['nub_end_cap_run'];lo=bottom+r;hi=top-r
    return cq.Wire.assembleEdges([
        cq.Edge.makeLine((cx+w/2,lo,z),(cx+w/2,hi,z)),
        cq.Edge.makeEllipse(w/2,r,(cx,hi,z),angle1=0,angle2=180),
        cq.Edge.makeLine((cx-w/2,hi,z),(cx-w/2,lo,z)),
        cq.Edge.makeEllipse(w/2,r,(cx,lo,z),angle1=180,angle2=360)])


def nub_cutter(p,side):
    zs=[-.5,*np.linspace(0,p['nub_measured_upper_z'],p['nub_profile_sections']+1),p['thickness']+1]
    return cq.Workplane('XY').add(cq.Solid.makeLoft([nub_wire(p,side,float(z)) for z in zs],ruled=True))


def nub_plan(p,side,z=0):
    pts,_=nub_wire(p,side,z).sample(.01)
    return Polygon([(v.x,v.y) for v in pts])


def build_insert(p,side):
    solid,outer=outer_body(p,side)
    cam=camera_rect(p);cp=rounded_profile(*cam)
    center=(p['phone_center_x'],p['charging_open_offset_y'])
    charge=Point(*center).buffer(p['charging_open_radius'],quad_segs=192)
    seat=rounded_profile(*phone_rect(p,p['phone_seating_clearance'])).intersection(box(-50,-1,150,36))
    # Preserve the exact V8 honeycomb selection. Validate against the new hole.
    old_safe=outer.difference(v8_nub_plan(p,side)).difference(cp).difference(charge).difference(seat)
    safe=outer.difference(nub_plan(p,side)).difference(cp).difference(charge).difference(seat)
    reserve=max(p['left_wall_underside_setback'] if side=='left' else p['front_underside_setback'],p['left_console_edge_radius'] if side=='left' else p['underside_edge_radius'])
    holes=[h for h in hexagons(old_safe,dict(p,edge_chamfer=0,solid_border=p['solid_border']+reserve)) if h.bounds[1]>=36]
    solid=solid.cut(rounded_solid(*cam,10,z=-1))
    solid=solid.cut(cq.Workplane('XY').workplane(offset=-1).center(*center).circle(p['charging_open_radius']).extrude(10))
    for vol in seating_volumes(p):solid=solid.cut(vol)
    if side=='left':
        footprint=outer.difference(seat)
        rounded=footprint.buffer(-p['lower_tip_round_radius'],quad_segs=24).buffer(p['lower_tip_round_radius'],quad_segs=24).intersection(footprint)
        trim=footprint.difference(rounded).intersection(box(-50,-1,50,12))
        polygons=list(trim.geoms) if hasattr(trim,'geoms') else [trim]
        for poly in polygons:
            if poly.geom_type=='Polygon' and poly.area>.03:
                cutter=cq.Workplane('XY').workplane(offset=-1).polyline(list(poly.exterior.coords)[:-1]).close().extrude(10)
                solid=solid.cut(cutter)
    if holes:
        cuts=[cq.Workplane('XY').workplane(offset=-1).polyline(list(h.exterior.coords)[:-1]).close().extrude(10).val() for h in holes]
        solid=solid.cut(cq.Compound.makeCompound(cuts))
    solid=solid.cut(nub_cutter(p,side)).clean()
    components=sorted(solid.solids().vals(),key=lambda s:s.Volume(1e-7),reverse=True)
    discarded=0.
    if len(components)>1:
        crumbs=components[1:];discarded=sum(s.Volume(1e-7) for s in crumbs)
        assert side=='left' and discarded<.01
        assert all(s.BoundingBox().ymax<12 for s in crumbs) and components[0].Volume(1e-7)>1000
        solid=cq.Workplane('XY').add(components[0])
    info=dict(side=side,holes=holes,profile=safe,base_profile=safe.difference(unary_union(holes)),
              discarded_tip_volume_mm3=discarded,
              final_profile=outer.difference(cp).difference(charge).difference(seat).difference(nub_plan(p,side,4.4)).difference(unary_union(holes)))
    return solid,info


def build(parameters=None,out=ROOT/'output/v9'):
    p=prepare_parameters() if parameters is None else derive(parameters);out=ROOT/out
    for folder in [out,out/'previews',out/'validation',out/'slicer',out/'evidence']:folder.mkdir(parents=True,exist_ok=True)
    parts={};infos={};reports=[];assembly=cq.Assembly(name='Tesla_iPhone_holder_V9_PROTOTYPE')
    for side,col in [('left',(.08,.61,.59)),('right',(.94,.48,.22))]:
        print('Building V9',side,'insert',flush=True)
        solid,info=build_insert(p,side)
        reports.append(validate_and_export(solid,out/f'{side}_insert_PROTOTYPE.stl','insert',info,dict(p,edge_chamfer=0)))
        cq.exporters.export(solid,str(out/f'{side}_insert_PROTOTYPE.step'))
        parts[side]=solid;infos[side]=info;assembly.add(solid,name=side+'_insert',color=cq.Color(*col))
    assembly.export(str(out/'holder_assembled_PROTOTYPE.step'))
    cq.exporters.export(cq.Compound.makeCompound([v.val() for v in parts.values()]),str(out/'holder_assembled_geometry.3mf'),tolerance=p['stl_tolerance'],angularTolerance=p['stl_angular_tolerance'])
    overlap=parts['left'].intersect(parts['right']).val().Volume();assert overlap<1e-6
    seating={s:[v.intersect(k).val().Volume() for k in seating_volumes(p)] for s,v in parts.items()}
    assert max(v for row in seating.values() for v in row)<1e-6
    report=dict(revision=p['revision'],parameters=p,parts=reports,
        assembly_checks=dict(overlap_mm3=overlap,phone_seating_interference_mm3=seating),
        manufacturing_cleanup={s:dict(discarded_disconnected_tip_volume_mm3=i['discarded_tip_volume_mm3']) for s,i in infos.items()},
        physical_diagnostics=diagnostics(p),
        opening_dimensions={s:dict(center_x_mm=opening_center(p,s),endpoints_y_mm=opening_ends(p,s),widths=[dict(z=z,width=nub_width(p,s,z)) for z in [0,1,2,3,4,4.4]]) for s in parts})
    (out/'parameters.json').write_text(json.dumps(p,indent=2)+'\n')
    (out/'evidence/fit_adjustments.json').write_text(json.dumps(p['v9_evidence'],indent=2)+'\n')
    (out/'validation/geometry_report.json').write_text(json.dumps(report,indent=2)+'\n')
    for name,key in [('planar_profiles','final_profile'),('base_profiles','base_profile')]:
        (out/'validation'/f'{name}.json').write_text(json.dumps({s:mapping(i[key]) for s,i in infos.items()})+'\n')
    return parts,infos,report


if __name__=='__main__':build()
