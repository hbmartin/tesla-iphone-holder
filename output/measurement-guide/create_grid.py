from pathlib import Path
from reportlab.pdfgen import canvas
from reportlab.lib.pagesizes import letter
from reportlab.lib.units import mm
from pypdf import PdfReader

root=Path(__file__).resolve().parents[2]
pdf=root/'output/pdf/contour_trace_grid_letter.pdf'
c=canvas.Canvas(str(pdf),pagesize=letter,pageCompression=1)
c.setTitle('Contour tracing grid - US Letter - 1 mm at actual size')
c.setAuthor('Tesla iPhone holder project')
width,height=letter
x0=(width-180*mm)/2
y0=30*mm
c.setFillGray(.12)
c.setFont('Helvetica-Bold',14)
c.drawString(x0,760,'CONTOUR TRACING GRID')
c.setFont('Helvetica',9)
c.drawString(x0,742,'Profile ID: __________   Actual station / height: __________________________')
c.drawString(x0,725,'Direction: __________   Repeat: ______   Date: __________   Pin spacing: _____')
c.setFont('Helvetica',8)
c.drawString(x0,706,'US Letter | Print at Actual size / 100% | 1 mm squares; heavier lines every 5 and 10 mm')
for orient,max_n in [('x',180),('y',210)]:
 for n in range(max_n+1):
  gray,lw=(.43,.5) if n%10==0 else ((.64,.35) if n%5==0 else (.84,.18))
  c.setStrokeGray(gray);c.setLineWidth(lw)
  if orient=='x':c.line(x0+n*mm,y0,x0+n*mm,y0+210*mm)
  else:c.line(x0,y0+n*mm,x0+180*mm,y0+n*mm)
c.setStrokeGray(.2);c.setLineWidth(.7);c.rect(x0,y0,180*mm,210*mm,fill=0,stroke=1)
c.setFillGray(.22);c.setFont('Helvetica',6.5)
for n in range(0,181,10):
 c.drawCentredString(x0+n*mm,y0-10,str(n))
 c.drawCentredString(x0+n*mm,y0+210*mm+7,str(n))
for n in range(0,211,10):
 c.drawRightString(x0-6,y0+n*mm-2,str(n))
 c.drawString(x0+180*mm+6,y0+n*mm-2,str(n))
c.setStrokeGray(0);c.setLineWidth(.9)
by=53
c.line(x0,by,x0+100*mm,by)
for xx in [x0,x0+100*mm]:c.line(xx,by-4,xx,by+4)
c.setFont('Helvetica-Bold',8);c.setFillGray(.12)
c.drawCentredString(x0+50*mm,by+7,'100 mm - measure between the end ticks')
c.setFont('Helvetica',8)
c.drawString(x0+108*mm,by+3,'Check this bar with a ruler.')
c.drawString(x0+108*mm,by-9,'Also check 100 mm vertically.')
c.setFont('Helvetica',8)
c.drawString(x0,28,'Draw the console pad baseline and direction on your trace. Grid numbers are paper coordinates.')
c.showPage();c.save()
r=PdfReader(pdf)
assert len(r.pages)==1
assert list(map(float,r.pages[0].mediabox))==[0,0,612,792]
# Check emitted geometry in PDF points (100 mm and 180 x 210 mm).
content=r.pages[0].get_contents().get_data().decode()
assert '510.2362 595.2756 re' in content
assert abs((x0+100*mm)-x0-283.464566929)<1e-8
print(pdf)
print('PASS: Letter media box, 180 x 210 mm grid, 100 mm calibration span')
