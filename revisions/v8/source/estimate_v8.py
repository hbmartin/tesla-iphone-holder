"""Use existing photographs for explicitly approximate V8 fit inputs."""
from pathlib import Path
import json,hashlib
import numpy as np
from scipy.optimize import least_squares
from scipy.ndimage import gaussian_filter1d

ROOT=Path(__file__).resolve().parent
OUT=ROOT/'output/v8/evidence'

def bezier(control,t):
    t=np.asarray(t)[:,None];p=np.asarray(control)
    return (1-t)**3*p[0]+3*(1-t)**2*t*p[1]+3*(1-t)*t*t*p[2]+t**3*p[3]

def main():
    OUT.mkdir(parents=True,exist_ok=True)
    old=json.loads((ROOT/'output/curve-review/profiles.json').read_text())
    rec=next(r for r in old['records'] if r['id']=='P5')
    u,v=np.asarray(rec['approximate_local_points_mm']).T
    flat=(u>30)&(u<90)
    z=gaussian_filter1d(v-np.polyval(np.polyfit(u[flat],v[flat],1),u),.7)
    widths=[]
    for lo,hi in [(3,28),(95,120)]:
        ids=np.where((u>lo)&(u<hi))[0];j=ids[np.argmax(z[ids])]
        rows=[]
        for level in [1,2,3,4.4]:
            assert z[j]>level
            l=r=j
            while l>0 and z[l]>level:l-=1
            while r<len(u)-1 and z[r]>level:r+=1
            assert l>0 and r<len(u)-1
            left=np.interp(level,z[l:l+2],u[l:l+2])
            right=np.interp(level,z[r-1:r+1][::-1],u[r-1:r+1][::-1])
            rows.append({'height_mm_approx':level,'width_mm_approx':float(right-left)})
        widths.append(rows)
    # N1: the front upper tip edge is traced consistently. The earlier color
    # mask's lowest orange pixel wandered onto the underside/shadowed pin face.
    traces=[
        dict(label='image-left',scale_px_per_mm=7.5,points=[[282,493],[294,490],[302,477],[312,463],[323,452],[334,447],[345,446],[357,453],[369,464],[380,478],[394,492]],baseline=[[282,493],[394,492]]),
        dict(label='image-right',scale_px_per_mm=7.2,points=[[916,481],[936,474],[950,464],[965,453],[977,442],[992,436],[1007,435],[1020,438],[1032,448],[1042,460],[1054,469],[1066,472]],baseline=[[916,481],[1066,472]])]
    for row in traces:
        a=np.array(row['points']);baseline=np.polyfit(*np.array(row['baseline']).T,1)
        x=a[:,0];h=(np.polyval(baseline,x)-a[:,1])/row['scale_px_per_mm'];j=h.argmax()
        def width(level):
            return float((np.interp(level,h[j:][::-1],x[j:][::-1])-np.interp(level,h[:j+1],x[:j+1]))/row['scale_px_per_mm'])
        raw0,raw2,raw44=[width(q) for q in [0,2,4.4]]
        row['raw_widths_at_0_2_4_4_mm']=[raw0,raw2,raw44]
        row['anchored_width_at_2_mm']=7.5+9.5*(raw2-raw44)/(raw0-raw44)
    registration=json.loads((ROOT/'output/v7-fit-review/photo_registration.json').read_text())
    a=np.array(registration['approximate_transition_in_v7_xy_mm'])[:11]
    shift=6.1;a[:,1]+=shift
    def controls(v):
        sx,sy,ex,c1y,c2x=v
        return [[sx,sy],[sx+.8,c1y],[c2x,0],[ex,0]]
    initial=np.r_[[-15.3,39,25,12,-1],np.linspace(0,1,len(a))]
    fit=least_squares(lambda v:(bezier(controls(v[:5]),v[5:])-a).ravel(),initial,
        bounds=(np.r_[[-18,34,19,0,-18],np.zeros(len(a))],np.r_[[-13,44,32,32,15],np.ones(len(a))]))
    assert fit.success
    names=['IMG_0196.jpeg','IMG_0197.jpeg','IMG_0198.jpeg',
           'new gauge photos/IMG_0182.jpeg','new gauge photos/IMG_0183.jpeg',
           'new gauge photos/IMG_0186.jpeg','new gauge photos/IMG_0187.jpeg',
           'new gauge photos/IMG_0188.jpeg','new gauge photos/IMG_0189.jpeg',
           'new gauge photos/IMG_0190.jpeg','new gauge photos/IMG_0191.jpeg',
           'new gauge photos/IMG_0192.jpeg','new gauge photos/IMG_0193.jpeg',
           'new gauge photos/IMG_0194.jpeg','new gauge photos/IMG_0195.jpeg',
           'curve gauge photos/IMG_0167.jpeg','curve gauge photos/IMG_0170.jpeg','curve gauge photos/IMG_0172.jpeg']
    report=dict(revision='V8 estimates',date='2026-11-04',authorization='User explicitly requested estimates from existing gauge and previous photos.',
        confirmed_fit={'both_V7_inserts_rest_flat':True,'sideways_play':True},
        confirmed_dimensions={'nub_width_z0':17.,'nub_width_z4_4':7.5,'left_side_gap_lower':10.3,'left_side_gap_upper':14.7},
        P5_cross_section_widths=widths,N1_consistent_tip_edge_traces=traces,
        nub_width_profile_mm=[[0,17],[2,12],[4.4,7.5]],
        nub_profile_method='Monotone PCHIP through direct endpoints and rounded 12 mm photograph estimate at Z=2. Neither intermediate anchor nor interpolated widths are certified measurements.',
        selected_per_side_clearance_mm=.3,
        crease_shift_from_V7_mm=shift,left_nub_base_to_crease_estimate_mm=88.9+shift,
        right_nub_base_to_crease_estimate_mm=19.05+shift,
        crease_method='IMG_0196 visible inner transition projected using 16 known printed honeycomb centers. Bottom transition is about -6.1 mm in V7 coordinates. Both nub Y datums shift together; lengths and 93 mm pitch are preserved.',
        corner_photo_points_in_new_frame_mm=a.tolist(),corner_bezier_controls_mm=controls(fit.x[:5]),
        corner_fit_residual_to_photo_rms_mm=float(np.sqrt(np.mean(fit.fun**2))),
        corner_method='Fit a complete smooth turn with a horizontal lower tangent to the visible transition. N4 supplies independent turn-shape evidence, but its incomplete endpoint is not forced to the crease.',
        corner_clearance_mm=.5,corner_tip_round_mm=1.2,
        wall_method='Upper wall retains measured gaps plus 0.5 mm allowance and 2 mm inset. Lower section blends independently to the photographed corner; its allowance is 0.5 mm.',
        limitations=['Photo-plane estimates include perspective, pin thickness, uncertain contact height and fabric effects; no calibrated error bound.',
                    'P4 captures near nub ends and has only 3–4 mm apparent rise; it cannot supply a 4.4 mm middle-section width.',
                    'N1 front-edge tracing avoids mixing the pin front lip and underside edges.',
                    'N6/N7 10.3/14.7 values remain sideways wall gaps; neither is used as a crease distance.',
                    'A 95 mm left-base-to-crease position is an estimate conditioned on the retained V7 nub footprint registration.',
                    'Bezier residual describes agreement with a manually selected photo curve, not physical accuracy.',
                    'Visible nub crown endpoints do not identify the hidden broad base endpoints.'],
        source_sha256={n:hashlib.sha256((ROOT/n).read_bytes()).hexdigest() for n in names},
        source_registration=registration)
    (OUT/'photo_estimates.json').write_text(json.dumps(report,indent=2)+'\n')
    print(json.dumps({'P5_widths_at_2_mm':[w[1]['width_mm_approx'] for w in widths],
        'N1_anchored_widths_at_2_mm':[r['anchored_width_at_2_mm'] for r in traces],
        'selected_width_at_2_mm':12,'left_base_to_crease_estimate':95,'crease_shift':shift,'corner_controls':report['corner_bezier_controls_mm']},indent=2))

if __name__=='__main__':main()
