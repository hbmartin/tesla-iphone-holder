"""Review November 4 evidence without changing prior CAD or source photos.

Pixel silhouettes and approximate gauge-plane coordinates are evidence only.
User's direct dimensions remain separate from photograph-derived estimates.
"""
from pathlib import Path
import hashlib
import html
import json

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
import numpy as np
from PIL import Image

ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent
SOURCE = ROOT / 'new gauge photos'

PAIRS = [
    dict(id='N1', photos=[182,183], title='Across both nubs',
         axis='x', side='max', roi=[218,420,1130,598], ticks=[[303,219],[1095,252]], tick_mm=110,
         interpretation='Crosswise section across both nubs. The placement establishes orientation; its exact distance above the lower crease is not recorded.',
         use='Sidewall-shape evidence for both nubs. Direct user measurements of 17 mm at the base and 7.5 mm near the upper print contact supersede the old 13.5 / 5.6 mm openings.',
         limit='User confirms 7.5 mm at about Z=4.4 mm above the flat pad, not the crown. Do not make 7.5 mm the upper opening at every position along a sloped part.'),
    dict(id='N2', photos=[184,185], title='Longitudinal nub profile: long/right inferred',
         axis='x', side='max', roi=[34,770,844,920], ticks=[[97,650],[809,651]], tick_mm=110,
         interpretation='User identifies a vertically aligned centerline capture. The broad profile is assigned to the long/right nub provisionally; the hand obscures the placement.',
         use='Independent longitudinal-shape evidence for this nub; no longer borrow the short nub profile.',
         limit='The gauge appears to end before a flat-pad baseline is captured beyond both ends. Absolute end heights and full footprint length cannot be recovered from this curve alone.'),
    dict(id='N3', photos=[186,187], title='Longitudinal nub profile: short/left',
         axis='y', side='min', roi=[399,150,648,1172], ticks=[[831,255],[774,1040]], tick_mm=100,
         interpretation='User identifies a vertically aligned centerline capture; placement is beside the left wall at the short nub.',
         use='Short-nub crown and distinct end-transition evidence. Keep its profile separate from N2.',
         limit='No console Y mark or flat-pad Z=0 line is marked on the photograph. Photo grid zero is not the console crease.'),
    dict(id='N4', photos=[188,189], title='Lower-left corner: plan outline',
         axis='y', side='min', roi=[220,270,449,1037], ticks=[[514,331],[523,1007]], tick_mm=110,
         interpretation='The gauge appears laid approximately parallel to the pad, with pins following the left perimeter and turning into the lower corner.',
         use='A plan-outline capture, materially more useful for the corner than the earlier diagonal section. Preserve the traced shape rather than assuming one circular radius.',
         limit='Exact contact height and location relative to the nub/crease are not marked. The rounded transition is partly sampled near the gauge end; its continuation along the bottom is incomplete.'),
    dict(id='N5', photos=[190,191], title='Lower-left corner: second section',
         axis='y', side='min', roi=[270,302,480,1114], ticks=[[585,370],[566,1090]], tick_mm=110,
         interpretation='The gauge is held at a different angle beside the lower-left corner. A curved run and an abrupt step into the lower border are visible.',
         use='Evidence for the corner/base transition and for checking a separate corner test piece.',
         limit='The section plane and contact height are not explicitly established. The abrupt step includes a border/contact change; do not turn it into a smooth corner fillet or a new floor thickness.'),
    dict(id='N6', photos=[192,193], title='Left nub to wall: lower station',
         axis='x', side='max', roi=[553,430,1278,665], ticks=[[654,317],[1238,357]], tick_mm=80,
         interpretation='Crosswise capture of left console wall and short nub near its lower end; user confirms 10.3 mm from the wide base edge to the inside wall.',
         use='Direct 10.3 mm side gap is authoritative. This section also shows the wall and nub as separate features.',
         limit='This is a sideways gap, not a distance from the lower console crease. The shape photo is cropped at the right edge.'),
    dict(id='N7', photos=[194,195], title='Left nub to wall: upper station',
         axis='x', side='max', roi=[351,420,1278,663], ticks=[[428,299],[1192,307]], tick_mm=100,
         interpretation='Crosswise capture near the upper end of the short nub; user confirms 14.7 mm from the wide base edge to the inside wall.',
         use='Direct 14.7 mm side gap is authoritative. Do not substitute a measurement from the narrow crown.',
         limit='The side gap locates the wall at this station, not the entire lower-left corner. Contact height and the precise station remain relevant to the wall blend.'),
]


def extract(rec):
    im = np.asarray(Image.open(SOURCE / f'IMG_0{rec["photos"][1]}.jpeg').convert('RGB')).astype(int)
    mask=(im[:,:,0]>170)&(im[:,:,0]-im[:,:,1]>65)&(im[:,:,0]-im[:,:,2]>85)&(im[:,:,1]<175)
    x0,y0,x1,y1=rec['roi']
    pts=[]
    if rec['axis']=='x':
        for x in range(x0,x1):
            ids=np.flatnonzero(mask[y0:y1,x])+y0
            if len(ids)>4: pts.append([x,int(ids[0] if rec['side']=='min' else ids[-1])])
    else:
        for y in range(y0,y1):
            ids=np.flatnonzero(mask[y,x0:x1])+x0
            if len(ids)>4: pts.append([int(ids[0] if rec['side']=='min' else ids[-1]),y])
    raw=np.asarray(pts,float)
    assert len(raw)>300,rec['id']
    boundary=(y0 if rec['side']=='min' else y1-1) if rec['axis']=='x' else (x0 if rec['side']=='min' else x1-1)
    edgecol=1 if rec['axis']=='x' else 0
    clipped=int(np.count_nonzero(raw[:,edgecol]==boundary))
    a,b=np.asarray(rec['ticks'],float)
    scale=np.linalg.norm(b-a)/rec['tick_mm']; e=(b-a)/np.linalg.norm(b-a)
    n=np.array([-e[1],e[0]])
    uv=np.c_[(raw-a)@e/scale,(raw-a)@n/scale]
    uv-=uv[0]
    samples=np.asarray([np.median(uv[i:i+5],axis=0) for i in range(0,len(uv),5)])
    return raw,uv,samples,float(scale),clipped


def profile_plot(rec, samples):
    fig,ax=plt.subplots(figsize=(10.5,3.7))
    fig.subplots_adjust(left=.09,right=.985,bottom=.23,top=.85)
    ax.plot(samples[:,0],samples[:,1],color='#0b8184',lw=2)
    ax.set(xlabel='Distance along gauge (approx. mm; arbitrary origin)',
           ylabel='Relative offset (approx. mm)')
    ax.set_title(f'{rec["id"]} · {rec["title"]}',loc='left',fontsize=12,fontweight='bold')
    ax.grid(alpha=.25); ax.spines[['top','right']].set_visible(False)
    fig.text(.01,.02,'Photograph-derived shape only · not registered console X/Y/Z · no numerical accuracy claim',fontsize=8,color='#52616a')
    fig.savefig(OUT/f'{rec["id"]}_profile.svg');fig.savefig(OUT/f'{rec["id"]}_profile.png',dpi=130);plt.close(fig)


def width_plot():
    fig,axs=plt.subplots(1,2,figsize=(10,4.2),layout='constrained')
    for ax,old,measured,title in zip(axs,[13.5,5.6],[17,7.5],['At the wide base','Near the upper print contact']):
        ax.barh([1,0],[old,measured],color=['#bf5e3e','#087f83'],height=.45)
        ax.set_yticks([1,0],['V6 opening','Measured nub'])
        ax.set_xlim(0,20);ax.set_ylim(-.55,1.6);ax.set_xlabel('Width (mm)');ax.set_title(title,loc='left',fontweight='bold')
        ax.grid(axis='x',alpha=.15);ax.set_axisbelow(True);ax.spines[['top','right','left']].set_visible(False)
        for y,w in [(1,old),(0,measured)]:ax.text(w+.25,y,f'{w:g}',va='center',fontweight='bold')
        ax.text(.02,.99,f'{measured-old:g} mm too narrow before clearance',transform=ax.transAxes,va='top',color='#a7432a')
    fig.suptitle('The confirmed nub widths explain the side binding',fontsize=15,fontweight='bold')
    fig.savefig(OUT/'width_comparison.png',dpi=160);fig.savefig(OUT/'width_comparison.svg');plt.close(fig)


def main():
    records=[]
    for rec in PAIRS:
        raw,uv,samples,scale,clipped=extract(rec)
        profile_plot(rec,samples)
        records.append(dict(rec,
            position_photo=f'IMG_0{rec["photos"][0]}.jpeg',shape_photo=f'IMG_0{rec["photos"][1]}.jpeg',
            source_sha256={f'IMG_0{n}.jpeg':hashlib.sha256((SOURCE/f'IMG_0{n}.jpeg').read_bytes()).hexdigest() for n in rec['photos']},
            pixel_points=raw.astype(int).tolist(),approximate_local_points_mm=uv.round(4).tolist(),
            scale_px_per_mm=scale,roi_clipped_points=clipped))
    evidence=dict(date='2026-11-04',source='new gauge photos/',
        current_model_status='V6 physical fit failed; previous CAD unchanged',
        user_report='Both pieces get stuck on the sides of the nubs.',
        direct_measurements_mm=dict(nub_base_width=17.0,nub_upper_contact_width=7.5,
            upper_width_height_above_pad=4.4,left_wall_gap_lower=10.3,left_wall_gap_upper=14.7),
        confirmed_gap_reference='Sideways from the left edge of the wide nub base to the inside console wall',
        upper_width_height_confirmation='User confirmed 7.5 mm at about 4.4 mm above the flat pad, not the crown, on 2026-11-04.',
        units='Raw pixels; approximate gauge-plane millimeters for traced profiles only',
        coordinate_convention='u follows the gauge ruler; v is the perpendicular image-plane offset. Origins arbitrary. No profile has been promoted to console X/Y/Z.',
        uncertainty='Raised gauge, perspective, unknown contact band and fabric pressure prevent a calibrated error bound. Direct user dimensions take priority over photograph estimates.',
        cad_geometry_modified=False,records=records)
    (OUT/'measurements.json').write_text(json.dumps(evidence,indent=2)+'\n')
    proposal=dict(revision='v7-measurement-proposal',status='Upper-width height confirmed; inputs ready for V7 geometry',
        authoritative_dimensions=evidence['direct_measurements_mm'],
        width_shortfall_mm=dict(base_total=3.5,base_per_side=1.75,upper_total=1.9,upper_per_side=.95),
        candidate_per_side_clearances_mm=[.3,.5,.7],
        candidate_opening_widths_mm=[dict(clearance_each_side=c,base=round(17+2*c,2),upper_at_measured_height=round(7.5+2*c,2)) for c in [.3,.5,.7]],
        wall_location_if_symmetric_base_center_x_is_zero=dict(lower_station_x=-18.8,upper_station_x=-23.2,
            assumptions='17 mm symmetric base; direct gaps measured from its leftmost base flank. These are two local wall locations, not a line to extrapolate through the lower corner.'),
        retained_constraints=dict(phone_width=71.1,phone_height=150,camera_width=64.5,camera_height=41.5,camera_lower_y=105,nominal_max_thickness=4.4,hard_max_thickness=4.5,phone_bottom_at_crease=True),
        implementation_rules=[
            'Use opening width as a function of actual pad-normal Z, not fraction of the local part thickness.',
            'Add tested physical clearance to the measured nub; do not reuse 5.6 / 13.5 finished widths.',
            'Keep left/right axial evidence separate; do not copy one nub end profile onto the other.',
            'Keep wall side gaps separate from nub-end Y coordinates and from lower-corner curvature.',
            'Use the corner plan capture independently from the upright/oblique transition capture.',
            'Validate localized fit samples before another full holder; do not dispatch a print automatically.'])
    (OUT/'v7_parameter_proposal.json').write_text(json.dumps(proposal,indent=2)+'\n')
    width_plot()
    intro='''<h1>New measurements: what changes for V7</h1><p>4 November 2026 · 14 photos · 7 pairs · V6 preserved</p>
<p class="lead">Both inserts bind on the nub sides. The measured nubs are larger than V6's openings: <strong>17 mm versus 13.5 mm at the base; 7.5 mm versus 5.6 mm near the upper contact.</strong></p>
<img class="plot" src="width_comparison.svg" alt="Comparison of measured nub widths and smaller V6 openings">
<table><tr><th>Confirmed input</th><th>Value</th><th>Meaning</th></tr><tr><td>Wide nub base</td><td>17 mm</td><td>Actual nub, before opening clearance</td></tr><tr><td>Upper nub width</td><td>7.5 mm</td><td>Actual nub at about 4.4 mm above the flat pad</td></tr><tr><td>Lower left-nub-to-wall gap</td><td>10.3 mm</td><td>Wide base edge to inside wall, sideways</td></tr><tr><td>Upper left-nub-to-wall gap</td><td>14.7 mm</td><td>Wide base edge to inside wall, sideways</td></tr></table>
<p>The two wall gaps do <strong>not</strong> move the nub ends to Y=10.3 and 14.7. With a symmetric 17 mm base centered at X=0, they imply local wall positions X=-18.8 and -23.2 mm. Do not extend that two-point line through the lower corner: use the corner capture separately.</p>
<div class="notice"><strong>Width reference confirmed:</strong> the user measured 7.5 mm at roughly Z=4.4 mm above the flat pad, not at the crown. The local top of the sloped insert is lower than 4.4 mm over much of its length. Its opening must remain wider there; assigning the narrowest width to the entire sloped upper rim would repeat the binding error.</div>
<h2>Candidate fit clearances</h2><p>These are test options, not a chosen production fit. Each allowance applies to each side of the real nub. Printed dimensions and support cleanup still need checking.</p>
<table><tr><th>Clearance each side</th><th>Base opening</th><th>Upper opening at the measured height</th></tr><tr><td>0.3 mm</td><td>17.6 mm</td><td>8.1 mm</td></tr><tr><td>0.5 mm</td><td>18.0 mm</td><td>8.5 mm</td></tr><tr><td>0.7 mm</td><td>18.4 mm</td><td>8.9 mm</td></tr></table>
<h2>How the photos will be used</h2><p>The curves below retain their approximate gauge-ruler scale, not a normalized fit to old opening targets. Perspective and raised pin tips still limit numerical accuracy. A flat traced line would improve metrology, but the direct measurements already establish the principal width correction. The images are linked without modification.</p>
<p>Next design sequence: establish the pad-normal width profile, make separate nub fit samples with identifiable clearances, then test the corner independently before combining a full holder. Phone/camera dimensions, crease seating and the 4.5 mm hard thickness limit remain unchanged.</p>'''
    sections=[]
    for rec in records:
        a,b=rec['position_photo'],rec['shape_photo']
        sections.append(f'''<section id="{rec['id']}"><h2>{rec['id']} · {html.escape(rec['title'])}</h2><p>{html.escape(rec['interpretation'])}</p>
<div class="photos"><figure><a href="../../new%20gauge%20photos/{a}"><img src="../../new%20gauge%20photos/{a}" alt="Placement {a}"></a><figcaption>Placement · {a}</figcaption></figure><figure><a href="../../new%20gauge%20photos/{b}"><img src="../../new%20gauge%20photos/{b}" alt="Captured shape {b}"></a><figcaption>Shape · {b}</figcaption></figure></div>
<img class="plot" src="{rec['id']}_profile.svg" alt="Extracted profile {rec['id']}"><p><strong>Use:</strong> {html.escape(rec['use'])}</p><p><strong>Limit:</strong> {html.escape(rec['limit'])}</p></section>''')
    page='''<!doctype html><html lang="en"><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>New console measurement review</title><style>
body{max-width:1120px;margin:32px auto;padding:0 24px;font:17px/1.55 system-ui,sans-serif;color:#18343e;background:#f4f7f7}h1{font-size:34px}h2{font-size:24px}.lead{font-size:20px}.notice{background:#fff0d9;border-left:5px solid #c37a2a;padding:18px}section{background:#fff;padding:24px;margin:28px 0;border-radius:10px}.photos{display:grid;grid-template-columns:1fr 1fr;gap:18px}figure{margin:0}figure img{width:100%;height:520px;object-fit:contain;background:#edf1f4}figcaption{font-size:14px;color:#52616a}.plot{width:100%;margin:16px 0}table{width:100%;border-collapse:collapse;background:#fff}td,th{border:1px solid #cdd7d7;padding:10px;text-align:left}th{background:#e7efef}a{color:#087f83}@media(max-width:650px){.photos{grid-template-columns:1fr}figure img{height:auto}table{font-size:14px}}@media print{section{break-before:page}figure img{height:330px}}
</style>'''+intro+''.join(sections)+'</html>'
    (OUT/'review.html').write_text(page)
    print(json.dumps({'pairs':len(records),'raw_samples':sum(len(r['pixel_points']) for r in records),'clipped':{r['id']:r['roi_clipped_points'] for r in records},'review':str(OUT/'review.html'),'cad_modified':False},indent=2))


if __name__=='__main__':main()
