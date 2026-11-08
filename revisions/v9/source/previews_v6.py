"""V6 dimensioned previews and comparisons from actual exported STL sections."""
import json
from pathlib import Path
import numpy as np
import trimesh
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from previews_v5 import top_view,perspective,sections,contours,BG,INK,MUTED,COLORS
from model_v6 import nub_blends,setbacks


def changes(out,p,meshes):
    root=Path(__file__).resolve().parent
    old={s:trimesh.load_mesh(root/f'output/v5/{s}_insert_PROTOTYPE.stl') for s in meshes}
    fig,axs=plt.subplots(2,2,figsize=(13,9),facecolor=BG)
    definitions=[('left',[0,1,0],[0,75,0],0,(-16,-8),(-.2,2.8),'Left-wall underside · section Y = 75 mm'),
                 ('right',[1,0,0],[93,0,0],1,(-.3,7),(-.2,1.7),'Front underside · section X = 93 mm'),
                 ('left',[1,0,0],[0,0,0],1,(87,96),(-.2,4),'Left nub lower end · unchanged rim positions'),
                 ('left',[1,0,0],[0,0,0],1,(147,155),(-.2,5),'Left nub upper end · separate curve shape')]
    for ax,(side,normal,origin,k,xlim,ylim,title) in zip(axs.flat,definitions):
        for line in contours(meshes[side],normal,origin):
            ax.fill(line[:,k],line[:,2],facecolor=COLORS[side],edgecolor=INK,lw=.7,alpha=.8)
        for line in contours(old[side],normal,origin):
            ax.plot(line[:,k],line[:,2],color='#954e82',ls='--',lw=1.5)
        ax.set(xlim=xlim,ylim=ylim,title=title,xlabel=('Installed X' if k==0 else 'From crease, Y')+' (mm)',ylabel='Height normal to pad (mm)')
        ax.set_facecolor(BG);ax.spines[['top','right']].set_visible(False)
        ax.tick_params(colors=MUTED)
    fig.suptitle('V6 / Changes from V5 in the exported geometry',fontsize=20,color=INK)
    fig.text(.06,.045,'Solid = V6 · dashed = V5 · photo shapes are normalized into bounded prototype transitions; physical fit remains untested.',fontsize=10,color=MUTED)
    fig.tight_layout(rect=(.025,.08,.985,.93),h_pad=2.5,w_pad=3)
    fig.savefig(out/'previews/contour_changes.png',dpi=180,facecolor=BG);plt.close(fig)

    fig,axs=plt.subplots(1,2,figsize=(12,5.5),facecolor=BG)
    u=np.linspace(0,1,201)
    values=np.array([nub_blends(p,float(t)) for t in u])
    for i,label in enumerate(['Width','Lower end','Upper end']):axs[0].plot(u,values[:,i],label=label)
    axs[0].plot(u,u*u*(3-2*u),'--',color=MUTED,label='V5 smoothstep')
    axs[0].set(xlabel='Fraction of local insert height',ylabel='Fraction of specified inward reduction',title='Nub shape changes; endpoint dimensions retained')
    z=np.linspace(0,1,201)
    offsets=np.array([setbacks(p,'left',float(t)) for t in z])
    axs[1].plot(offsets[:,0],z,label='Left wall / P2')
    axs[1].plot(offsets[:,1],z,label='Front / P1')
    axs[1].set(xlabel='Underside outline setback (mm)',ylabel='Height above pad (mm)',title='Bounded underside transitions')
    for ax in axs:
        ax.legend(frameon=False,fontsize=9);ax.set_facecolor(BG);ax.spines[['top','right']].set_visible(False);ax.grid(alpha=.15)
    fig.suptitle('V6 / How the photographed curve shapes are applied',fontsize=18,color=INK)
    fig.text(.05,.035,'Dimensions are prototype caps, not recovered console measurements. Source mappings and assumptions are in parameters.json.',fontsize=9.5,color=MUTED)
    fig.tight_layout(rect=(.02,.09,.99,.92),w_pad=3)
    fig.savefig(out/'previews/contour_mapping.png',dpi=180,facecolor=BG);plt.close(fig)


def render(out):
    out=Path(out);report=json.loads((out/'validation/geometry_report.json').read_text());p=report['parameters']
    meshes={s:trimesh.load_mesh(out/f'{s}_insert_PROTOTYPE.stl') for s in ('left','right')}
    top_view(out,p,meshes,report);perspective(out,p,meshes);sections(out,p,meshes,report)
    changes(out,p,meshes)
    print('V6 mesh previews, dimensions, actual contour comparisons and mapping plots rendered.',flush=True)
