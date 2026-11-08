"""V6: bounded, photo-guided contour refinement of the V5 fit prototype.

Photographs supply normalized curve SHAPES, not registered console surfaces.
All dimensioned endpoints remain controlled by the user's confirmed settings.
"""
from pathlib import Path
import hashlib
import json

import cadquery as cq
import numpy as np
from scipy.interpolate import PchipInterpolator

ROOT = Path(__file__).resolve().parent


def smoothstep(t):
    t = np.clip(t, 0., 1.)
    return t*t*(3-2*t)


def table_value(table, t):
    a = np.asarray(table)
    return float(np.clip(PchipInterpolator(a[:,0], a[:,1])(np.clip(t,0,1)),0,1))


def normalized_inverse(x, height):
    """Monotone inverse of a sampled rising contour, normalized at both ends."""
    x = np.asarray(x,float); height=np.maximum.accumulate(np.asarray(height,float))
    height=(height-height[0])/(height[-1]-height[0])
    x=(x-x[0])/(x[-1]-x[0])
    h, ids=np.unique(height,return_index=True)
    grid=np.linspace(0,1,17)
    vals=np.interp(grid,h,x[ids]);vals[0]=0;vals[-1]=1
    return np.c_[grid,vals].round(7).tolist()


def prepare_parameters(previous, evidence):
    """Record every photo-to-prototype mapping explicitly in the snapshot."""
    p=json.loads(json.dumps(previous)); p['revision']='prototype-v6'
    records={r['id']:r for r in evidence['records']}
    points=lambda key:np.asarray(records[key]['approximate_local_points_mm'])
    # The onset and end are deliberately normalized; no inferred station is
    # promoted to a console datum or a millimeter radius.
    a=points('P1');a=a[(a[:,0]>=90)&(a[:,0]<=118.5)]
    front=normalized_inverse(a[:,0],-a[:,1])
    a=points('P2');a=a[(a[:,0]>=.3)&(a[:,0]<=20)]
    wall=normalized_inverse(a[::-1,0],-a[::-1,1])
    # wall inverse progresses from the pad end toward the wall end.
    # Each relief table expresses remaining inward setback vs normalized Z.
    front=[[u,round(1-v,7)] for u,v in front]
    wall=[[u,round(1-v,7)] for u,v in wall]
    a=points('P3')
    upper=a[(a[:,0]>=12)&(a[:,0]<=34)]
    lower=a[(a[:,0]>=46)&(a[:,0]<=55)][::-1]
    ends={'upper':normalized_inverse(upper[:,0],-upper[:,1]),
          'lower':normalized_inverse(lower[:,0],-lower[:,1])}
    # Transverse P5 has two fully visible crowns. Average their normalized
    # shrinkage, keeping absolute aperture dimensions independent of the photo.
    u,v=points('P5').T;flat=(u>30)&(u<95)
    z=v-np.polyval(np.polyfit(u[flat],v[flat],1),u)
    levels=np.linspace(.5,4.4,17);widths=[]
    for lo,hi in [(3,28),(95,120)]:
        ids=np.flatnonzero((u>lo)&(u<hi));peak=ids[np.argmax(z[ids])]
        local=[]
        for level in levels:
            l=r=peak
            while l>0 and z[l]>level:l-=1
            while r<len(u)-1 and z[r]>level:r+=1
            assert l>0 and r<len(u)-1,'P5 flank is cropped'
            left=np.interp(level,z[l:l+2],u[l:l+2])
            right=np.interp(level,z[r-1:r+1][::-1],u[r-1:r+1][::-1])
            local.append(right-left)
        w=np.minimum.accumulate(local)
        widths.append((w[0]-w)/(w[0]-w[-1]))
    width=np.mean(widths,axis=0)
    p['photo_contours']={
        'source':'output/curve-review/profiles.json',
        'source_sha256':hashlib.sha256((ROOT/'output/curve-review/profiles.json').read_bytes()).hexdigest(),
        'horizontal_grid_bar_mm':100.,
        'registration':'SHAPE_ONLY: exact stations, contact bands and gauge angles unmeasured',
        'nub_width_progress':np.c_[np.linspace(0,1,17),width].round(7).tolist(),
        'nub_lower_end_progress':ends['lower'],'nub_upper_end_progress':ends['upper'],
        'wall_setback':wall,'front_setback':front,
        'nub_photo_weight':.5,
        'left_wall_maximum_extra_underside_setback_mm':3.,
        'left_wall_transition_height_mm':.9,
        'front_maximum_underside_setback_mm':1.5,
        'front_transition_height_mm':.5,
        'outer_loft_layers':24,
        'mappings':{
            'P1':'Lower transition shape -> both front underside rolls, capped at 1.5 mm run / 0.5 mm height.',
            'P2':'Left-wall shape -> left underside roll, capped at 3 mm run / 0.9 mm height.',
            'P3':'Separate longitudinal end shapes -> lower and upper nub end blends. Direction inferred from placement photo.',
            'P5':'Mean normalized flank narrowing -> both nub interiors, blended 50% with the prior smoothstep.',
            'P4':'Spacing and shape cross-check only; no exact Y station assigned.',
            'P6':'Not dimensionally applied: handedness and station unresolved.',
            'P7':'Not dimensionally applied: abrupt feature and station unresolved.',
            'P8':'Cross-check only: partial left feature and unknown Y station.',
            'P9':'Compound corner evidence only. Keep R15 plan outline; oblique section does not measure its XY radius.'},
        'assumptions':[
            'Normalized shapes are scaled into bounded prototype edge treatments, not fitted as exact measured surfaces.',
            'Right nub longitudinal end shapes borrow the left profile provisionally; endpoint reductions remain 6 / 5 mm.',
            'The 13.5 / 5.6 mm aperture endpoints override apparent photo widths. Physical interference may remain.',
            'The upper outline keeps the 2 mm left inset and R15 lower-left corner. Additional relief is confined to the underside.',
            'The lower rail envelope remains 1 mm high. Like V5 edge rounding, the actual leading-edge material is thinner locally.'
        ]}
    p['nub_profile_blend']='photo-guided-monotone'
    p['_notes']['wall']='V6 photo-guided underside wall roll, 3 mm maximum setback over 0.9 mm Z. Upper wall line retains the confirmed 2 mm inset and 0.5 mm clearance. R15 plan corner retained.'
    p['_notes']['nub_openings']='V6 normalized P5 flank and P3 end curves blended 50% into V5 smoothstep; 13.5 / 5.6 mm endpoints and all nub/end datums retained. Photo curve scales are provisional.'
    p['_notes']['prototype']='V6 contour fit prototype. Exact capture stations unrecorded. No verified physical fit or printer dispatch.'
    return p


def nub_blends(p, u):
    c=p['photo_contours']; s=float(smoothstep(u)); weight=c['nub_photo_weight']
    def value(key):return (1-weight)*s+weight*table_value(c[key],s)
    return value('nub_width_progress'),value('nub_lower_end_progress'),value('nub_upper_end_progress')


def setbacks(p,side,z):
    c=p['photo_contours']
    wall=(c['left_wall_maximum_extra_underside_setback_mm']*
          table_value(c['wall_setback'],z/c['left_wall_transition_height_mm'])) if side=='left' else 0.
    front=c['front_maximum_underside_setback_mm']*table_value(c['front_setback'],z/c['front_transition_height_mm'])
    return wall,front


def outline_wire(p,side,z):
    from build_model import left_wall_x
    d,e=setbacks(p,side,z)
    if side=='left':
        ymax=p['left_outer_y_max'];shoulder=min(p['left_wing_y_max'],ymax-12)
        collar=p['left_nub_x']+p['left_nub_width']/2+p['nub_clearance']+p['left_nub_collar_border']
        left=lambda y:left_wall_x(p,y)+p['left_wall_clearance']+p['left_outer_edge_inset']+d
        pts=[(left(e),e),(p['left_wing_x_max'],e),(p['left_wing_x_max'],shoulder-8),
             (collar,shoulder),(collar,ymax),(left(ymax),ymax)]
        wire=cq.Workplane('XY',origin=(0,0,z)).polyline(pts).close().val()
        lower_left=[v for v in wire.Vertices() if abs(v.X-pts[0][0])<1e-7 and abs(v.Y-e)<1e-7]
        wire=wire.fillet2D(p['left_lower_outer_corner_radius']-max(d,e),lower_left)
        wire=wire.fillet2D(p['lower_outline_radius']-e,[v for v in wire.Vertices() if abs(v.X-pts[1][0])<1e-7 and abs(v.Y-e)<1e-7])
        wire=wire.fillet2D(p['left_outline_radius'],[v for v in wire.Vertices() if any(abs(v.X-x)<1e-7 and abs(v.Y-y)<1e-7 for x,y in pts[2:])])
    else:
        xmin,xmax=p['right_outer_x_min'],p['right_outer_x_max'];ymax=p['right_outer_y_max']
        wire=cq.Workplane('XY',origin=(0,0,z)).polyline([(xmin,e),(xmax,e),(xmax,ymax),(xmin,ymax)]).close().val()
        wire=wire.fillet2D(p['lower_outline_radius']-e,[v for v in wire.Vertices() if abs(v.Y-e)<1e-7])
        wire=wire.fillet2D(p['lower_outline_radius'],[v for v in wire.Vertices() if abs(v.Y-ymax)<1e-7])
    return wire


def outer_body(p,side):
    from model_v4 import outer_body as legacy_body
    # Intersection preserves V5's upper outline, its other edge rounds and
    # its maximum-height plane. Only bounded underside material is removed.
    original,profile=legacy_body(dict(p,revision='prototype-v5'),side)
    c=p['photo_contours']
    height=max(c['left_wall_transition_height_mm'] if side=='left' else 0,
               c['front_transition_height_mm'])
    zs=sorted(set([*np.linspace(0,height,c['outer_loft_layers']+1),.5,.9,p['thickness']+1]))
    wires=[outline_wire(p,side,float(z)) for z in zs]
    envelope=cq.Workplane('XY').add(cq.Solid.makeLoft(wires,ruled=True))
    result=original.intersect(envelope).clean()
    assert result.val().isValid() and len(result.solids().vals())==1
    return result,profile


if __name__=='__main__':
    previous=json.loads((ROOT/'revisions/v5/source/parameters.json').read_text())
    evidence=json.loads((ROOT/'output/curve-review/profiles.json').read_text())
    p=prepare_parameters(previous,evidence)
    (ROOT/'parameters.json').write_text(json.dumps(p,indent=2)+'\n')
    print('Prepared V6 parameters with embedded photo shape tables and bounded dimensional assumptions.')
