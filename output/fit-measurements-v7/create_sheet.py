from pathlib import Path
import math,json
from reportlab.pdfgen import canvas
from reportlab.lib.colors import HexColor, white
from reportlab.lib.styles import ParagraphStyle
from reportlab.platypus import Paragraph,Table,TableStyle
from pypdf import PdfReader

ROOT=Path(__file__).resolve().parents[2]
OUT=ROOT/'output/fit-measurements-v7';PDF=ROOT/'output/pdf/v7_fit_measurement_sheet.pdf'
c=canvas.Canvas(str(PDF),pagesize=(612,792))
c.setTitle('V7 fit measurement sheet - nub openings and lower-left console corner')
INK=HexColor('#18343e');MUT=HexColor('#536871');TEAL=HexColor('#087f83');ORANGE=HexColor('#ba5c19');PURPLE=HexColor('#765698');LIGHT=HexColor('#eaf0ef');LINE=HexColor('#c7d1d1')
styles={n:ParagraphStyle(n,fontName='Helvetica',fontSize=sz,leading=sz*1.3,textColor=INK) for n,sz in [('body',10),('small',8.6),('table',8.6)]}
def txt(x,y,s,size=10,color=INK,bold=False):
 c.setFillColor(color);c.setFont('Helvetica-Bold' if bold else 'Helvetica',size);c.drawString(x,y,s)
def para(x,y,s,w=524,style='body'):
 p=Paragraph(s,styles[style]);_,h=p.wrap(w,1000);p.drawOn(c,x,y-h);return y-h

def line(x1,y1,x2,y2,col=INK,lw=1,dash=None):
 c.setStrokeColor(col);c.setLineWidth(lw);c.setDash(dash or []);c.line(x1,y1,x2,y2);c.setDash([])
def arrow(x1,y1,x2,y2,col=INK,both=False):
 line(x1,y1,x2,y2,col)
 def head(x,y,a):
  for d in [-.45,.45]:line(x,y,x-5*math.cos(a+d),y-5*math.sin(a+d),col)
 a=math.atan2(y2-y1,x2-x1);head(x2,y2,a)
 if both:head(x1,y1,a+math.pi)
def table(x,y,rows,widths):
 t=Table([[Paragraph(str(v),styles['table']) for v in row] for row in rows],colWidths=widths)
 t.setStyle(TableStyle([('BACKGROUND',(0,0),(-1,0),LIGHT),('VALIGN',(0,0),(-1,-1),'TOP'),('TOPPADDING',(0,0),(-1,-1),6),('BOTTOMPADDING',(0,0),(-1,-1),6),('LEFTPADDING',(0,0),(-1,-1),7),('RIGHTPADDING',(0,0),(-1,-1),7),('LINEBELOW',(0,0),(-1,-1),.4,LINE)]))
 _,h=t.wrap(sum(widths),700);t.drawOn(c,x,y-h);return y-h

def header(n,title,sub):
 txt(44,755,'V7 / MEASURE BEFORE THE NEXT FULL PRINT',9,TEAL,True)
 txt(44,724,title,22,INK,True);para(44,707,sub,524,'small')
 line(44,48,568,48,LINE)
 txt(44,30,'3 November 2026 | Millimeters | Diagrams are schematic, not measuring templates',7.7,MUT)
 txt(538,30,f'{n}/5',8,MUT)
def end():c.showPage()

def pad(x,y,s):
 def pt(a,b):return x+a*s,y+b*s
 c.setFillColor(HexColor('#f1f4f3'));c.setStrokeColor(LINE)
 p=c.beginPath();p.moveTo(*pt(-23,165));p.lineTo(*pt(-17,22));p.curveTo(*pt(-16,7),*pt(-8,0),*pt(7,0));p.lineTo(*pt(112,0));p.lineTo(*pt(112,165));p.close();c.drawPath(p,fill=1,stroke=1)
 for cx,yb,ln in [(0,88.9,63.5),(93,19.05,134.62)]:
  a,b=pt(cx-9,yb);c.setFillColor(HexColor('#d1dcd9'));c.roundRect(a,b,18*s,ln*s,9*s,fill=1,stroke=0)
  line(*pt(cx,-4),*pt(cx,160),MUT,.6,[2,2])
 line(*pt(-18,0),*pt(114,0),INK,1.4)
 return pt

# 1: separate print error, slot interference, and corner interference.
header(1,'First, measure the failed print','The old 5.6 / 13.5 mm opening targets are no longer fixed requirements. Measure the actual plastic before cleaning up or sanding away evidence; remove loose supports first.')
para(44,664,'<b>Record the first contact.</b> Try each insert separately, without the phone and without forcing it. Note whether it stops on a nub side, lower end, upper end, or the console corner. A tight nub can hold the whole part up and make the corner look wrong.')
# Cross-section through a slot; physical surfaces explicitly named.
base_y=480;top_y=565
c.setFillColor(TEAL)
for pts in [[(64,base_y),(147,base_y),(176,top_y),(64,top_y)],[(242,base_y),(325,base_y),(325,top_y),(213,top_y)]]:
 p=c.beginPath();p.moveTo(*pts[0]);[p.lineTo(*q) for q in pts[1:]];p.close();c.drawPath(p,fill=1,stroke=0)
arrow(176,583,213,583,PURPLE,True);txt(138,600,'Phone-facing mouth',9,PURPLE,True)
arrow(147,463,242,463,ORANGE,True);txt(133,446,'Console-facing mouth',9,ORANGE,True)
para(353,587,'<b>Use calipers lightly.</b><br/>Keep the inside jaw tips at the mouth being measured. Do not let them drop into the wider or narrower section.<br/><br/>Measure straight-slot width near the lower end, at the middle, and near the upper end, outside the rounded end caps.',207,'small')
y=table(44,421,[['V6 opening','CAD reference only','Your actual printed measurement'],['Left, phone-facing','Width 5.6; total length 60.9','Widths lower / middle / upper: ___ / ___ / ___<br/>Total length: ___'],['Left, console-facing','Width 13.5; total length 64.9','Widths lower / middle / upper: ___ / ___ / ___<br/>Total length: ___'],['Right, phone-facing','Width 5.6; total length 125.02','Widths lower / middle / upper: ___ / ___ / ___<br/>Total length: ___'],['Right, console-facing','Width 13.5; total length 136.02','Widths lower / middle / upper: ___ / ___ / ___<br/>Total length: ___']],[128,151,245])
y=para(44,y-16,'<b>Also record:</b> which ends rub; any rough support residue; and the gap under the lower-left corner and the far end when the part rests freely. Use a feeler gauge or a paper stack whose thickness you measure. Take one photo showing the caliper contact and reading.',524,'small')
para(44,y-14,'For widths, use stations about 10 mm inside each finished end and the midpoint; record the actual station if different. Measure total length in the pad-plane direction. Report inaccessible readings as such. Photos of the actual contact are more useful than a forced measurement.',524,'small')
end()

# 2: the core nub measurements, located in the console.
header(2,'Capture the real nub sections','Remove both inserts. Six cross-sections, plus one centerline length profile per nub, give the depth-dependent shape. The sloped print meets each nub at a different height.')
pt=pad(105,322,1.8)
for side,cx,ys in [('L',0,[98.9,120.65,142.4]),('R',93,[29.05,86.36,143.67])]:
 for i,yy in enumerate(ys,1):
  line(*pt(cx-16,yy),*pt(cx+16,yy),PURPLE,1.4)
  a,b=pt(cx+19,yy);txt(a,b-3,f'{side}{i}',9,PURPLE,True)
 c0,c1=pt(cx,88.9 if side=='L' else 19.05),pt(cx,152.4 if side=='L' else 153.67)
 arrow(*c0,*c1,TEAL,True)
text_x=370
para(text_x,645,'<b>Datums</b><br/>Y = 0: inside factory lower crease, extended through the corner.<br/>+Y: toward the camera end, along the pad.<br/>X = 0: short left nub centerline; +X to the right.<br/>Z = 0: adjacent flat pad. Z points perpendicular to the pad, not vertically in the car.',192,'small')
para(text_x,495,'<b>At every section</b><br/>Capture both flanks, the crown and a flat pad baseline. Hold the gauge face in the section plane and its pins normal to the pad. Use light pressure; do not compress the fabric.',192,'small')
para(text_x,396,'Positions drawn here use the old model only. <b>Record your actual Y values.</b> Do not assume the old model coordinates are correct.',192,'small')
txt(89,300,'Factory lower crease / Y = 0',9,INK,True)
y=table(44,277,[['ID','Position on the real nub','Actual Y from crease','Max. height / base width*'],['L1 / R1','10 mm above its lower end','L ___ / R ___','L ___ / ___; R ___ / ___'],['L2 / R2','Midpoint of its actual length','L ___ / R ___','L ___ / ___; R ___ / ___'],['L3 / R3','10 mm below its upper end','L ___ / R ___','L ___ / ___; R ___ / ___']],[64,177,115,168])
y=para(44,y-13,'*Use calipers or a depth bridge for independent checks where accessible. Record the reference plane and contact height; do not claim a base width if the fabric blend makes its boundary unclear. A traced full section is the main input.',524,'small')
para(44,y-13,'<b>I will extract the widths at each local print height.</b> V6 used Z = 1 + 0.02123Y: for example, Y=30 meets Z=1.64, while Y=120 meets Z=3.55. Measuring every nub only at 4.4 mm would miss the lower interference.',524,'small')
end()

# 3: end shapes and actual registration.
header(3,'Locate the ends and trace the shape','A curve alone is not enough: its flat-pad baseline, direction and one known position must travel with it. Paper grid coordinates are not console coordinates.')
# schematic axial profile
line(65,552,548,552,INK,1.2)
p=c.beginPath();p.moveTo(65,552);p.lineTo(123,552);p.curveTo(145,552,155,600,184,607);p.curveTo(230,617,375,617,414,607);p.curveTo(443,601,459,552,484,552);p.lineTo(548,552)
c.setStrokeColor(TEAL);c.setLineWidth(2.3);c.drawPath(p)
line(123,542,123,628,MUT,.7,[3,2]);line(484,542,484,628,MUT,.7,[3,2])
arrow(123,637,484,637,TEAL,True);txt(231,649,'Full centerline length profile',10,TEAL,True)
txt(67,532,'Z = 0 / flat pad baseline',9,INK,True)
line(287,545,287,632,PURPLE,1,[3,2]);txt(295,625,'Mark one known Y station',9,PURPLE,True)
arrow(430,518,525,518,INK);txt(436,501,'+Y / camera end',9,MUT)
para(44,478,'<b>Two length profiles: LL and RL.</b> Run the gauge along each nub centerline and include flat pad beyond both ends. If the long nub exceeds the gauge, use two captures with at least 25 mm of shared, marked overlap. Put a known Y station on each trace; do not align the pieces by eye.')
y=table(44,414,[['Bare-console measurement','Left nub','Right nub'],['Lower footprint end, Y from crease','___ mm','___ mm'],['Upper footprint end, Y from crease','___ mm','___ mm'],['Total footprint length, independently checked','___ mm','___ mm'],['Centerline profile ID and known Y mark','LL: Y ___ at marked pin','RL: Y ___ at marked pin']],[274,125,125])
y=para(44,y-14,'<b>One alignment check:</b> at a recorded Y where both nubs exist, measure their center-to-center spacing using the midpoint of each pair of flanks at the same height. Record Y ___, contact Z ___, spacing ___. The old value was 93 mm; do not force the new data to match it.',524,'small')
y=para(44,y-14,'<b>Keep the actual size.</b> Lock the gauge, mark the pin matching the known station, and trace the contact-tip edge onto flat grid paper with a fine pencil held upright. Mark Z=0, +Y (or +X), the station and which nub. Photograph the tracing straight down with grid visible around it. Take a separate placement photo.',524,'small')
para(44,y-14,'<b>End outline, if accessible:</b> include a straight-on overhead photo of each bare nub with a ruler close to the pad, especially all four rounded tips. This helps distinguish the end shape; the registered length profiles control dimensions. Do not infer an exact radius from the photograph.',524,'small')
end()

# 4: corner focused localized geometry.
header(4,'Measure the corner in two directions','First establish the nub interference. Do not treat the corner lift of a nub-bound insert as the amount to remove from the corner.')
# Enlarged corner map. X from left nub; Y from crease.
x0,y0,s=205,380,4.2
pt=lambda x,y:(x0+x*s,y0+y*s)
c.setFillColor(HexColor('#f1f4f3'));c.setStrokeColor(LINE)
p=c.beginPath();p.moveTo(*pt(-18,50));p.lineTo(*pt(-16,18));p.curveTo(*pt(-15,5),*pt(-7,0),*pt(6,0));p.lineTo(*pt(29,0));p.lineTo(*pt(29,50));p.close();c.drawPath(p,fill=1,stroke=1)
line(*pt(-24,0),*pt(30,0),INK,1.2,[4,2]);line(*pt(0,-4),*pt(0,53),MUT,.8,[3,2])
for yy,lab in [(10,'C1: Y=10'),(30,'C2: Y=30')]:
 line(*pt(-23,yy),*pt(25,yy),ORANGE,1.5);a,b=pt(26,yy);txt(a,b-3,lab,9,ORANGE,True)
line(*pt(-5,-3),*pt(-5,49),TEAL,1.5);a,b=pt(-10,53);txt(a,b,'C3: X=-5',9,TEAL,True)
a,b=pt(-19,-8);txt(a,b,'Extended crease / Y=0',9,INK,True)
a,b=pt(3,46);txt(a,b,'X=0',9,MUT);a,b=pt(3,42);txt(a,b,'extend left nub centerline',7.8,MUT)
para(44,659,'<b>C1 and C2:</b> upright sections across the left-wall-to-pad transition, 10 and 30 mm above the extended crease. Include flat pad.<br/><br/><b>C3:</b> upright section along the pad, 5 mm left of the short nub centerline. Capture the base transition and continue upward until a flat pad baseline is visible.',524,'small')
para(392,582,'Record actual stations if these lines cannot be reached. X=-5 is a section location, not a proposed edge position.<br/><br/>All three traces must share the same pad and crease references.',167,'small')
y=table(44,320,[['Corner record','What to provide'],['C1 / C2 / C3','Actual Y or X; locked-gauge tracing with baseline and direction; placement photo.'],['CP0: low outline','Trim thin paper/card until it lies flat in the lower-left corner without curling. Capture at least 30 mm along each adjoining edge. Record material thickness and any visible gaps.'],['CP1: 1 mm outline','If practical, repeat with the contact edge held parallel to the pad at Z=1.0 mm. Measure total contact height including the paper/card; use equal supports. If this cannot be controlled, mark it unavailable.']],[133,391])
y=para(44,y-14,'On both corner templates, mark the extended Y=0 crease, the extended X=0 nub centerline (or a measured offset to it), and +Y. Photograph the template in place, then flat against the grid. <b>Do not bend paper into the corner and then flatten it:</b> that does not preserve a plan outline.',524,'small')
para(44,y-13,'These records distinguish the plan outline from the vertical wall/base blend. A single guessed radius or diagonal profile cannot determine both. The existing R15 corner is provisional and may change.',524,'small')
end()

# 5: exact return set and no another untested full print.
header(5,'Return this set, then test locally','The next full assembly should follow successful nub and corner fit tests. CAD validity alone did not establish physical fit in V6.')
y=table(44,667,[['Priority','Return items','What it resolves'],['1','Printed slot width readings and four total lengths from page 1; first-contact notes; installed photos.','Print undersize/support residue versus an incorrectly sized CAD opening.'],['2','L1-L3 and R1-R3: six located transverse traces. LL and RL: two full longitudinal profiles, split with overlap if needed.','Real width and end recession at each height, including the sloped upper rim.'],['3','Four bare-nub end Y positions; total lengths; one center-spacing check where accessible.','Absolute position and length, independent of rounded edge treatments.'],['4','C1-C3: three upright corner traces; CP0 flat template; CP1 if its height can be controlled.','Lower-left corner plan fit and the underside wall/base transition separately.']],[50,278,196])
y=para(44,y-17,'<b>Every trace needs:</b> ID, actual station, flat-pad baseline, direction, one known positional mark where needed, a placement photo and a flat tracing photo. Keep the ruler/grid in the tracing plane. The horizontal 100 mm grid bar is already confirmed; check one vertical 100 mm span too.',524,'body')
y=para(44,y-15,'<b>Repeatability:</b> take each gauge profile twice. Overlay the tracings and record their largest difference. If they differ visibly, take a third and note why. Record the pin pitch and contact-tip thickness if you can. Report actual readings; do not round a rough tracing to 0.1 mm or compress the padded surface to make it repeat.',524,'small')
y=para(44,y-15,'<b>What I will change in the next design:</b> use the measured curves at their actual scale and locations; size the openings around the real nub envelope plus tested clearance; calculate each section at its local print height; and separate printer compensation from physical clearance. The old 5.6 / 13.5 mm sizes and 6 / 5 mm end reductions will not override a demonstrated interference.',524,'body')
y=para(44,y-15,'<b>Before another complete holder:</b> prepare separate full-height nub collars with a small set of clearance choices, then an independently located corner test. Include flat-pad seating references and check their positions from the crease. Test without force. Consistent seating and no rocking establish the fit before combining the pieces.',524,'body')
y=para(44,y-15,'The confirmed phone/camera dimensions and 4.5 mm hard thickness limit remain. The first task is console seating. Lens contact and charging are separate checks after the inserts and phone can seat correctly.',524,'small')
assert y>62,y
end();c.save()
r=PdfReader(PDF);assert len(r.pages)==5
alltext='\n'.join(p.extract_text() for p in r.pages)
for token in ['L1','R3','LL','RL','C1','C2','C3','CP0','CP1','13.5','5.6']:
 assert token in alltext,token
print(PDF)
print('PASS: 5 pages, all measurement IDs present')
