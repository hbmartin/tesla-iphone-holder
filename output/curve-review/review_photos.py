"""Extract visible gauge silhouettes as evidence, not validated console geometry.

Only output/curve-review is written. Source photographs and CAD are untouched.
The molded ruler supplies an approximate image-plane scale. Camera tilt,
different surface heights, tip geometry, and soft trim remain uncorrected.
"""
from pathlib import Path
import hashlib
import html
import json
import math

import numpy as np
from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent
SOURCE = ROOT / 'curve gauge photos'
DATE = '2026-11-03'

# Ruler reference points are manually read molded metric ticks, not grid ticks.
# Pixel coordinates are in the original (EXIF orientation 1) photographs.
# A crop limits each one-dimensional scan to a visible orange endpoint edge.
PAIRS = [
 dict(id='P1', photos=[162,163], title='Lower crease / front transition',
      interpretation='Likely longitudinal section through the lower transition. Exact X station and contact plane are unrecorded.',
      purpose='Lower console-side relief and phone seating transition; does not alone establish an XY corner radius.',
      axis='y', side='max', roi=[680,260,940,1095], ticks=[[382,342],[379,974]], tick_mm=90,
      caveat='The sheet is visibly curved. The curved endpoint reaches the lowest pins, so the complete transition may not be captured.'),
 dict(id='P2', photos=[164,165], title='Left wall to pad',
      interpretation='Crosswise capture of the left wall/pad transition, apparently in the lower region. Exact Y station is unrecorded.',
      purpose='Left external edge relief. Preserve the requested 2 mm inset until a console datum is registered.',
      axis='y', side='min', roi=[100,450,426,1250], ticks=[[442,606],[429,1097]], tick_mm=60,
      caveat='A wall blend is visible, but the photo does not establish wall position relative to the nub centerline or the full pad baseline.'),
 dict(id='P3', photos=[167,168], title='Short left nub, lengthwise',
      interpretation='Likely lengthwise section through the short left nub. Its exact lateral alignment and gauge tilt are unrecorded.',
      purpose='Asymmetric longitudinal end slopes. A vertical section does not specify the rounded XY end outlines at each height.',
      axis='y', side='min', roi=[60,270,310,1167], ticks=[[379,397],[373,1032]], tick_mm=90,
      caveat='The broad upper feature and end transitions need registration to physical nub endpoints before changing opening length.'),
 dict(id='P4', photos=[169,170], title='Upper crosswise nub section',
      interpretation='Crosswise capture across both nubs near their upper ends. Exact Y station is unrecorded.',
      purpose='Nub flank shape and separation at this station.',
      axis='x', side='min', roi=[390,15,1100,135], ticks=[[382,365],[1066,365]], tick_mm=120,
      caveat='The molded 100 mm ruler span is about 570 image pixels; the paper calibration bar is about 512 pixels. Their scales differ by about 11%.'),
 dict(id='P5', photos=[171,172], title='Second crosswise nub section',
      interpretation='Crosswise capture across both nubs. It appears lower than P4; exact Y and whether this was a repeat are unrecorded.',
      purpose='Compare nub flanks with P4; do not treat the two as repeatability measurements without station confirmation.',
      axis='x', side='min', roi=[355,30,1050,165], ticks=[[349,400],[1019,401]], tick_mm=120,
      caveat='Both crowns are steeper than P4 in the image. This could reflect station, seating, or tilt as well as true surface variation.'),
 dict(id='P6', photos=[173,174], title='Crosswise section with unequal features',
      interpretation='Crosswise capture at a different height on the pad. The gauge appears reversed in the placement photo relative to the grid photo.',
      purpose='Local end/side transition evidence. Resolve console left/right before assigning either feature to a nub.',
      axis='x', side='max', roi=[215,440,1000,640], ticks=[[197,325],[975,333]], tick_mm=120,
      caveat='The far edge is cropped; the near silhouette is extracted. Do not read image-left as console-left.'),
 dict(id='P7', photos=[175,176], title='Longitudinal lower transition',
      interpretation='Lengthwise/oblique capture near the lower pad and long center nub. Exact X station and which surface the pins follow are uncertain.',
      purpose='Evidence of longitudinal change approaching the crease; identify the abrupt step before modeling it as a real surface.',
      axis='x', side='min', roi=[82,270,775,472], ticks=[[65,718],[778,698]], tick_mm=120,
      caveat='The abrupt end step may include a boundary or non-contact pins. It is retained in the raw silhouette but not interpreted as CAD.'),
 dict(id='P8', photos=[177,178], title='Lower crosswise wall / nub section',
      interpretation='Crosswise capture in the lower region: a broad left-side feature and a narrow right-side feature. Exact Y station is unrecorded.',
      purpose='Left boundary blend and long-nub cross-section near its lower region.',
      axis='x', side='min', roi=[112,325,792,490], ticks=[[94,733],[790,752]], tick_mm=120,
      caveat='The left feature reaches the gauge end and is only partially captured; it must not automatically be classified as the short nub.'),
 dict(id='P9', photos=[179,180], title='Lower-left corner, oblique section',
      interpretation='Oblique capture through the lower-left corner. Section angle, contact height, and exact origin are unrecorded.',
      purpose='Compound corner blend. This is evidence for a smooth transition, not a direct measurement of a plan-view fillet radius.',
      axis='x', side='min', roi=[115,180,807,418], ticks=[[77,647],[785,673]], tick_mm=120,
      caveat='A single diagonal section cannot reconstruct the whole 3D corner or prove the current R15 outline.'),
]

def font(size, bold=False):
    names = ['/System/Library/Fonts/Supplemental/Arial Bold.ttf' if bold else '/System/Library/Fonts/Supplemental/Arial.ttf']
    for name in names:
        if Path(name).exists():
            return ImageFont.truetype(name,size)
    return ImageFont.load_default()

def extract(rec):
    path = SOURCE / f'IMG_0{rec["photos"][1]}.jpeg'
    im = np.asarray(Image.open(path).convert('RGB')).astype(int)
    mask=(im[:,:,0]>170)&(im[:,:,0]-im[:,:,1]>65)&(im[:,:,0]-im[:,:,2]>85)&(im[:,:,1]<175)
    x0,y0,x1,y1=rec['roi']
    points=[]
    if rec['axis']=='x':
        for x in range(x0,x1):
            ids=np.flatnonzero(mask[y0:y1,x])+y0
            if len(ids)>4:
                points.append([x,int(ids[0] if rec['side']=='min' else ids[-1])])
    else:
        for y in range(y0,y1):
            ids=np.flatnonzero(mask[y,x0:x1])+x0
            if len(ids)>4:
                points.append([int(ids[0] if rec['side']=='min' else ids[-1]),y])
    raw=np.array(points,dtype=float)
    edge_coordinate=0 if rec['axis']=='y' else 1
    boundary=((x1-1 if rec['side']=='max' else x0) if rec['axis']=='y'
              else (y1-1 if rec['side']=='max' else y0))
    assert not np.any(raw[:,edge_coordinate]==boundary),f"Extraction ROI clips {rec['id']}"
    a,b=np.array(rec['ticks'],float)
    e=(b-a)/np.linalg.norm(b-a)
    # Positive transverse direction is deliberately only an image-plane axis.
    n=np.array([-e[1],e[0]]) if rec['axis']=='y' else np.array([e[1],-e[0]])
    scale=np.linalg.norm(b-a)/rec['tick_mm']
    uv=np.column_stack(((raw-a)@e/scale,(raw-a)@n/scale))
    uv[:,0]-=uv[0,0]
    uv[:,1]-=uv[0,1]
    # Preserve raw pixel samples. Median bins reduce pin-edge noise for display.
    sampled=[]
    for i in range(0,len(uv),5):
        sampled.append(np.median(uv[i:i+5],axis=0).tolist())
    return raw,uv,np.array(sampled),scale

def plot(rec, data):
    w,h=1100,410
    im=Image.new('RGB',(w,h),'white'); d=ImageDraw.Draw(im)
    d.text((28,16),f'{rec["id"]}  {rec["title"]}',font=font(27,True),fill='#16344a')
    d.text((28,56),'Visible pin silhouette; approximate molded-ruler scale. Not a registered console section.',font=font(17),fill='#555555')
    lo=math.floor(float(data[:,1].min())/5)*5-5
    hi=math.ceil(float(data[:,1].max())/5)*5+5
    xmax=math.ceil(float(data[:,0].max())/10)*10
    x0,y0,x1,y1=78,98,1068,328
    def xy(u,v):return (x0+(x1-x0)*u/xmax,y1-(y1-y0)*(v-lo)/(hi-lo))
    for x in range(0,xmax+1,10):
        px,_=xy(x,0);d.line((px,y0,px,y1),fill='#e0e5e9');d.text((px-10,y1+7),str(x),font=font(15),fill='#444444')
    for y in range(lo,hi+1,5):
        _,py=xy(0,y);d.line((x0,py,x1,py),fill='#e0e5e9');d.text((20,py-9),str(y),font=font(15),fill='#444444')
    d.line([xy(float(u),float(v)) for u,v in data],fill='#df652d',width=4)
    d.rectangle((x0,y0,x1,y1),outline='#82929c')
    d.text((300,369),'Distance along gauge (approx. mm; arbitrary origin)',font=font(19),fill='#333333')
    d.text((28,79),'Offset (approx. mm)',font=font(14),fill='#444444')
    im.save(OUT/f'{rec["id"]}_profile.png')

def main():
    records=[]
    for rec in PAIRS:
        raw,uv,display,scale=extract(rec)
        assert len(raw)>100,rec['id']
        plot(rec,display)
        item=dict(rec)
        item['position_photo']=f'IMG_0{rec["photos"][0]}.jpeg'
        item['shape_photo']=f'IMG_0{rec["photos"][1]}.jpeg'
        item['actual_X_mm']=None;item['actual_Y_mm']=None;item['section_angle_deg']=None
        item['scale_px_per_nominal_mm']=round(float(scale),5)
        item['measurement_status']='Provisional image evidence; not safe for automatic CAD import'
        item['pixel_points']=raw.astype(int).tolist()
        item['approximate_local_points_mm']=np.round(display,3).tolist()
        item['source_sha256']={name:hashlib.sha256((SOURCE/name).read_bytes()).hexdigest() for name in [item['position_photo'],item['shape_photo']]}
        records.append(item)
    diagnostics=[]
    for rec in records:
        if rec['id'] not in ['P4','P5']:continue
        u,v=np.array(rec['approximate_local_points_mm']).T
        # A line through the middle flat region removes gross gauge rotation.
        flat=(u>30)&(u<95)
        z=v-np.polyval(np.polyfit(u[flat],v[flat],1),u)
        features=[]
        for lo,hi in [(3,28),(95,120)]:
            ids=np.where((u>lo)&(u<hi))[0]
            j=ids[np.argmax(z[ids])]
            feature={'image_side':'left' if lo==3 else 'right','peak_u_approx_mm':round(float(u[j])*2)/2,
                     'peak_rise_approx_mm':round(float(z[j])*2)/2}
            for level in [1.,4.4]:
                if z[j]<level:continue
                left=right=j
                while left>0 and z[left]>level:left-=1
                while right<len(u)-1 and z[right]>level:right+=1
                if left==0 or right==len(u)-1:continue
                a=np.interp(level,z[left:left+2],u[left:left+2])
                b=np.interp(level,z[right-1:right+1][::-1],u[right-1:right+1][::-1])
                feature[f'width_at_approx_{level:g}_mm_rise']=round(float(b-a)*2)/2
            features.append(feature)
        diagnostics.append({'pair':rec['id'],'peak_spacing_approx_mm':round((features[1]['peak_u_approx_mm']-features[0]['peak_u_approx_mm'])*2)/2,'features':features})
    data=dict(date=DATE,print_scale_confirmation={'horizontal_100_mm_bar':'User confirmed 100 mm on 2026-11-03','vertical_scale':'Not independently confirmed'},units='Approximate mm from molded metric ruler, not verified physical mm',
              coordinate_convention='u follows increasing ruler ticks; v is transverse image direction. Origin is first sampled pin. Neither axis is a registered console coordinate.',
              uncertainty='No calibrated numerical error bound. Molded body scale and pin plane differ; camera pose, paper curvature, pin contact band, fabric compression and repeatability are unknown.',
              geometry_modified=False,diagnostics=diagnostics,records=records)
    (OUT/'profiles.json').write_text(json.dumps(data,indent=2)+'\n')
    tiles=[]
    for rec in PAIRS:
        tile=Image.open(OUT/f'{rec["id"]}_profile.png').resize((660,246))
        tiles.append(tile)
    overview=Image.new('RGB',(1320,5*246),'#edf1f4')
    for i,tile in enumerate(tiles):overview.paste(tile,((i%2)*660,(i//2)*246))
    overview.save(OUT/'profile_overview.png')
    intro='''<h1>Console contour photos: evidence review</h1><p>3 November 2026 · 18 original photos · 9 matched pairs · V5 geometry unchanged</p>
<div class="notice"><strong>The user has confirmed that the paper's horizontal 100 mm bar measures 100 mm.</strong> These captures are useful contour evidence, but the raised gauge and curved sheet still prevent a direct pixel-to-CAD conversion. In IMG_0170, 100 mm on the molded ruler spans approximately 570 pixels; 100 mm on the paper spans approximately 512 pixels (about 11% difference). The two surfaces cannot share one image scale. The vertical print scale has not been independently checked.</div>
<p>Orange plots below preserve the visible pin silhouettes, using the gauge's molded centimetre ticks for a provisional scale. They are not corrected for out-of-plane tilt or pin height, and their origins are arbitrary. The plot axes are not console X/Y/Z. Negative values are relative image offsets, not material depths. No fit tolerance or radius is inferred from these plots.</p>
<p><strong>What these photos add:</strong> a left-wall blend, longitudinal bottom transition, short-nub end profile, several transverse nub profiles, and an oblique corner section. These are suitable for tracing and choosing more realistic curve shapes.</p>
<p><strong>What remains unmeasured:</strong> exact section stations, contact plane and angle, repeatability, and plan-view end/corner outlines at specified heights. The photos do not yet verify 13.5 mm underside or 5.6 mm upper opening widths against the physical nubs. Those remain design targets.</p>
<p>Preserve the 2 mm left-edge inset, phone dimensions, camera opening, thickness limits and crease seating requirements. A future CAD revision should register these sections first, then interpolate with uncertainty; it should not overwrite known positions using unregistered image coordinates.</p>'''
    intro+='''<h2>Provisional numerical checks</h2><p>These values use the molded gauge scale and a straight baseline fitted between the nubs. They are image-plane estimates, rounded to 0.5 mm for reporting; that rounding is <strong>not an accuracy claim</strong>. Unknown tilt and pin contact geometry remain. Paper coordinates are never used as console coordinates.</p><table><tr><th>Pair</th><th>Peak spacing</th><th>Left/right rise</th><th>Left/right width at 1 mm rise</th><th>Left/right width at 4.4 mm rise</th></tr>'''
    for row in diagnostics:
        l,r=row['features']
        def pair_value(key):return f"{l.get(key,'—')} / {r.get(key,'—')}"
        intro+=f"<tr><td>{row['pair']}</td><td>~{row['peak_spacing_approx_mm']:g} mm</td><td>{pair_value('peak_rise_approx_mm')} mm</td><td>{pair_value('width_at_approx_1_mm_rise')} mm</td><td>{pair_value('width_at_approx_4.4_mm_rise')} mm</td></tr>"
    intro+='''</table><p>The approximately 93–94 mm peak spacing is consistent with the current 93 mm nub center spacing, but does not independently locate the base centerlines. P5's widths suggest that the current opening targets need a fit check; they do not justify changing them without registering the section. The 4.4 mm diagnostic is a horizontal slice, not the insert's sloped upper rim. A dash means that section's apparent peak did not reach that height.</p>'''
    sections=[]
    for rec in records:
        a,b=rec['position_photo'],rec['shape_photo']
        sections.append(f'''<section id="{rec['id']}"><h2>{rec['id']} · {html.escape(rec['title'])}</h2>
<p>{html.escape(rec['interpretation'])}</p>
<div class="photos"><figure><a href="../../curve%20gauge%20photos/{a}"><img src="../../curve%20gauge%20photos/{a}"></a><figcaption>Position · {a}</figcaption></figure><figure><a href="../../curve%20gauge%20photos/{b}"><img src="../../curve%20gauge%20photos/{b}"></a><figcaption>Shape · {b}</figcaption></figure></div>
<img class="plot" src="{rec['id']}_profile.png">
<p><strong>Use:</strong> {html.escape(rec['purpose'])}</p><p><strong>Limit:</strong> {html.escape(rec['caveat'])}</p></section>''')
    page='''<!doctype html><html lang="en"><meta charset="utf-8"><meta name="viewport" content="width=device-width, initial-scale=1"><title>Console contour evidence review</title><style>
body{max-width:1120px;margin:36px auto;padding:0 24px;font:17px/1.55 system-ui,sans-serif;color:#19354a;background:#f4f6f8}h1{font-size:34px}h2{font-size:25px}.notice{background:#fff2d8;padding:18px;border-left:5px solid #c17818}section{background:white;padding:24px;margin:28px 0;border-radius:10px}.photos{display:grid;grid-template-columns:1fr 1fr;gap:18px}figure{margin:0}figure img{width:100%;height:520px;object-fit:contain;background:#edf1f4}figcaption{font-size:14px;color:#566778}.plot{width:100%;margin-top:18px}table{border-collapse:collapse;background:white;width:100%;font-size:15px}th,td{padding:10px;border:1px solid #cdd6dd;text-align:left}@media(max-width:650px){.photos{grid-template-columns:1fr}figure img{height:auto}}@media print{section{break-before:page}.notice{border:1px solid}figure img{height:340px}}
</style>'''+intro+''.join(sections)+'</html>'
    (OUT/'review.html').write_text(page)
    lines=['CONSOLE CONTOUR PHOTO REVIEW',DATE,'','18 original photographs matched into 9 pairs. Source images and V5 CAD unchanged.',
           'All location assignments below are inferred from placement images; numeric stations are unrecorded.',
           'The raw pixel silhouettes and provisional local coordinates are in profiles.json.',
           'The local coordinates are NOT registered console coordinates and are NOT validated CAD dimensions.',
           'No calibrated uncertainty bound is available. Do not treat 3 decimal places in stored samples as physical precision.',
           '', 'SCALE CHECK',
           'IMG_0170: molded 100 mm ruler span approximately 570 px; paper 100 mm calibration bar approximately 512 px.',
           'Approximately 11% difference. Raised surfaces, camera pose, paper curvature and/or printing scale can contribute.',
           'User confirmed the horizontal paper bar measures 100 mm. Vertical print scale not independently confirmed.',
           'The gauge and paper cannot share one image scale. No CAD parameter edits made.',
           '']
    for rec in records:
        lines += [f"{rec['id']} {rec['position_photo']} + {rec['shape_photo']}: {rec['title']}",rec['interpretation'],'Use: '+rec['purpose'],'Limit: '+rec['caveat'],'']
    lines += ['REMAINING INFORMATION',
              '- Horizontal 100 mm paper bar confirmed. A vertical check would rule out anisotropic printing.',
              '- Actual cross-section distances from the bottom crease, if recorded; otherwise retain approximate stations.',
              '- A traced line on flat paper removes the raised-gauge parallax from the photograph. Existing photos remain useful.',
              '- Exact nub/base positions, end-plan outlines and corner plan outline are not established by these sections.',
              '- No proof of camera/lens clearance or charging performance follows from these captures.',
              '', 'DESIGN TARGETS RETAINED',
              '2 mm left-edge inset; 13.5 mm underside nub openings; 5.6 mm upper openings; 4.4 mm nominal maximum / 4.5 mm hard limit;',
              '1 mm lower structural edge; phone seated at crease; 71.1 x 150 mm phone; 65.1 x 42.1 mm camera opening.',
              'These targets are not new measurements derived from the photographs.']
    (OUT/'REVIEW.txt').write_text('\n'.join(lines)+'\n')
    assert len(records)==9 and len({name for r in records for name in [r['position_photo'],r['shape_photo']]})==18
    print(json.dumps({'pairs':len(records),'samples':sum(len(r['pixel_points']) for r in records),'report':str(OUT/'review.html'),'cad_modified':False},indent=2))

if __name__=='__main__':main()
