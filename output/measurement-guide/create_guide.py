from pathlib import Path
import math, csv, json
from reportlab.pdfgen import canvas
from reportlab.lib.colors import HexColor, Color, white
from reportlab.lib.styles import ParagraphStyle
from reportlab.platypus import Paragraph, Table, TableStyle
from reportlab.pdfbase.pdfmetrics import stringWidth

ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'output/measurement-guide'
PDF=ROOT/'output/pdf/console_contour_measurement_guide.pdf'
W,H=612,792
INK=HexColor('#18343e'); MUT=HexColor('#536871'); TEAL=HexColor('#087f83'); ORANGE=HexColor('#ba5c19'); PURPLE=HexColor('#765698'); LIGHT=HexColor('#eaf0ef'); LINE=HexColor('#c7d1d1')
c=canvas.Canvas(str(PDF),pagesize=(W,H))
c.setTitle('Console contour measurement guide - V5 fit follow-up')
c.setAuthor('Tesla iPhone holder project')
styles={n:ParagraphStyle(n,fontName='Helvetica',fontSize=sz,leading=sz*1.34,textColor=INK,spaceAfter=0) for n,sz in [('body',10),('small',8.5),('table',9)]}

def text(x,y,s,size=10,color=INK,bold=False):
 c.setFillColor(color);c.setFont('Helvetica-Bold' if bold else 'Helvetica',size);c.drawString(x,y,s)
def para(x,y,s,width=524,style='body'):
 p=Paragraph(s,styles[style]); _,h=p.wrap(width,1000);p.drawOn(c,x,y-h);return y-h

def header(n,title,sub):
 c.setFillColor(white);c.rect(0,0,W,H,fill=1,stroke=0)
 text(44,754,'CONSOLE CONTOUR MEASUREMENTS',9,TEAL,True)
 text(44,724,title,23,INK,True)
 para(44,708,sub,524,'small')
 c.setStrokeColor(LINE);c.line(44,48,568,48)
 text(44,30,'V5 follow-up | 20 October 2026 | All dimensions in mm',8,MUT)
 text(522,30,f'{n} / 8',8,MUT)

def finish():c.showPage()
def label(x,y,s,color=INK):text(x,y,s,10,color,True)
def line(x1,y1,x2,y2,color=INK,lw=1,dash=None):
 c.setStrokeColor(color);c.setLineWidth(lw);c.setDash(dash or []);c.line(x1,y1,x2,y2);c.setDash([])
def arrow(x1,y1,x2,y2,color=INK,both=False):
 line(x1,y1,x2,y2,color,1)
 def head(x,y,a):
  line(x,y,x-5*math.cos(a-.45),y-5*math.sin(a-.45),color,1)
  line(x,y,x-5*math.cos(a+.45),y-5*math.sin(a+.45),color,1)
 a=math.atan2(y2-y1,x2-x1);head(x2,y2,a)
 if both:head(x1,y1,a+math.pi)

def table(x,y,rows,widths,heights=None):
 vals=[[Paragraph(str(v),styles['table']) for v in row] for row in rows]
 t=Table(vals,colWidths=widths,rowHeights=heights)
 t.setStyle(TableStyle([('BACKGROUND',(0,0),(-1,0),LIGHT),('VALIGN',(0,0),(-1,-1),'TOP'),('TOPPADDING',(0,0),(-1,-1),6),('BOTTOMPADDING',(0,0),(-1,-1),6),('LEFTPADDING',(0,0),(-1,-1),7),('RIGHTPADDING',(0,0),(-1,-1),7),('LINEBELOW',(0,0),(-1,-1),.4,LINE)]))
 _,h=t.wrap(sum(widths),700);t.drawOn(c,x,y-h);return y-h

def plan(x,y,s=2.0,phone=True):
 # Diagram positions use current datums; physical contours remain unknown.
 def pt(a,b):return x+a*s,y+b*s
 c.setFillColor(HexColor('#f1f4f3'));c.setStrokeColor(LINE);c.setLineWidth(1)
 p=c.beginPath();p.moveTo(*pt(-23,165));p.lineTo(*pt(-17,22));p.curveTo(*pt(-16,7),*pt(-8,0),*pt(7,0));p.lineTo(*pt(112,0));p.lineTo(*pt(112,165));p.close();c.drawPath(p,fill=1,stroke=1)
 for cx,yb,ln in [(0,88.9,63.5),(93,19.05,134.62)]:
  a,b=pt(cx-9,yb);c.setFillColor(HexColor('#d2dcdb'));c.roundRect(a,b,18*s,ln*s,9*s,fill=1,stroke=0)
  line(*pt(cx,yb-5),*pt(cx,yb+ln+5),MUT,.6,[2,2])
 if phone:
  a,b=pt(10.95,0);c.setStrokeColor(PURPLE);c.setLineWidth(.8);c.setDash([4,3]);c.roundRect(a,b,71.1*s,150*s,11*s,fill=0,stroke=1);c.setDash([])
 line(*pt(-12,0),*pt(112,0),INK,1.6)
 return pt

# PAGE 1
header(1,'Map the bare console','32 record slots cover the crease, wall, corner and nubs; use accessible profiles or the noted alternatives. The drawing is a placement map, not a measured console contour.')
pt=plan(110,310,2.05)
for i,xv in enumerate([0,11,46.5,82,104],1):
 line(*pt(xv,-4),*pt(xv,38),TEAL,1.4)
 a,b=pt(xv,-11 if i%2 else -20);text(a-6,b,f'B{i}',9,TEAL,True)
for i,yv in enumerate([15,40,75,120,150],1):
 line(*pt(-29,yv),*pt(-7,yv),ORANGE,1.4)
 a,b=pt(-39,yv);text(a-4,b-3,f'W{i}',9,ORANGE,True)
for cx,stations in [(0,[98.9,120.65,142.4]),(93,[29.05,86.36,143.67])]:
 for yy in stations:line(*pt(cx-14,yy),*pt(cx+14,yy),PURPLE,1.2)
text(95,655,'Short left nub',9,INK,True);text(270,655,'Long right nub',9,INK,True)
a,b=pt(0,0);text(a-12,b-57,'X = 0',9,MUT)
a,b=pt(93,0);text(a-14,b-57,'X = 93',9,MUT)
text(110,237,'Factory lower crease: Y = 0',10,INK,True)
arrow(401,320,401,385,INK);text(409,377,'+Y',10,INK,True);text(409,360,'camera end',9,MUT)
text(425,640,'B: bottom / crease',10,TEAL,True)
para(425,629,'5 profiles<br/>Page 3',135,'small')
text(425,580,'W: left wall',10,ORANGE,True)
para(425,569,'5 profiles<br/>Page 3',135,'small')
text(425,520,'C: lower-left corner',10,INK,True)
para(425,509,'3 sections + 3 outlines<br/>Page 4',135,'small')
text(425,460,'N: both nubs',10,PURPLE,True)
para(425,449,'6 cross + 2 length<br/>+ 8 end outlines<br/>Pages 5-6',135,'small')
para(44,207,'<b>Set the references first.</b> Remove the phone and both inserts. Work on the bare factory surface. X = 0 follows the short left nub centerline; X increases rightward. Y is measured along the pad from the inside lower crease, not horizontally through the air.')
para(44,148,'<b>Z is perpendicular to the pad, not vertical to the ground.</b> Use a clear, flat region of the pad as Z = 0. Extend the straight lower crease through the rounded corner as a reference line; record the actual corner separately. New IDs B/W/C/N replace vague A/B/C contour references; they do not change the old measured nub-to-crease gaps.')
finish()

# PAGE 2
header(2,'How to capture a usable profile','A shape without its location, plane and scale cannot be placed reliably into CAD.')
text(44,666,'1  Keep the gauge in the section plane',12,INK,True)
# Two schematics, profile views. Invented shape, not measured.
for x0,title in [(55,'Across a nub: X-Z plane'),(322,'Along a nub: Y-Z plane')]:
 text(x0,640,title,10,TEAL,True)
 line(x0,541,x0+220,541,INK,1.2)
 c.setStrokeColor(INK);c.setLineWidth(2)
 p=c.beginPath();p.moveTo(x0,541)
 for dx in range(1,221):p.lineTo(x0+dx,541+37*math.exp(-((dx-110)/34)**4))
 c.drawPath(p)
 c.setFillColor(LIGHT);c.setStrokeColor(LINE);c.rect(x0+30,607,160,12,fill=1,stroke=1)
 for j in range(15):
  px=x0+37+j*10; h=37*math.exp(-((px-(x0+110))/34)**4)
  line(px,607,px,541+h,MUT,.8)
 arrow(x0+205,610,x0+205,575,TEAL)
 text(x0+170,627,'pins',8,MUT)
 text(x0+5,524,'Flat pad baseline: Z = 0',9,MUT)
para(44,504,'Hold the gauge face in a plane perpendicular to the pad for B, W, C-S and N-X/N-L profiles. Keep its long axis along the marked section line. Advance pins toward the surface with only enough pressure for contact; do not squash the fabric. Keep the pin tips in one plane, without twisting.')
text(44,438,'2  Lock, label and preserve the baseline',12,INK,True)
para(44,423,'Capture at least 10 mm of flat pad beside a nub or wall blend where accessible; for the crease include about 30 mm of pad plus the full ledge. Mark the pad baseline and a known station on the gauge or trace. Mark which direction is +X or +Y. Lock the gauge before lifting it; use the same face for every photograph.')
text(44,354,'3  Photograph the shape and its placement',12,INK,True)
para(44,339,'For each ID, take one placement photo showing the gauge on the labeled console station. Then place the locked gauge on paper and photograph square-on to its face, with a millimeter ruler in that same plane. Include a second ruler perpendicular to the first if possible. Keep the whole contact edge, label and scale visible; avoid perspective and mirroring.')
text(44,257,'4  Record repeatability and tool limits',12,INK,True)
para(44,242,'Capture each profile twice; take a third if they differ. Record pin spacing, out-of-plane tip thickness and repeat spread. Aim for agreement within about 0.5 mm if feasible; report worse results. Thick pins sample a band, not a perfect plane. Coarse pins may not resolve an R0.9 edge. Mark blocked or undercut areas as missing; never infer hidden shape.')
text(44,160,'What to send for every ID',12,INK,True)
para(44,145,'<b>ID + actual station/height + placement photo + square-on profile photo + baseline + direction + repeat spread.</b> A scan of a paper tracing with a measured 50 mm reference line is also useful. Do not smooth the curve into an assumed circle; the transition may not have a single radius.')
finish()

# PAGE 3
header(3,'B: lower crease   /   W: left wall','These are perpendicular sections through the pad. They determine underside relief and where each piece may extend.')
# bottom profile diagram
text(44,660,'B: gauge runs up/down the pad',11,TEAL,True)
line(58,579,268,579,LINE,.8)
p=c.beginPath();p.moveTo(58,615);p.lineTo(84,615);p.curveTo(104,615,100,579,126,579);p.lineTo(268,579);c.setStrokeColor(INK);c.setLineWidth(2);c.drawPath(p)
line(126,568,126,624,MUT,.7,[2,2]);text(111,553,'Y = 0 reference',8.5,MUT)
arrow(153,598,254,598,TEAL);text(171,609,'+Y toward camera',8.5,MUT)
text(335,660,'W: gauge runs across the pad',11,ORANGE,True)
p=c.beginPath();p.moveTo(334,625);p.lineTo(334,607);p.curveTo(334,586,345,579,365,579);p.lineTo(555,579);c.setStrokeColor(INK);c.drawPath(p)
line(325,579,555,579,LINE,.8)
arrow(389,600,482,600,ORANGE);text(402,613,'+X toward phone',8.5,MUT)
text(325,550,'Include wall, blend and adjacent flat pad',8.5,MUT)
y=table(44,526,[['ID','Station','Capture and record'],['B1','X = 0','Short left nub centerline projected down to the crease.'],['B2','X = 11','Near the phone left edge.'],['B3','X = 46.5','Phone centerline; important for bottom seating.'],['B4','X = 82','Near the phone right edge.'],['B5','X = 104','Outside the long nub, beneath the right structural edge.']],[45,103,376])
para(44,y-10,'For B1-B5, span from the ledge side of the crease to at least Y = 30-40. Include the full lip. Record lip height above the pad, where the curve begins/ends, and the true contact boundary. At a rounded corner, do not pretend the surface reaches the extended Y = 0 line.','524' if False else 524,'small')
y=table(44,y-71,[['ID','Station','Capture and record'],['W1 / W2','Y = 15 / 40','Lower wall and transition out of the lower-left corner.'],['W3','Y = 75','Middle left edge.'],['W4 / W5','Y = 120 / 150','Alongside the left nub and near the camera end.']],[65,108,351])
para(44,y-11,'At each W station, capture the left wall through its inward blend onto flat pad; stop before a nub blocks the pins. Measure from the X = 0 centerline to a marked point on the trace so its lateral position is known. The trace lets us read wall clearance at Z = 0, 1, 2, 3 and 4.4. Do not apply the design clearance to the measurement.','524' if False else 524,'small')
finish()

# PAGE 4
header(4,'C: the lower-left corner in 3D','The outline seen from above and the rounding through thickness are different measurements. We need both.')
text(44,662,'C-S: three upright sections through the corner',12,INK,True)
# quarter-round boundary in plan, rays oriented from virtual corner into pad
ox,oy=100,450;s=3
line(ox,oy,ox+190,oy,INK,1)
line(ox,oy,ox,oy+175,INK,1)
c.setStrokeColor(TEAL);c.setLineWidth(2)
p=c.beginPath();p.moveTo(ox,oy+150);p.lineTo(ox,oy+70);p.curveTo(ox,oy+25,ox+25,oy,ox+70,oy);p.lineTo(ox+190,oy);c.drawPath(p)
for i,deg in enumerate([15,45,75],1):
 a=math.radians(deg);ex=ox+170*math.cos(a);ey=oy+170*math.sin(a)
 line(ox,oy,ex,ey,ORANGE,1.1,[4,2]);text(ex+3,ey+3,f'C-S{i}: {deg} deg',9,ORANGE,True)
text(74,431,'Virtual corner',9,MUT)
text(202,431,'Along lower crease',9,MUT)
para(361,629,'Extend the straight wall and straight crease to their virtual intersection. Take upright gauge sections along rays approximately <b>15, 45 and 75 degrees</b> into the pad from the lower-crease direction. Record the actual angle and offset if exact placement is impractical.',197)
para(361,508,'Each section must include the curved boundary plus flat pad. These three curves describe the compound blend. Do not replace them with one guessed fillet radius.',197)
text(44,393,'C-P: three outlines parallel to the pad',12,INK,True)
y=table(44,375,[['ID','Height / plane','Method'],['C-P0','At the pad surface','Trace the visible floor-to-wall boundary on thin paper, without pressing into the upholstery; mark any fuzzy transition band.'],['C-P1','Z = 1.0','Hold the gauge face parallel to the pad on checked spacers. Push pins into the corner from the open bay; capture the plan outline.'],['C-P4','Z = 4.4','Repeat at 4.4 above the same pad reference, or the nearest feasible height and report the actual value.']],[51,102,371])
para(44,y-12,'Include about 30 mm of each straight edge beyond the corner, using overlapping captures if needed. Keep X/Y reference lines, the virtual intersection and scale on the tracing. Thick pins sample a height band: record its lower and upper heights. If the gauge cannot fit at the requested height, use a thin paper/card template or record the closest accessible band.',524)
para(44,110,'<b>Why:</b> C-P records the actual plan shape replacing the provisional R15 corner; C-S and W record the console-facing rounding replacing the provisional R0.9 edge. A full profile is more useful than a radius value.',524,'small')
finish()

# PAGE 5
header(5,'N: cross-sections and length profiles','Measure the physical nubs themselves. Current cutout widths of 13.5 and 5.6 are design targets, not measured nub widths.')
# nub positions small diagrams
for cx,yb,ln,xpos,side in [(0,88.9,63.5,117,'L'),(93,19.05,134.62,277,'R')]:
 scale=1.58; bottom=392
 c.setFillColor(LIGHT);c.setStrokeColor(LINE);c.roundRect(xpos-15,bottom+yb*scale,30,ln*scale,15,fill=1,stroke=1)
 for idx,yy in enumerate([yb+10,yb+ln/2,yb+ln-10],1):
  yp=bottom+yy*scale;line(xpos-32,yp,xpos+32,yp,PURPLE,1.2);text(xpos+38,yp-3,f'N-{side}X{idx}',9,PURPLE,True)
 line(xpos,bottom+(yb-10)*scale,xpos,bottom+(yb+ln+10)*scale,TEAL,1.2,[3,2])
 text(xpos-30,663,f'{side}: X = {cx}',10,INK,True)
 text(xpos-21,bottom+yb*scale-19,f'N-{side}L',9,TEAL,True)
line(60,392,353,392,INK,1.1);text(61,378,'Lower crease: Y = 0',9,MUT)
para(417,650,'<b>Purple:</b> three upright cross-sections, perpendicular to each nub.<br/><br/><b>Teal:</b> one upright length profile through each nub centerline.<br/><br/>Record the full shape, including the crown and flat pad on both sides/ends.',140)
y=table(44,354,[['IDs','Station along each nub','Approximate model Y (L / R)'],['N-LX1 / N-RX1','10 above the physical lower end','98.9 / 29.1'],['N-LX2 / N-RX2','Halfway between physical ends','120.7 / 86.4'],['N-LX3 / N-RX3','10 below the physical upper end','142.4 / 143.7'],['N-LL / N-RL','Along centerline, entire length','X = 0 / X = 93']],[122,200,202])
para(44,y-11,'Find the actual end positions first; the Y numbers above are locating estimates from the model. If they differ, use the physical ends and write down the actual station. For length profiles include 10 mm of flat pad beyond both ends; a long right profile may need two captures with at least 25 mm of shared, labeled overlap.',524,'small')
para(44,126,'<b>What we extract:</b> maximum nub height, width versus height, asymmetric sides, how each end rises from the pad, and end positions versus height. Capture full curves; you do not need to calculate radii or manually extract every width.',524)
finish()

# PAGE 6
header(6,'N: the rounded nub ends in plan','These horizontal profiles resolve end shapes that a straight centerline section misses. Take four outlines per nub.')
# cross-sectional concept and plan capsule
text(44,660,'Gauge face parallel to the pad',12,INK,True)
p=c.beginPath();p.moveTo(57,540);p.lineTo(87,540);p.curveTo(115,540,113,608,152,608);p.curveTo(191,608,188,540,219,540);p.lineTo(252,540);c.setStrokeColor(INK);c.setLineWidth(2);c.drawPath(p)
line(57,540,252,540,LINE,1)
line(60,554,249,554,TEAL,1.2,[4,2]);line(80,590,222,590,ORANGE,1.2,[4,2])
text(61,522,'Z = 0 pad reference',9,MUT)
text(263,551,'Low plane: 1 mm',9,TEAL,True);text(233,588,'Second plane',9,ORANGE,True)
text(388,660,'Each end viewed from above',11,INK,True)
c.setFillColor(LIGHT);c.setStrokeColor(INK);c.roundRect(410,535,74,98,37,fill=1,stroke=1)
arrow(447,510,447,531,TEAL);arrow(447,655,447,636,TEAL)
text(499,547,'lower',9,MUT);text(499,619,'upper',9,MUT)
text(388,491,'Capture end + straight sides',9,MUT)
y=table(44,468,[['End','Low profile ID / Z','Near-rim profile ID / Z'],['Left lower','N-LB1 / 1.0','N-LBT / about 2.9'],['Left upper','N-LT1 / 1.0','N-LTT / about 4.2'],['Right lower','N-RB1 / 1.0','N-RBT / about 1.5'],['Right upper','N-RT1 / 1.0','N-RTT / about 4.2']],[112,185,227])
para(44,y-12,'Support the gauge on measured spacers on adjacent flat pad so the <b>pin contact line</b> lies at the stated Z. Account for the gauge body thickness; spacer thickness alone may not equal the measurement height. Approach a lower end from below (-Y) and an upper end from above (+Y). Keep the gauge face parallel to the pad; include both side transitions and some straight flank.',524)
para(44,y-104,'Record actual Z, centerline and Y. Thick pins sample a height band: record both lower and upper tip-edge heights. If they cannot fit at 1 mm, use the nearest accessible band or a thin card template and label it. The second heights approximate V5 rim heights, not nub heights. Above the nub, record "above crown - no intersection".',524)
para(44,138,'<b>Sloped print:</b> the V5 upper surface is Z = 1 + 0.02123 x Y, so it cuts each nub at a different height along its length. Full length and cross profiles let us reconstruct that intersection. A single constant-height outline cannot verify the entire sloped opening.',524,'small')
para(44,87,'If horizontal capture is impossible, mark that ID inaccessible and send a scaled end view plus the upright length profile. This is partial evidence; unresolved fine curves remain provisional.',524,'small')
finish()

# PAGE 7
header(7,'Dimensions the gauge cannot settle alone','Use a ruler, calipers or a straightedge for these checks. Keep raw console measurements separate from desired print clearance.')
y=table(44,666,[['Check','What to record','Why it matters'],['Nub locations','Both lower/upper Y endpoints; centerline spacing at lower, middle and upper accessible stations. Measure common-height centers, not unlike tapered edges.','Confirms datums and detects nonparallel nubs. Current model: X spacing 93; L Y 88.9-152.4; R Y 19.05-153.67.'],['Nub width and height','At all six N-X stations: crown height, base/contact width, and any clearly accessible width at a known Z. Include fabric; do not squeeze it.','Checks the requested 13.5 underside / 5.6 upper apertures against the real surface.'],['Pad flatness','Straightedge along clear lanes near X = -10, 46.5 and 104; record any gaps and their Y locations. Avoid nubs and the lower blend. Also check across the phone bay at Y = 40, 75, 105 and 150.','Distinguishes console bow or high spots from wrong perimeter curvature.'],['Left edge fit','At W stations, note interference or gap with V5 resting freely; measure accessible gaps. Mark contact points on a photo.','Tests the 2 mm inward change without adding clearance twice.'],['Phone seating','With the phone naturally seated, record bottom-to-crease gap, lateral position, rocking and visible contact points, first bare and then with the inserts.','Checks the lower 36 mm keepout and whether the phone actually reaches the crease.'],['Lens contact, if present','Use a scaled photo of the phone back for each ring center (X from phone left, Y from bottom), outer diameter and any safely measurable projection.','The recorded 5 mm projection predicts possible contact; no contour gauge can establish optical clearance.']],[86,264,174])
para(44,y-12,'Use only light contact. Keep hard gauge pins and caliper jaws off lens glass. Record "not measurable" for inaccessible gaps; do not force the phone down to make a measurement. The phone body 71.1 x 150 and housing 64.5 x 41.5 at Y = 105 are already supplied, so remeasure only if you find a discrepancy.',524,'small')
text(44,137,'Return package',12,INK,True)
para(44,121,'Send the labeled profile photos/traces, the completed log, and one overall console photo showing the marked stations. Include gauge pin spacing, actual profile heights, any missing/inaccessible captures and observations from the bare-phone/V5 comparison. We will derive CAD curves and apply fit clearance afterward.',524)
finish()

# PAGE 8 recording log
header(8,'Capture log','Use the same ID on the console placement photo, the profile photograph and the paper trace. Log actual positions, not just target positions.')
records=[]
for i,xv in enumerate([0,11,46.5,82,104],1):records.append((f'B{i}',f'X = {xv}'))
for i,yv in enumerate([15,40,75,120,150],1):records.append((f'W{i}',f'Y = {yv}'))
for i,a in enumerate([15,45,75],1):records.append((f'C-S{i}',f'{a} deg from lower crease'))
records.extend([('C-P0','floor boundary'),('C-P1','Z = 1.0'),('C-P4','Z = 4.4')])
for side,ys in [('L',[98.9,120.65,142.4]),('R',[29.05,86.36,143.67])]:
 for i,yy in enumerate(ys,1):records.append((f'N-{side}X{i}',f'Y approx. {yy:.1f}'))
records.extend([('N-LL','X = 0; full length'),('N-RL','X = 93; full length')])
for side,end,z in [('L','B',2.9),('L','T',4.2),('R','B',1.5),('R','T',4.2)]:
 records.extend([(f'N-{side}{end}1','Z = 1.0'),(f'N-{side}{end}T',f'Z approx. {z:.1f}')])
assert len(records)==32
# compact but writable rows
rows=[['ID','Target station / plane','Actual + repeat spread','Photo / trace name']]+[[a,b,'',''] for a,b in records]
old=styles['table'];styles['table']=ParagraphStyle('log',fontName='Helvetica',fontSize=8,leading=10,textColor=INK)
t=Table([[Paragraph(str(v),styles['table']) for v in row] for row in rows],colWidths=[63,140,150,171],rowHeights=[23]+[16]*32)
t.setStyle(TableStyle([('BACKGROUND',(0,0),(-1,0),LIGHT),('VALIGN',(0,0),(-1,-1),'MIDDLE'),('LEFTPADDING',(0,0),(-1,-1),5),('LINEBELOW',(0,0),(-1,-1),.35,LINE)]))
_,h=t.wrap(524,700);t.drawOn(c,44,669-h);styles['table']=old
text(44,105,'Pin spacing / tip thickness: ______ / ______    Ruler/caliper resolution: ______',9,INK)
text(44,84,'Missing / inaccessible profiles: __________________________________________',9,INK)
finish();c.save()
with (OUT/'capture_log.csv').open('w',newline='') as f:
 w=csv.writer(f);w.writerow(['ID','Target station or plane','Actual station or height','Repeat spread mm','Placement photo','Profile photo or trace','Notes'])
 for row in records:w.writerow([*row,'','','','',''])
(OUT/'guide_metadata.json').write_text(json.dumps({'pdf':str(PDF),'profile_records':32,'pages':8,'model_revision':'V5','contours':'schematic - not measured','print_models_modified':False},indent=2)+'\n')
print(PDF)
