"""Diagnostic figures from existing CAD and unmodified fit photographs."""
from pathlib import Path
import json, hashlib
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Polygon, FancyBboxPatch
import trimesh
import sys
sys.path.insert(0,str(Path(__file__).resolve().parents[2]))
from verify_v5 import curves, crossings

ROOT=Path(__file__).resolve().parents[2]
OUT=Path(__file__).resolve().parent
P=json.loads((ROOT/'output/v7/parameters.json').read_text())
R=json.loads((OUT/'photo_registration.json').read_text())
BG='#f7f8f5';INK='#173841';TEAL='#087f83';RED='#b65743';MUTED='#526871'

fig,axs=plt.subplots(1,2,figsize=(13,6.8),facecolor=BG)
fig.subplots_adjust(left=.07,right=.97,bottom=.17,top=.80,wspace=.30)
fig.suptitle('Two measurements to correct the fit',x=.07,ha='left',y=.96,fontsize=23,color=INK,weight='bold')
fig.text(.07,.89,'Both inserts sit flat, but have sideways play. These measurements resolve the remaining profile and position assumptions.',fontsize=11,color=MUTED)
ax=axs[0]
# Schematic only: no new physical width inferred at the middle station.
z=np.array([0,1,2,3,4.4,5.4]);w=np.array([17,13.5,11.5,9.5,7.5,5.0])
xy=np.r_[np.c_[-w/2,z],np.c_[w[::-1]/2,z[::-1]]]
ax.add_patch(Polygon(xy,facecolor='#d8e4e1',edgecolor=MUTED,lw=1.2))
ax.axhline(0,color=INK,lw=2);ax.text(-11,-.55,'Flat pad — height = 0',fontsize=10,color=INK)
for height,width,color,label in [(0,17,INK,'17 mm — already measured'),(4.4,7.5,INK,'7.5 mm at 4.4 mm — already measured'),(2,11.5,TEAL,'1. Measure width at 2 mm height')]:
 ax.annotate('',xy=(width/2,height),xytext=(-width/2,height),arrowprops=dict(arrowstyle='<->',color=color,lw=1.8))
 ax.text(0,height+.3,label,ha='center',va='bottom',fontsize=10,color=color,weight='bold' if height==2 else 'normal')
ax.annotate('',xy=(-10,2),xytext=(-10,0),arrowprops=dict(arrowstyle='<->',color=TEAL,lw=1.8));ax.text(-10.7,1,'2 mm',rotation=90,va='center',ha='right',color=TEAL,fontsize=10)
ax.set(xlim=(-13,13),ylim=(-1,6.7),title='Across the nub — straight middle section')
ax.axis('off');ax.text(.5,-.13,'Schematic only; the middle width and side curve are unknown.\nMeasure both nubs if their widths differ.',transform=ax.transAxes,ha='center',color=MUTED,fontsize=10)
ax=axs[1]
ax.plot([-16,-16],[8,112],color=MUTED,lw=3)
ax.plot([-12,-9,-3,6,25,43],[8,3,0,0,0,0],color=MUTED,lw=3)
ax.add_patch(FancyBboxPatch((-4,52),8,46,boxstyle='round,pad=0,rounding_size=3',facecolor='#d8e4e1',edgecolor=INK,lw=1.5))
ax.text(0,76,'LEFT\nnub',ha='center',va='center',color=INK,fontsize=11)
ax.plot([-4,31],[52,52],color=TEAL,ls='--',lw=1)
ax.annotate('',xy=(24,52),xytext=(24,0),arrowprops=dict(arrowstyle='<->',color=TEAL,lw=2))
ax.text(27,26,'2. Base end\nto crease',ha='left',va='center',color=TEAL,fontsize=12,weight='bold')
ax.text(17,57,'Lowest end of\nwide nub base',ha='center',va='bottom',color=INK,fontsize=10)
ax.text(8,-8,'Bottom console crease',ha='center',color=INK,fontsize=11)
ax.set(xlim=(-32,55),ylim=(-12,115),title='Along the pad — view from above');ax.axis('off')
ax.text(.5,-.13,'Measure along the pad surface.\nThis is separate from the 10.3 / 14.7 mm sideways gaps.',transform=ax.transAxes,ha='center',color=MUTED,fontsize=10)
fig.text(.07,.035,'The first measurement controls side fit. The second locates the lower outline and phone seating relative to the crease.',fontsize=11,color=INK)
for ext in ['png','svg']:fig.savefig(OUT/f'measurements_needed.{ext}',dpi=170,facecolor=BG)
plt.close(fig)

fig,axs=plt.subplots(1,2,figsize=(13,6.5),facecolor=BG)
fig.subplots_adjust(left=.07,right=.97,bottom=.18,top=.80,wspace=.27)
fig.suptitle('What the V7 fit photos reveal',x=.07,ha='left',y=.96,fontsize=23,color=INK,weight='bold')
fig.text(.07,.88,'Measured inputs remain valid. The intermediate nub profile and corner registration need correction.',fontsize=11,color=MUTED)
z=np.linspace(0,4.4,150);height=4.4/np.sqrt(1-(7.5/17)**2)
old=17*np.sqrt(1-(z/height)**2)+1
linear=17-(17-7.5)*z/4.4+1
ax=axs[0];ax.plot(old,z,c=RED,lw=2,label='V7 elliptical opening')
ax.plot(linear,z,c=MUTED,ls='--',label='Straight interpolation — comparison only')
ax.scatter([18,8.5],[0,4.4],c=INK,zorder=5,label='Measured nub + 0.5 mm / side')
ax.axhline(2,c=TEAL,ls=':',label='Missing width measurement at 2 mm')
ax.set(xlabel='Opening width (mm)',ylabel='Height above flat pad (mm)',title='The ellipse adds substantial middle clearance')
ax.grid(alpha=.15);ax.legend(frameon=False,fontsize=9,loc='lower left');ax.spines[['top','right']].set_visible(False)
ax=axs[1];m=trimesh.load_mesh(ROOT/'output/v7/left_insert_PROTOTYPE.stl')
for line in curves(m,[0,0,1],[0,0,1]):ax.plot(line[:,0],line[:,1],c=RED,lw=2)
a=np.asarray(R['approximate_transition_in_v7_xy_mm']);ax.plot(a[:,0],a[:,1],c=TEAL,marker='o',ms=3,lw=1.5,label='Visible console transition, approximate projection')
ax.axhline(0,color=MUTED,ls='--',lw=1,label='V7 assumed crease')
ax.plot([],[],c=RED,lw=2,label='V7 outline at Z = 1 mm')
ax.set(xlim=(-25,40),ylim=(-12,43),xlabel='V7 X (mm)',ylabel='V7 Y (mm)',title='The lower curve stops short of the transition');ax.set_aspect('equal');ax.legend(frameon=False,fontsize=8,loc='upper right');ax.grid(alpha=.15);ax.spines[['top','right']].set_visible(False)
fig.text(.07,.065,'Photo alignment uses the printed honeycomb centers. The console surface is curved, so the roughly 6 mm offset is diagnostic only.',fontsize=10,color=MUTED)
fig.text(.07,.03,'No new print geometry is released from these estimates. Existing V7 files are preserved.',fontsize=10,color=MUTED)
for ext in ['png','svg']:fig.savefig(OUT/f'fit_diagnosis.{ext}',dpi=170,facecolor=BG)
plt.close(fig)

width_rows=[]
for y in [40,80,120,145]:
 z=1+P['outer_top_slope']*y
 old=17*np.sqrt(1-(z/height)**2)+1
 straight=17-(17-7.5)*z/4.4+1
 width_rows.append(dict(y=y,z=z,v7_opening=old,straight_interpolation_comparison=straight,extra_total_width=old-straight))
report=dict(date='2026-11-04',user_confirmed={'both_inserts_rest_flat':True,'sideways_play':True},
 photographs={n:hashlib.sha256((ROOT/n).read_bytes()).hexdigest() for n in ['IMG_0196.jpeg','IMG_0197.jpeg','IMG_0198.jpeg']},
 findings=['The V7 elliptical width law is an unmeasured assumption and adds substantial mid-height clearance.',
 'wall_x() extrapolates the two upper wall stations through the lower corner, despite the earlier evidence review explicitly cautioning against this.',
 'The N4 gauge capture is incomplete at its bottom end. V7 aligns that endpoint to Y=0 without an independent crease registration.',
 'The corner and phone keepout intersection produces the pointed lower tip visible in IMG_0196.',
 'The photographed console transition is approximately 6 mm beyond the assumed crease; this is not a replacement direct measurement.'],
 width_comparisons_mm=width_rows,
 next_geometry_rules=['Use the 2 mm width as an additional absolute-Z anchor; remove the broad unmeasured elliptical assumption.',
 'Keep full measured base clearance; do not force a constant narrow slot through the entire thickness.',
 'Locate the corner and nub ends using the measured left base-end-to-crease distance.',
 'Constrain the upper wall locally, then blend independently to the lower corner evidence.',
 'Keep the phone footprint clear to the real crease and remove the thin pointed tip with a finite rounded termination.',
 'Validate a localized nub/corner test before another full print.'],
 pending_measurements=['Nub width at Z=2 mm, separately if the nubs differ.','Left wide-base lower end to bottom crease along the pad.'],
 cad_modified=False,printer_dispatch=False)
(OUT/'findings.json').write_text(json.dumps(report,indent=2)+'\n')
print(json.dumps({'review':str(OUT),'confirmed':report['user_confirmed'],'cad_modified':False,'plots':2},indent=2))
