"""Dimensioned comparisons from the actual V8 and V9 exported meshes."""
import json
import numpy as np
import trimesh
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from build_model import ROOT,rounded_profile,camera_rect
from model_v4 import phone_rect
from model_v9 import nub_width
from previews_v5 import patch,dim,header,stl_projection,contours,perspective,BG,INK,MUTED,COLORS


def render(out=ROOT/'output/v9'):
    p=json.loads((out/'parameters.json').read_text())
    ms={s:trimesh.load_mesh(out/f'{s}_insert_PROTOTYPE.stl') for s in ['left','right']}
    old={s:trimesh.load_mesh(ROOT/'output/v8'/f'{s}_insert_PROTOTYPE.stl') for s in ms}
    fig=plt.figure(figsize=(14,10),facecolor=BG)
    header(fig,'V9 / FINAL FIT ADJUSTMENTS','Left opening shifts; right opening tightens',
           'Dimensioned exported models · V8 console contour retained · physical fit remains unverified')
    ax=fig.add_axes([.04,.07,.53,.76]);ax.set_aspect('equal');ax.axis('off')
    for side,m in ms.items():patch(stl_projection(m),ax,facecolor=COLORS[side],edgecolor=INK,lw=.5)
    patch(rounded_profile(*phone_rect(p)),ax,facecolor='none',edgecolor='#344d78',ls='--',lw=1)
    patch(rounded_profile(*camera_rect(p,0)),ax,facecolor='#aa8fc4',alpha=.3,edgecolor='#75618b')
    ax.text(46.5,126,'Camera housing\n64.5 × 41.5 mm',ha='center',fontsize=10,color=INK)
    ax.text(46.5,74,'Central\nopening',ha='center',fontsize=11,color=MUTED)
    ax.text(46.5,19,'First 36 mm\nclear for phone seating',ha='center',fontsize=9,color=MUTED)
    ax.plot([-22,110],[0,0],color=INK);ax.text(46.5,-7,'Lower crease · Y = 0',ha='center',fontsize=9)
    dim(ax,(-32,0),(-32,150),'150 mm',offset=(-3,0),rotation=90)
    dim(ax,(10.95,175),(82.05,175),'71.1 mm',offset=(0,3))
    ax.set(xlim=(-43,133),ylim=(-13,186))
    blocks=[(.78,'LEFT OPENING','Move 0.5 mm toward the console wall\nCenter X: 0.0 → −0.5 mm\nRetain 0.3 mm side / 0.7 mm end clearances\nOuter contour and corner stay fixed'),
        (.57,'RIGHT OPENING','0.2 mm narrower overall\n0.4 mm shorter, entirely from the TOP\nBottom Y stays 24.45 mm\nTop Y: 160.47 → 160.07 mm'),
        (.36,'RETAINED FROM V8','1.0 → 4.4 mm thickness taper\n65.1 × 42.1 mm camera opening\nConsole contour, seating and honeycomb\nExisting curved nub sides and rounded ends'),
        (.15,'FULL-PAIR TEST','Use the full left part to assess alignment\nCheck seating, side play and end play\nRetained 5 mm lens projection diagnostic')]
    for y,title,body in blocks:
        fig.text(.61,y,title,fontsize=11,weight='bold',color=INK)
        fig.text(.61,y-.027,body,fontsize=10.5,color=MUTED,va='top',linespacing=1.6)
    for ext in ['png','svg']:fig.savefig(out/'previews'/f'assembly_top.{ext}',dpi=160,facecolor=BG)
    plt.close(fig)

    fig,axs=plt.subplots(1,3,figsize=(15,7),facecolor=BG)
    specifications=[('left',(-11,10),(110,125),'Left: −0.5 mm X shift'),
                    ('right',(82,104),(150,164),'Right upper end: −0.4 mm Y'),
                    ('right',(82,104),(21,35),'Right lower end: fixed')]
    for ax,(side,xlim,ylim,title) in zip(axs,specifications):
        for models,color,style,label in [(old,'#8c61a4','--','V8'),(ms,COLORS[side],'-','V9')]:
            for i,line in enumerate(contours(models[side],[0,0,1],[0,0,1.])):
                ax.plot(line[:,0],line[:,1],color=color,ls=style,lw=2,label=label if i==0 else None)
        ax.set(xlim=xlim,ylim=ylim,xlabel='Installed X (mm)',ylabel='From crease, Y (mm)',title=title)
        ax.set_aspect('equal');ax.legend(frameon=False);ax.grid(alpha=.15)
    axs[0].axvline(0,ls=':',color='#8c61a4',lw=1);axs[0].axvline(-.5,ls=':',color=COLORS['left'],lw=1)
    axs[1].annotate('160.07 mm',xy=(93,160.07),xytext=(97,162.5),fontsize=10,arrowprops=dict(arrowstyle='->',color=INK))
    axs[2].annotate('24.45 mm\nunchanged',xy=(93,24.45),xytext=(97,22.5),fontsize=10,arrowprops=dict(arrowstyle='->',color=INK))
    fig.suptitle('V8 → V9 / Cutout changes at 1 mm above the pad',fontsize=19,color=INK)
    fig.text(.05,.055,'Right width decreases 0.2 mm at every height. Only the upper end moves; the lower endpoint stays fixed.',fontsize=11,color=MUTED)
    fig.tight_layout(rect=(.02,.1,.99,.93));fig.savefig(out/'previews/opening_changes.png',dpi=180);plt.close(fig)

    fig,axs=plt.subplots(1,3,figsize=(15,6),facecolor=BG)
    for ax,side,y in zip(axs[:2],['left','right'],[120,80]):
        for line in contours(ms[side],[0,1,0],[0,y,0]):ax.fill(line[:,0]-p[side+'_nub_x'],line[:,2],color=COLORS[side],ec=INK,lw=.5)
        z=1+p['outer_top_slope']*y;cx=p[side+'_opening_x_offset'];half=nub_width(p,side,z)/2
        dim(ax,(cx-half,z+.4),(cx+half,z+.4),f'{2*half:.2f} mm at this rim',offset=(0,.8))
        base=nub_width(p,side,0)
        dim(ax,(cx-base/2,-.6),(cx+base/2,-.6),f'{base:.1f} mm underside',offset=(0,-.6))
        ax.set(xlim=(-24,24),ylim=(-2.1,6.8),xlabel='From V8 reference centerline (mm)',ylabel='Height above pad (mm)',title=f'{side.title()} at Y = {y} mm')
        ax.set_aspect('equal');ax.spines[['top','right']].set_visible(False)
    zs=np.linspace(0,4.4,150)
    for side in ms:axs[2].plot([nub_width(p,side,float(z)) for z in zs],zs,color=COLORS[side],lw=2,label=f'V9 {side}')
    axs[2].scatter([17,7.5],[0,4.4],color=INK,label='Direct nub measurements')
    axs[2].scatter([12],[2],marker='D',color='#b49023',label='Photo estimate')
    axs[2].set(xlabel='Total opening width (mm)',ylabel='Height above flat pad (mm)',title='Widths follow absolute pad height')
    axs[2].legend(frameon=False,fontsize=9);axs[2].grid(alpha=.15)
    fig.suptitle('V9 / Nub profiles and actual sloped-rim sections',fontsize=19,color=INK)
    fig.text(.04,.025,'Reference widths at Z = 0 / 2 / 4.4 mm: LEFT 17.6 / 12.6 / 8.1 mm · RIGHT 17.4 / 12.4 / 7.9 mm.',fontsize=11,color=MUTED)
    fig.tight_layout(rect=(.01,.08,.99,.92));fig.savefig(out/'previews/nub_sections.png',dpi=170);plt.close(fig)
    perspective(out,p,ms)
    print('V9 dimensioned mesh previews rendered.',flush=True)


if __name__=='__main__':render()
