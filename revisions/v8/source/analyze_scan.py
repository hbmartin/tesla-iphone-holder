#!/usr/bin/env python3
"""Calibrate the supplied tabletop scan by the measured 72.1 mm phone width.

The phone ROI was selected from a rendered overview; table geometry is excluded.
The scan is a noisy visual reference, never a substitute for caliper heights.
"""
from pathlib import Path
import json
import numpy as np
import trimesh
from shapely.geometry import MultiPoint
from scipy.optimize import least_squares
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.collections import PolyCollection

ROOT=Path(__file__).resolve().parent
OUT=ROOT/'output/v2/scan'
OUT.mkdir(parents=True,exist_ok=True)
m=trimesh.load(ROOT/'iphone table scan.glb',force='mesh')
v=m.vertices
rgb=m.visual.to_color().vertex_colors[:,:3]
roi=(v[:,0]>-.34)&(v[:,0]<.24)&(v[:,2]>-.08)&(v[:,2]<.84)
phone=roi&(v[:,1]>.055)
rect=MultiPoint(v[phone][:,[0,2]]).convex_hull.minimum_rotated_rectangle
corners=np.array(rect.exterior.coords)[:4]
edges=np.roll(corners,-1,axis=0)-corners
lengths=np.linalg.norm(edges,axis=1)
across=edges[np.argmin(lengths)]/min(lengths)
if across[0]<0:across=-across
toward_camera=np.array([across[1],-across[0]])
basis=np.column_stack([across,toward_camera])
q=v[:,[0,2]]@basis
lo=q[phone].min(axis=0);hi=q[phone].max(axis=0)
scale=72.1/(hi[0]-lo[0])
xy=(q-np.array([(hi[0]+lo[0])/2,lo[1]]))*scale
# Fit only the unraised, central glass panel. Robust loss rejects scan spikes.
flat=(np.abs(xy[:,0])<24)&(xy[:,1]>22)&(xy[:,1]<93)&phone
A=np.column_stack([v[:,0],v[:,2],np.ones(len(v))])
plane=least_squares(lambda c:A[flat]@c-v[flat,1],np.linalg.lstsq(A[flat],v[flat,1],rcond=None)[0],loss='soft_l1',f_scale=.0007).x
height=(v[:,1]-A@plane)*scale
aligned=np.column_stack([xy,height])
np.savez_compressed(OUT/'aligned_scan.npz',vertices=aligned,faces=m.faces,rgb=rgb,phone_mask=phone)
report={'source':'iphone table scan.glb','scale_mm_per_scan_unit':float(scale),
        'phone_width_calibration_mm':72.1,'phone_scan_length_mm':float((hi[1]-lo[1])*scale),
        'rotation_across_xz':across.tolist(),'rotation_toward_camera_xz':toward_camera.tolist(),
        'scan_origin_xz_aligned':[(hi[0]+lo[0])/2,lo[1]],'flat_back_plane_coefficients':plane.tolist(),
        'flat_back_rms_residual_mm':float(np.std(height[flat])),
        'note':'X/Y calibrated uniformly from measured phone width. Scan height is noisy; actual 8.8/11.7/13.8 mm caliper totals govern vertical design.'}
(OUT/'scan_calibration.json').write_text(json.dumps(report,indent=2)+'\n')
fig,axs=plt.subplots(1,3,figsize=(15,10))
order=np.argsort(height[m.faces].mean(axis=1))
colors=rgb[m.faces].mean(axis=1)/255
axs[0].add_collection(PolyCollection(xy[m.faces][order],facecolors=colors[order],edgecolors='none'))
show=(abs(xy[:,0])<40)&(xy[:,1]>-3)&(xy[:,1]<154)
sc=axs[1].scatter(xy[show,0],xy[show,1],c=height[show],cmap='turbo',s=6,vmin=-1,vmax=6)
fig.colorbar(sc,ax=axs[1],label='Scan height above fitted back (mm)')
axs[2].scatter(xy[show,1],height[show],s=4,c=xy[show,0],cmap='coolwarm')
for ax in axs[:2]:ax.set(xlim=(-40,40),ylim=(-3,154),xlabel='Across phone (mm)',ylabel='From phone bottom (mm)');ax.set_aspect('equal');ax.grid(alpha=.2)
axs[0].set_title('Calibrated scan texture')
axs[1].set_title('Back relief / noisy scan geometry')
axs[2].set(xlim=(0,153),ylim=(-2,7),xlabel='From phone bottom (mm)',ylabel='Scan height above back (mm)');axs[2].grid(alpha=.2)
fig.tight_layout();fig.savefig(OUT/'aligned_scan.png',dpi=150)
print(json.dumps(report,indent=2))
for y in range(95,151,2):
 sel=phone&(xy[:,1]>=y)&(xy[:,1]<y+2)&(np.abs(xy[:,0])<28)
 if sel.any():print(y,int(sel.sum()),np.percentile(height[sel],[10,50,90]).round(2).tolist())
