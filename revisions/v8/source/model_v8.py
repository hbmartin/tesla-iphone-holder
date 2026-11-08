"""V8: photo-anchored nub fit and re-registered lower console turn.

Direct dimensions are authoritative. Interpolation and corner registration are
explicit prototype assumptions; fit samples accompany the complete inserts.
"""
from pathlib import Path
import argparse
import hashlib
import json
import math

import cadquery as cq
import numpy as np
from scipy.interpolate import PchipInterpolator
from scipy.ndimage import median_filter, gaussian_filter1d
from scipy.optimize import minimize
from shapely.geometry import Polygon, Point, box, mapping
from shapely.ops import unary_union

from build_model import ROOT, camera_rect, rounded_profile, rounded_solid, hexagons, validate_and_export
from model_v4 import derive, outer_height, phone_rect, seating_volumes, plane_volume, diagnostics


def prepare_parameters():
    p=json.loads((ROOT/'output/v7/parameters.json').read_text())
    evidence=json.loads((ROOT/'output/v8/evidence/photo_estimates.json').read_text())
    shift=evidence['crease_shift_from_V7_mm']
    for side in ['left','right']:p[side+'_nub_bottom_y']+=shift
    p.update(revision='prototype-v8',nub_fit_clearance=.3,
        nub_lower_opening_width=17.6,nub_upper_opening_width=8.1,
        nub_profile_blend='absolute-Z photo-anchored monotone PCHIP',
        nub_width_anchors=evidence['nub_width_profile_mm'],
        crease_shift_from_v7=shift,corner_bezier_controls=evidence['corner_bezier_controls_mm'],
        lower_corner_clearance=.5,lower_tip_round_radius=1.2,
        fit_clearances=[.3],nub_profile_sections=44)
    for k in ['left_corner_profile','left_corner_raw_profile','left_corner_curve','v7_evidence']:
        p.pop(k,None)
    p['v8_evidence']=dict(source='output/v8/evidence/photo_estimates.json',
        source_sha256=hashlib.sha256((ROOT/'output/v8/evidence/photo_estimates.json').read_bytes()).hexdigest(),
        photo_estimates=evidence,
        lower_termination='The phone keepout and console turn intersect. A 1.2 mm plan round removes the thin pointed tip; the left piece may terminate above Y=0 while the phone remains seated directly at the crease.')
    p['_notes'].update(
        nub_openings='17.6 mm base / 12.6 mm at Z=2 / 8.1 mm at Z=4.4. 0.3 mm per side; the Z=2 anchor is photo-estimated.',
        console='Both nub Y datums shift +6.1 mm relative to the corrected crease; left base lower Y=95, right=25.15. Pitch and lengths unchanged.',
        wall='Upper measured gaps plus 0.5 mm clearance and requested 2 mm inset retained. Lower wall blends independently into a photo-registered turn with 0.5 mm allowance.',
        prototype='V8 reduces excess V7 side clearance and completes the lower console turn using authorized photo estimates. Physical fit untested.')
    return derive(p)


def nub_width(p,z,clearance=None):
    """Physical pad-normal height, with measured and photograph-estimated anchors."""
    c=p['nub_fit_clearance'] if clearance is None else clearance
    a=np.asarray(p['nub_width_anchors'])
    return float(PchipInterpolator(a[:,0],a[:,1])(np.clip(z,0,4.4)))+2*c


def nub_wire(p,side,z,clearance=None):
    w=nub_width(p,z,clearance);cx=p[side+'_nub_x']
    bottom=p[side+'_nub_bottom_y']-p['nub_end_clearance']
    top=p[side+'_nub_bottom_y']+p[side+'_nub_length']+p['nub_end_clearance']
    r=p['nub_end_cap_run'];lo=bottom+r;hi=top-r
    edges=[cq.Edge.makeLine((cx+w/2,lo,z),(cx+w/2,hi,z)),
           cq.Edge.makeEllipse(w/2,r,(cx,hi,z),angle1=0,angle2=180),
           cq.Edge.makeLine((cx-w/2,hi,z),(cx-w/2,lo,z)),
           cq.Edge.makeEllipse(w/2,r,(cx,lo,z),angle1=180,angle2=360)]
    return cq.Wire.assembleEdges(edges)


def nub_cutter(p,side,clearance=None):
    zs=[-.5,*np.linspace(0,p['nub_measured_upper_z'],p['nub_profile_sections']+1),p['thickness']+1]
    return cq.Workplane('XY').add(cq.Solid.makeLoft([nub_wire(p,side,float(z),clearance) for z in zs],ruled=True))


def wall_x(p,y):
    """Upper measured wall only; the lower contour has its own registration."""
    f=(y-p['left_nub_bottom_y'])/p['left_nub_length']
    return p['left_nub_x']-8.5-p['left_wall_gap_bottom']-f*(p['left_wall_gap_top']-p['left_wall_gap_bottom'])


def setbacks(p,z):
    # Quarter-ellipse offset: smooth edge roll with zero final setback.
    def roll(run,height):
        t=float(np.clip(z/height,0,1))
        return run*(1-math.sqrt(max(0,1-(1-t)**2)))
    return roll(p['left_wall_underside_setback'],p['left_wall_transition_height']),roll(p['front_underside_setback'],p['front_transition_height'])


def corner_points(p,z):
    from estimate_v8 import bezier
    t=np.linspace(0,1,61)
    ctrl=np.array(p['corner_bezier_controls'])
    q=bezier(ctrl,t)
    dctrl=3*np.diff(ctrl,axis=0)
    tt=t[:,None]
    tangent=(1-tt)**2*dctrl[0]+2*(1-tt)*tt*dctrl[1]+tt**2*dctrl[2]
    normal=np.c_[-tangent[:,1],tangent[:,0]]
    normal/=np.linalg.norm(normal,axis=1)[:,None]
    wall,front=setbacks(p,z)
    q+=normal*(np.array([wall,front])+p['lower_corner_clearance'])
    return q


def left_path(p,z):
    corner=corner_points(p,z);y0=corner[0,1];x0=corner[0,0]
    d,_=setbacks(p,z);ymax=p['left_outer_y_max'];lo=p['left_nub_bottom_y'];hi=lo+p['left_nub_length']
    def upper(y):return wall_x(p,y)+p['left_wall_clearance']+p['left_outer_edge_inset']+d
    # The photograph locates the lower endpoint independently. Upper wall
    # measurements constrain only their own stations; no lower extrapolation.
    ys=[y0,lo,hi,ymax];xs=[x0,upper(lo),upper(hi),upper(ymax)]
    f=PchipInterpolator(ys,xs)
    # Include both measured stations as exact spline interpolation points.
    yy=np.array(sorted(set([*np.linspace(ymax,y0,50),lo,hi]),reverse=True))
    return np.r_[np.c_[f(yy),yy],corner[1:]]


def left_outline_wire(p,z):
    path=left_path(p,z);end=path[-1]
    ymax=p['left_outer_y_max'];shoulder=p['left_wing_y_max']
    collar=p['left_nub_x']+p['left_nub_width']/2+p['nub_clearance']+p['left_nub_collar_border']
    vertices=[tuple(end),(p['left_wing_x_max'],end[1]),
              (p['left_wing_x_max'],shoulder-8),(collar,shoulder),(collar,ymax),tuple(path[0])]
    assert vertices[1][0]>vertices[0][0]
    wp=cq.Workplane('XY',origin=(0,0,z)).moveTo(*vertices[0])
    for pt in vertices[1:]:wp=wp.lineTo(*pt)
    wp=wp.spline([tuple(q) for q in path[1:]],includeCurrent=True).close()
    wire=wp.val()
    wire=wire.fillet2D(p['left_outline_radius'],[v for v in wire.Vertices()
        if any(abs(v.X-x)<1e-5 and abs(v.Y-y)<1e-5 for x,y in vertices[2:5])])
    return wire


def outer_body(p,side):
    if side=='right':
        # Keep the established right external envelope and front edge roll.
        from model_v6 import outer_body as old_body
        old=json.loads((ROOT/'revisions/v6/source/parameters.json').read_text())
        q=dict(p,revision='prototype-v6',photo_contours=old['photo_contours'])
        return old_body(q,side)
    zs=sorted(set([0.,.025,.05,.075,*np.linspace(.1,.9,17),1.]))
    wires=[left_outline_wire(p,float(z)) for z in zs]
    underside=cq.Workplane('XY').add(cq.Solid.makeLoft(wires,ruled=True))
    # Keep the constant upper outline as an exact prism: extending the many-
    # station loft upward allowed OCC to move the wall stations by ~0.04 mm.
    upper=cq.Workplane('XY').add(wires[-1]).toPending().extrude(p['thickness'])
    solid=underside.union(upper)
    solid=solid.intersect(plane_volume(p['lower_edge_thickness'],p['outer_top_slope'])).clean()
    points,_=wires[-1].sample(.015)
    return solid,Polygon([(v.x,v.y) for v in points])


def nub_plan(p,side,z=0,clearance=None):
    pts,_=nub_wire(p,side,z,clearance).sample(.01)
    return Polygon([(v.x,v.y) for v in pts])


def build_insert(p,side):
    solid,outer=outer_body(p,side)
    cam=camera_rect(p);cp=rounded_profile(*cam)
    center=(p['phone_center_x'],p['charging_open_offset_y'])
    charge=Point(*center).buffer(p['charging_open_radius'],quad_segs=192)
    seat=rounded_profile(*phone_rect(p,p['phone_seating_clearance'])).intersection(box(-50,-1,150,36))
    safe=outer.difference(nub_plan(p,side)).difference(cp).difference(charge).difference(seat)
    reserve=max(p['left_wall_underside_setback'] if side=='left' else p['front_underside_setback'],p['left_console_edge_radius'] if side=='left' else p['underside_edge_radius'])
    holes=[h for h in hexagons(safe,dict(p,edge_chamfer=0,solid_border=p['solid_border']+reserve)) if h.bounds[1]>=36]
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
    # The sampled plan-round cutter can leave micron-scale disconnected tips
    # where it crosses the curved underside. Keep only the connected insert,
    # with tight size/location guards so an actual broken part cannot pass.
    discarded_tip_volume=0.
    components=sorted(solid.solids().vals(),key=lambda s:s.Volume(1e-7),reverse=True)
    if len(components)>1:
        crumbs=components[1:]
        discarded_tip_volume=sum(s.Volume(1e-7) for s in crumbs)
        assert side=='left' and discarded_tip_volume<.01
        assert all(s.BoundingBox().ymax<12 for s in crumbs)
        assert components[0].Volume(1e-7)>1000
        solid=cq.Workplane('XY').add(components[0])
    info=dict(side=side,holes=holes,profile=safe,base_profile=safe.difference(unary_union(holes)),
              discarded_tip_volume_mm3=discarded_tip_volume,
              final_profile=outer.difference(cp).difference(charge).difference(seat).difference(nub_plan(p,side,4.4)).difference(unary_union(holes)))
    return solid,info


def build_nub_sample(p,side,c):
    # Full length collars match the installed absolute height and slope.
    # A wall-side tab carries a recessed identifier; it does not bridge the nub.
    cx=p[side+'_nub_x'];lo=p[side+'_nub_bottom_y']-p['nub_end_clearance'];hi=lo+p[side+'_nub_length']+2*p['nub_end_clearance']
    width=17+2*c+6
    solid=rounded_solid(cx,(lo+hi)/2,width,hi-lo+6,3,5.4)
    solid=solid.intersect(plane_volume(1,p['outer_top_slope']))
    solid=solid.cut(nub_cutter(p,side,c))
    # Identification is cut into the upper end bridge, outside the aperture.
    code=f'{side[0].upper()}8'
    top=outer_height(p,hi+1.5)
    text=cq.Workplane('XY').text(code,2.7,.6,font='Arial',kind='bold',halign='center',valign='center',combine=True).translate((cx,hi+1.55,top-.45))
    solid=solid.cut(text).clean()
    return solid


def build_corner_sample(p,part):
    # Actual lower 40 mm of the left insert, separated from the binding nub.
    clip=cq.Workplane('XY').box(100,40,10,centered=False).translate((-50,0,-1))
    solid=part.intersect(clip).clean()
    y=34.;x=(float(np.interp(y,left_path(p,2)[::-1,1],left_path(p,2)[::-1,0]))+10.75)/2
    text=cq.Workplane('XY').text('C8',4,.6,font='Arial',kind='bold',halign='center',valign='center',combine=True).translate((x,y,outer_height(p,y)-.45))
    return solid.cut(text).clean()


def build(parameters=None,out=ROOT/'output/v8'):
    p=prepare_parameters() if parameters is None else derive(parameters)
    out=Path(out)
    for folder in [out,out/'fit_tests',out/'previews',out/'validation',out/'slicer']:folder.mkdir(parents=True,exist_ok=True)
    parts={};infos={};reports=[];assembly=cq.Assembly(name='Tesla_iPhone_holder_V8_PROTOTYPE')
    for side,col in [('left',(.08,.61,.59)),('right',(.94,.48,.22))]:
        print('Building V8',side,'insert',flush=True)
        solid,info=build_insert(p,side)
        reports.append(validate_and_export(solid,out/f'{side}_insert_PROTOTYPE.stl','insert',info,dict(p,edge_chamfer=0)))
        cq.exporters.export(solid,str(out/f'{side}_insert_PROTOTYPE.step'))
        parts[side]=solid;infos[side]=info;assembly.add(solid,name=side+'_insert',color=cq.Color(*col))
    assembly.export(str(out/'holder_assembled_PROTOTYPE.step'))
    cq.exporters.export(cq.Compound.makeCompound([v.val() for v in parts.values()]),str(out/'holder_assembled_geometry.3mf'),tolerance=p['stl_tolerance'],angularTolerance=p['stl_angular_tolerance'])
    overlap=parts['left'].intersect(parts['right']).val().Volume();assert overlap<1e-6
    seating={s:[v.intersect(k).val().Volume() for k in seating_volumes(p)] for s,v in parts.items()}
    assert max(v for row in seating.values() for v in row)<1e-6
    for c in p['fit_clearances']:
        for side in ['left','right']:
            name=f'{side}_nub_fit_V8'
            print('Building fit sample',name,flush=True)
            solid=build_nub_sample(p,side,c)
            reports.append(validate_and_export(solid,out/'fit_tests'/f'{name}.stl','nub_fit_sample',p=p))
            cq.exporters.export(solid,str(out/'fit_tests'/f'{name}.step'))
    corner=build_corner_sample(p,parts['left'])
    reports.append(validate_and_export(corner,out/'fit_tests/lower_left_corner_C8.stl','corner_fit_sample',p=p))
    cq.exporters.export(corner,str(out/'fit_tests/lower_left_corner_C8.step'))
    report=dict(revision=p['revision'],parameters=p,parts=reports,
        assembly_checks=dict(overlap_mm3=overlap,phone_seating_interference_mm3=seating),
        manufacturing_cleanup={s:dict(discarded_disconnected_tip_volume_mm3=i['discarded_tip_volume_mm3']) for s,i in infos.items()},
        physical_diagnostics=diagnostics(p),
        opening_dimensions=[dict(z=z,width=nub_width(p,z)) for z in [0,1,2,3,4,4.4]],
        fit_sample_labels={'L8/R8':'.3 mm per side; photo-anchored profile; matches full inserts','C8':'Actual lower 40 mm of left insert, no nub constraint'})
    (out/'parameters.json').write_text(json.dumps(p,indent=2)+'\n')
    (out/'validation/geometry_report.json').write_text(json.dumps(report,indent=2)+'\n')
    for name,key in [('planar_profiles','final_profile'),('base_profiles','base_profile')]:
        (out/'validation'/f'{name}.json').write_text(json.dumps({s:mapping(i[key]) for s,i in infos.items()})+'\n')
    return parts,infos,report


if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('--output',type=Path,default=ROOT/'output/v8');args=ap.parse_args()
    build(out=args.output)
