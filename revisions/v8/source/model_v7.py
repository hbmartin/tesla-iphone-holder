"""V7: measured absolute-height nub clearance and independently traced corner.

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
    p=json.loads((ROOT/'revisions/v6/source/parameters.json').read_text())
    records=json.loads((ROOT/'output/new-curve-review/measurements.json').read_text())
    a=np.asarray(next(r for r in records['records'] if r['id']=='N4')['approximate_local_points_mm'])
    u,v=a.T
    baseline=np.polyfit(u[(u>10)&(u<85)],v[(u>10)&(u<85)],1)
    offset=-(v-np.polyval(baseline,u))
    # Preserve gauge-scale run and offset. Only remove pin-edge noise; never
    # normalize the curve into a preselected radius or old corner dimensions.
    us=np.arange(94,u.max(),.25)
    ds=np.interp(us,u,offset)
    ds=gaussian_filter1d(median_filter(ds,size=5),1.2)
    ds=np.maximum.accumulate(np.maximum(ds,0))
    ys=us[-1]-us
    sampled=np.arange(0,float(ys.max()),1.)
    values=np.interp(sampled,ys[::-1],ds[::-1])
    corner=np.c_[sampled,values].round(5).tolist()+[[round(float(ys.max())+1,5),0.]]
    raw_corner=corner
    a=np.asarray(corner);run=a[-1,0];extent=a[0,1];t=1-a[:,0]/run
    basis=extent*np.c_[t**2,t**3,t**4]
    fitted=minimize(lambda w:np.mean((basis@w-a[:,1])**2),[.3,.4,.3],
                    bounds=[(0,1)]*3,constraints={'type':'eq','fun':lambda w:w.sum()-1})
    assert fitted.success
    residual=basis@fitted.x-a[:,1]
    corner=np.c_[a[:,0],basis@fitted.x].round(6).tolist()
    curve=dict(run_mm=float(run),inward_extent_mm=float(extent),powers=[2,3,4],
               weights=fitted.x.tolist(),rms_residual_to_trace_mm=float(np.sqrt(np.mean(residual**2))),
               max_residual_to_trace_mm=float(np.max(np.abs(residual))))
    p.pop('photo_contours',None)
    p.update(revision='prototype-v7',stl_tolerance=.005,stl_angular_tolerance=.03,cad_mass_tolerance=1e-7,left_nub_width=17.,right_nub_width=17.,
        nub_base_gap=76.,nub_measured_base_width=17.,nub_measured_upper_width=7.5,
        nub_measured_upper_z=4.4,nub_fit_clearance=.5,nub_end_clearance=.7,
        nub_lower_opening_width=18.,nub_upper_opening_width=8.5,
        nub_profile_blend='absolute-Z elliptical envelope',nub_profile_sections=44,
        nub_end_cap_run=2.5,
        left_nub_upper_bottom_reduction=0.,left_nub_upper_top_reduction=0.,
        right_nub_upper_bottom_reduction=0.,right_nub_upper_top_reduction=0.,
        left_wall_gap_bottom=10.3,left_wall_gap_top=14.7,
        fit_clearances=[.3,.5,.7],
        left_corner_profile=corner,left_corner_raw_profile=raw_corner,left_corner_curve=curve,left_corner_join_radius=.45,
        left_lower_outer_corner_radius=None,
        left_wall_underside_setback=3.,left_wall_transition_height=.9,
        front_underside_setback=1.5,front_transition_height=.5)
    p['v7_evidence']={
        'source':'output/new-curve-review/measurements.json',
        'source_sha256':hashlib.sha256((ROOT/'output/new-curve-review/measurements.json').read_bytes()).hexdigest(),
        'direct_dimensions':{'nub_base_width':17.,'nub_width_at_z_4_4':7.5,
             'left_nub_to_wall_lower_gap':10.3,'left_nub_to_wall_upper_gap':14.7},
        'gap_reference':'Wide nub base edge to inside wall, sideways; confirmed by user.',
        'height_reference':'User confirmed 7.5 mm at about 4.4 mm above the flat pad, not the crown.',
        'nub_center_pitch':{'mm':93.,'status':'Retained established position; new photos supply no replacement measured pitch.'},
        'nub_end_positions':'Retain established base footprints. Unregistered axial photos do not justify exact new end reductions.',
        'nub_intermediate_shape':'Elliptical transverse envelope through the two measured width/height anchors. Wider than a straight interpolation; intermediate widths are unmeasured.',
        'nub_end_shape':'Rounded elliptic caps with 2.5 mm axial run; full base length plus 0.7 mm end allowance through all heights. Deliberate axial relief replaces 2/2 and 6/5 mm reductions.',
        'corner_plan':{'pair':'N4 / IMG_0188 + IMG_0189','run_mm':float(corner[-1][0]),
             'inward_offset_mm':float(corner[0][1]),'scale':'Approximate molded-gauge ruler scale, not calibrated 3D metrology.',
             'registration':'Lowest captured corner point aligned to lower crease Y=0; straight portion follows the new side-gap reference line. Exact physical alignment remains provisional.',
             'processing':'Baseline removal and pin-noise filtering, followed by a smooth convex polynomial fit. Run and endpoint offset retained; no rescaling to R15.',
             'fit_rms_residual_mm':curve['rms_residual_to_trace_mm'],
             'fit_max_residual_mm':curve['max_residual_to_trace_mm'],
             'residual_note':'Fit residual is relative to the photographed pin silhouette, not a physical accuracy bound.'},
        'other_pairs':{'N1':'Confirms separate nub flank features; direct dimensions control width.',
             'N2':'Independent long/right axial evidence, full pad baseline absent: no exact end recession inferred.',
             'N3':'Independent short/left axial evidence, no marked Y/Z datum: no profile borrowed for right nub.',
             'N5':'Second corner section contains a border step and uncertain section plane; retained as evidence, not converted into a false 3D surface.',
             'N6':'10.3 mm lower side gap; direct dimension applied.',
             'N7':'14.7 mm upper side gap; direct dimension applied.'},
        'underside':'Retain bounded 3 mm wall / 1.5 mm front relief with rounded progression. Combined with new plan contour; not an exact measured underside.',
        'test_sequence':'Nub clearance collars and independent corner sample before a complete fit test. No printer dispatch.'}
    p['_notes'].update(
        nub_openings='18 mm base / 8.5 mm at absolute Z=4.4 for the selected 0.5 mm per-side clearance. Width does not use local-height fraction.',
        console='Both measured nub bases are 17 mm; 93 mm center spacing and historical base Y positions retained. Derived gap between bases is 76 mm.',
        wall='10.3 / 14.7 mm base-edge side gaps; 0.5 mm wall allowance plus the requested 2 mm inset retained. N4 traced corner replaces R15.',
        prototype='V7 full geometry and isolated fit samples. Numerical dimensions checked; physical console fit untested.')
    return derive(p)


def nub_width(p,z,clearance=None):
    """Pad-normal height, never normalized local thickness."""
    c=p['nub_fit_clearance'] if clearance is None else clearance
    base,top,h=p['nub_measured_base_width'],p['nub_measured_upper_width'],p['nub_measured_upper_z']
    height=h/math.sqrt(1-(top/base)**2)
    return base*math.sqrt(max(0.,1-(np.clip(z,0,h)/height)**2))+2*c


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
    f=(y-p['left_nub_bottom_y'])/p['left_nub_length']
    return p['left_nub_x']-p['nub_measured_base_width']/2-p['left_wall_gap_bottom']-f*(p['left_wall_gap_top']-p['left_wall_gap_bottom'])


def corner_offset(p,y):
    c=p['left_corner_curve'];t=1-float(np.clip(y/c['run_mm'],0,1))
    return c['inward_extent_mm']*sum(w*t**power for w,power in zip(c['weights'],c['powers']))


def setbacks(p,z):
    # Quarter-ellipse offset: smooth edge roll with zero final setback.
    def roll(run,height):
        t=float(np.clip(z/height,0,1))
        return run*(1-math.sqrt(max(0,1-(1-t)**2)))
    return roll(p['left_wall_underside_setback'],p['left_wall_transition_height']),roll(p['front_underside_setback'],p['front_transition_height'])


def left_edge(p,y,z):
    d,_=setbacks(p,z)
    return wall_x(p,y)+p['left_wall_clearance']+p['left_outer_edge_inset']+corner_offset(p,y)+d


def left_outline_wire(p,z):
    _,e=setbacks(p,z);ymax=p['left_outer_y_max'];shoulder=p['left_wing_y_max']
    collar=p['left_nub_x']+p['left_nub_width']/2+p['nub_clearance']+p['left_nub_collar_border']
    blend=2*p['left_corner_join_radius']
    vertices=[(left_edge(p,e,z)+blend/2,e),(p['left_wing_x_max'],e),
              (p['left_wing_x_max'],shoulder-8),(collar,shoulder),(collar,ymax),(left_edge(p,ymax,z),ymax)]
    wp=cq.Workplane('XY',origin=(0,0,z)).moveTo(*vertices[0])
    for pt in vertices[1:]:wp=wp.lineTo(*pt)
    # Only the lower side is curved; its upper continuation is a measured line.
    join=p['left_corner_profile'][-1][0]
    wp=wp.lineTo(left_edge(p,join,z),join)
    yy=np.linspace(join,e+blend,45)[1:]
    wp=wp.spline([(left_edge(p,float(y),z),float(y)) for y in yy],includeCurrent=True)
    slope=(left_edge(p,e+blend+.001,z)-left_edge(p,e+blend-.001,z))/.002
    x0=left_edge(p,e+blend,z)
    wp=wp.bezier([(x0-slope*blend/3,e+2*blend/3),
                  (vertices[0][0]-blend/3,e),vertices[0]],includeCurrent=True).close()
    wire=wp.val()
    def pick(pt):return [v for v in wire.Vertices() if abs(v.X-pt[0])<1e-5 and abs(v.Y-pt[1])<1e-5]
    wire=wire.fillet2D(max(.5,p['lower_outline_radius']-e),pick(vertices[1]))
    wire=wire.fillet2D(p['left_outline_radius'],[v for v in wire.Vertices() if any(abs(v.X-x)<1e-5 and abs(v.Y-y)<1e-5 for x,y in vertices[2:])])
    return wire


def outer_body(p,side):
    if side=='right':
        # Keep the established right external envelope and front edge roll.
        from model_v6 import outer_body as old_body
        old=json.loads((ROOT/'revisions/v6/source/parameters.json').read_text())
        q=dict(p,revision='prototype-v6',photo_contours=old['photo_contours'])
        return old_body(q,side)
    zs=sorted(set([0.,.025,.05,.075,*np.linspace(.1,.9,17),1.,p['thickness']+1]))
    wires=[left_outline_wire(p,float(z)) for z in zs]
    solid=cq.Workplane('XY').add(cq.Solid.makeLoft(wires,ruled=True))
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
    if holes:
        cuts=[cq.Workplane('XY').workplane(offset=-1).polyline(list(h.exterior.coords)[:-1]).close().extrude(10).val() for h in holes]
        solid=solid.cut(cq.Compound.makeCompound(cuts))
    solid=solid.cut(nub_cutter(p,side)).clean()
    info=dict(side=side,holes=holes,profile=safe,base_profile=safe.difference(unary_union(holes)),
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
    code=f'{side[0].upper()}{int(c*10)}'
    top=outer_height(p,hi+1.5)
    text=cq.Workplane('XY').text(code,2.7,.6,font='Arial',kind='bold',halign='center',valign='center',combine=True).translate((cx,hi+1.55,top-.45))
    solid=solid.cut(text).clean()
    return solid


def build_corner_sample(p,part):
    # Actual lower 40 mm of the left insert, separated from the binding nub.
    clip=cq.Workplane('XY').box(100,40,10,centered=False).translate((-50,0,-1))
    solid=part.intersect(clip).clean()
    y=34.;x=(left_edge(p,y,2)+10.75)/2
    text=cq.Workplane('XY').text('C7',4,.6,font='Arial',kind='bold',halign='center',valign='center',combine=True).translate((x,y,outer_height(p,y)-.45))
    return solid.cut(text).clean()


def build(parameters=None,out=ROOT/'output/v7'):
    p=prepare_parameters() if parameters is None else derive(parameters)
    out=Path(out)
    for folder in [out,out/'fit_tests',out/'previews',out/'validation',out/'slicer']:folder.mkdir(parents=True,exist_ok=True)
    parts={};infos={};reports=[];assembly=cq.Assembly(name='Tesla_iPhone_holder_V7_PROTOTYPE')
    for side,col in [('left',(.08,.61,.59)),('right',(.94,.48,.22))]:
        print('Building V7',side,'insert',flush=True)
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
            name=f'{side}_nub_clearance_{int(c*10):02d}'
            print('Building fit sample',name,flush=True)
            solid=build_nub_sample(p,side,c)
            reports.append(validate_and_export(solid,out/'fit_tests'/f'{name}.stl','nub_fit_sample',p=p))
            cq.exporters.export(solid,str(out/'fit_tests'/f'{name}.step'))
    corner=build_corner_sample(p,parts['left'])
    reports.append(validate_and_export(corner,out/'fit_tests/lower_left_corner_C7.stl','corner_fit_sample',p=p))
    cq.exporters.export(corner,str(out/'fit_tests/lower_left_corner_C7.step'))
    report=dict(revision=p['revision'],parameters=p,parts=reports,
        assembly_checks=dict(overlap_mm3=overlap,phone_seating_interference_mm3=seating),
        physical_diagnostics=diagnostics(p),
        opening_dimensions=[dict(z=z,width=nub_width(p,z)) for z in [0,1,2,3,4,4.4]],
        fit_sample_labels={'L3/R3':'.3 mm per side','L5/R5':'.5 mm per side; matches full inserts','L7/R7':'.7 mm per side','C7':'Actual lower 40 mm of left insert, no nub constraint'})
    (out/'parameters.json').write_text(json.dumps(p,indent=2)+'\n')
    (out/'validation/geometry_report.json').write_text(json.dumps(report,indent=2)+'\n')
    for name,key in [('planar_profiles','final_profile'),('base_profiles','base_profile')]:
        (out/'validation'/f'{name}.json').write_text(json.dumps({s:mapping(i[key]) for s,i in infos.items()})+'\n')
    return parts,infos,report


if __name__=='__main__':
    ap=argparse.ArgumentParser();ap.add_argument('--output',type=Path,default=ROOT/'output/v7');args=ap.parse_args()
    build(out=args.output)
