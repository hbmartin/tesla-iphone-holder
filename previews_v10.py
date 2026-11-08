"""V10 installed geometry and dimensioned bridge/opening comparison."""
import json
import numpy as np
import trimesh
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from build_model import ROOT,rounded_profile,camera_rect
from model_v4 import phone_rect
from previews_v5 import patch,dim,header,stl_projection,contours,perspective,BG,INK,MUTED,COLORS


def render(out=ROOT/'output/v10'):
    p=json.loads((out/'parameters.json').read_text())
    m=trimesh.load_mesh(out/'holder_single_PROTOTYPE.stl')
    fig=plt.figure(figsize=(14,11),facecolor=BG)
    header(fig,'V10 / SINGLE-PIECE FIT PROTOTYPE','A hex bridge joins both sides',
           'Actual exported mesh · camera clearance retained · outward face down for printing')
    ax=fig.add_axes([.03,.06,.56,.77]);ax.set_aspect('equal');ax.axis('off')
    patch(stl_projection(m),ax,facecolor=COLORS['left'],edgecolor=INK,lw=.6)
    patch(rounded_profile(*phone_rect(p)),ax,facecolor='none',edgecolor='#344d78',ls='--',lw=1)
    patch(rounded_profile(*camera_rect(p,0)),ax,facecolor='#aa8fc4',edgecolor='#75618b',alpha=.3)
    ax.text(46.5,126,'Camera housing\n64.5 × 41.5 mm',ha='center',fontsize=10,color=INK)
    ax.text(46.5,74,'Central\nopening',ha='center',fontsize=11,color=MUTED)
    ax.text(46.5,19,'Phone bottom\nseats at crease',ha='center',fontsize=10,color=MUTED)
    dim(ax,(10,174),(83,174),'73 mm bridge construction span',offset=(0,4))
    ax.annotate('9 hexagons',xy=(46.5,156),xytext=(46.5,186),ha='center',fontsize=10,arrowprops=dict(arrowstyle='->',color=INK))
    ax.set(xlim=(-36,126),ylim=(-8,193))
    blocks=[(.79,'LEFT CUTOUT','Another 0.5 mm toward the console wall\nCenter X: −0.5 → −1.0 mm\nWidth and rounded endpoints retained'),
        (.61,'UPPER BRIDGE','One fused solid, attached at both ends\n18.2 mm band above the camera opening\n9 × 6 mm hexagons, 1.6 mm webs\nAt least 3.1 mm border around bridge holes'),
        (.40,'RETAINED FIT','Right opening unchanged\n65.1 × 42.1 mm rounded camera clearance\nConsole contour and 1.0 → 4.4 mm taper\nPhone seating and existing honeycomb'),
        (.20,'PHYSICAL TEST','Seat both nub openings together\nCheck the new bridge and camera clearance\nConfirm no rocking or forced engagement\nLens contact diagnostic remains unverified')]
    for y,title,body in blocks:
        fig.text(.61,y,title,fontsize=11,weight='bold',color=INK)
        fig.text(.61,y-.028,body,fontsize=10.5,color=MUTED,va='top',linespacing=1.65)
    for ext in ['png','svg']:fig.savefig(out/'previews'/f'assembly_top.{ext}',dpi=165,facecolor=BG)
    plt.close(fig)
    fig,axs=plt.subplots(1,2,figsize=(14,6),facecolor=BG)
    old=trimesh.load_mesh(ROOT/'output/v9/left_insert_PROTOTYPE.stl')
    for mesh,col,ls,label in [(old,'#8c61a4','--','V9'),(m,COLORS['left'],'-','V10')]:
        for i,line in enumerate(contours(mesh,[0,0,1],[0,0,1])):
            axs[0].plot(line[:,0],line[:,1],color=col,ls=ls,lw=2,label=label if i==0 else None)
    axs[0].set(xlim=(-11,9),ylim=(110,125),xlabel='Installed X (mm)',ylabel='Y from crease (mm)',title='Left opening: another 0.5 mm left')
    axs[0].set_aspect('equal');axs[0].legend(frameon=False);axs[0].grid(alpha=.15)
    for line in contours(m,[0,0,1],[0,0,1]):axs[1].plot(line[:,0],line[:,1],color=COLORS['left'],lw=1.5)
    axs[1].set(xlim=(7,86),ylim=(137,171),xlabel='Installed X (mm)',ylabel='Y from crease (mm)',title='Bridge and preserved rounded camera opening')
    axs[1].set_aspect('equal');axs[1].grid(alpha=.15)
    dim(axs[1],(85,146.8),(85,165),'18.2',offset=(2,0),rotation=90)
    fig.suptitle('V10 / Actual mesh sections at Z = 1 mm',fontsize=19,color=INK)
    fig.text(.04,.05,'Opening center spacing is now 94.0 mm. Single-piece engagement on both console nubs remains a physical fit check.',fontsize=10.5,color=MUTED)
    fig.tight_layout(rect=(.01,.12,.99,.91));fig.savefig(out/'previews/bridge_and_left_shift.png',dpi=170);plt.close(fig)
    # Reuse the actual-mesh perspective renderer, with one continuous model.
    perspective(out,p,{'left':m})
    print('V10 previews rendered.',flush=True)


if __name__=='__main__':render()
