"""V7 previews measured from exported meshes, including fit samples."""
from pathlib import Path
import json
import math
import numpy as np
import trimesh
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection
from build_model import ROOT,rounded_profile,camera_rect
from model_v4 import phone_rect,outer_height,phone_height
from model_v7 import nub_width,wall_x,corner_offset
from previews_v5 import patch,dim,header,stl_projection,perspective,contours,BG,INK,MUTED,COLORS


def render(out=ROOT/'output/v7'):
    out=Path(out);r=json.loads((out/'validation/geometry_report.json').read_text());p=r['parameters']
    ms={s:trimesh.load_mesh(out/f'{s}_insert_PROTOTYPE.stl') for s in ['left','right']}
    fig=plt.figure(figsize=(14,10),facecolor=BG)
    header(fig,'V7 / MEASURED WIDTHS','Larger nub openings and a traced console corner',
           'Actual exported models · 0.5 mm selected clearance per nub side · physical fit remains untested')
    ax=fig.add_axes([.04,.08,.54,.75]);ax.set_aspect('equal');ax.axis('off')
    for side,m in ms.items():patch(stl_projection(m),ax,facecolor=COLORS[side],edgecolor=INK,lw=.5)
    patch(rounded_profile(*phone_rect(p)),ax,facecolor='none',edgecolor='#344d78',ls='--',lw=1)
    patch(rounded_profile(*camera_rect(p,0)),ax,facecolor='#aa8fc4',alpha=.3,edgecolor='#75618b')
    ax.text(46.5,127,'Camera housing\n64.5 × 41.5',ha='center',va='center',fontsize=10,color=INK)
    ax.text(46.5,74,'Central\nopening',ha='center',fontsize=11,color=MUTED)
    ax.text(46.5,19,'Phone footprint\nclear below 36 mm',ha='center',fontsize=9,color=MUTED)
    ax.plot([-22,110],[0,0],color=INK,lw=1.3);ax.text(46.5,-7,'Lower crease · Y = 0',ha='center',fontsize=9)
    dim(ax,(-32,0),(-32,150),'150 mm',offset=(-3,0),rotation=90)
    dim(ax,(10.95,171),(82.05,171),'71.1 mm',offset=(0,3))
    dim(ax,(118,0),(118,105),'105 mm to housing',offset=(4,0),rotation=90)
    ax.set(xlim=(-43,133),ylim=(-13,182))
    blocks=[(.78,'NUB CLEARANCE','Measured: 17 mm at base; 7.5 mm at Z = 4.4\nOpenings: 18.0 mm below; 8.5 mm at Z = 4.4\nWider openings where the sloped insert is lower\n93 mm center spacing retained'),
       (.58,'LEFT WALL AND CORNER','Base-edge wall gaps: 10.3 / 14.7 mm\n0.5 mm wall clearance + 2 mm inset retained\nN4 traced corner replaces the guessed R15\nCorner position and underside remain provisional'),
       (.38,'SEATING AND CAMERA','Outer taper: 1.0 → 4.4 mm; hard limit 4.5\nPhone-bottom space open to console crease\nCamera opening: 65.1 × 42.1 mm\n5 mm lens projection retained as a diagnostic'),
       (.18,'TEST BEFORE THE FULL HOLDER','L3/R3, L5/R5, L7/R7: 0.3 / 0.5 / 0.7 per side\nC7: actual lower 40 mm of the left piece\nNub samples preserve the installed taper\nConsole side down; remove all supports')]
    for y,title,body in blocks:
        fig.text(.62,y,title,fontsize=10.5,weight='bold',color=INK)
        fig.text(.62,y-.026,body,fontsize=10,color=MUTED,va='top',linespacing=1.6)
    for ext in ['png','svg']:fig.savefig(out/'previews'/f'assembly_top.{ext}',dpi=170,facecolor=BG)
    plt.close(fig);perspective(out,p,ms)

    fig,axs=plt.subplots(1,3,figsize=(15,5),facecolor=BG)
    for ax,side,y in zip(axs[:2],['left','right'],[120,80]):
        z=outer_height(p,y);cx=p[side+'_nub_x']
        for line in contours(ms[side],[0,1,0],[0,y,0]):ax.fill(line[:,0]-cx,line[:,2],color=COLORS[side],ec=INK,lw=.5)
        half=nub_width(p,z)/2
        dim(ax,(-half,z+.45),(half,z+.45),f'{2*half:.2f} mm at this rim',offset=(0,.8))
        dim(ax,(-9,-.6),(9,-.6),'18.0 mm underside',offset=(0,-.6))
        ax.set(xlim=(-24,24),ylim=(-2.1,6.8),xlabel='Across nub centerline (mm)',ylabel='Height above pad (mm)',title=f'{side.title()} at Y = {y} mm')
        ax.set_aspect('equal');ax.spines[['top','right']].set_visible(False)
    zs=np.linspace(0,4.4,150)
    axs[2].plot([nub_width(p,float(z),0) for z in zs],zs,color=MUTED,label='Interpolated nub envelope')
    axs[2].plot([nub_width(p,float(z)) for z in zs],zs,color=COLORS['left'],label='Opening with 0.5 / side')
    axs[2].scatter([17,7.5],[0,4.4],color='#b44c31',zorder=5,label='User measurements')
    axs[2].set(xlabel='Total width (mm)',ylabel='Actual height above pad (mm)',title='One width profile at every Y station')
    axs[2].legend(frameon=False,fontsize=8);axs[2].grid(alpha=.15)
    fig.suptitle('V7 / Actual nub sections and the absolute-height correction',fontsize=18,color=INK)
    fig.text(.04,.035,'Intermediate widths use a conservative elliptical interpolation. Only the two marked anchors are direct width/height measurements.',fontsize=10,color=MUTED)
    fig.tight_layout(rect=(.01,.10,.99,.92),w_pad=2.5);fig.savefig(out/'previews/nub_sections.png',dpi=170);plt.close(fig)

    fig,axs=plt.subplots(1,2,figsize=(12,7),facecolor=BG)
    old=trimesh.load_mesh(ROOT/'output/v6/left_insert_PROTOTYPE.stl')
    for ax,z in zip(axs,[.1,1.]):
        for m,color,label in [(old,'#9b64a0','V6'),(ms['left'],COLORS['left'],'V7')]:
            first=True
            for line in contours(m,[0,0,1],[0,0,z]):
                ax.plot(line[:,0],line[:,1],color=color,lw=1.5,label=label if first else None);first=False
        ax.set(xlim=(-18,27),ylim=(-1,45),xlabel='Installed X (mm)',ylabel='From crease, Y (mm)',title=f'Actual STL outline at Z = {z:g} mm')
        ax.set_aspect('equal');ax.grid(alpha=.15);ax.legend(frameon=False)
    fig.suptitle('V7 / Lower-left corner: traced turn and rounded underside',fontsize=18,color=INK)
    fig.text(.06,.035,'N4 supplies about %.1f mm of corner run and %.1f mm inward turn. Placement at the crease is provisional; test C7 first.'%(p['left_corner_profile'][-1][0],p['left_corner_profile'][0][1]),fontsize=10,color=MUTED)
    fig.tight_layout(rect=(.02,.14,.99,.93));fig.savefig(out/'previews/corner_comparison.png',dpi=170);plt.close(fig)

    fig,axs=plt.subplots(2,4,figsize=(14,9),facecolor=BG)
    files=[out/'fit_tests'/f'{s}_nub_clearance_{n:02d}.stl' for s in ['left','right'] for n in [3,5,7]]+[out/'fit_tests/lower_left_corner_C7.stl']
    for ax,path in zip(axs.flat,files):
        m=trimesh.load_mesh(path);color=COLORS['left'] if path.name.startswith(('left','lower')) else COLORS['right']
        patch(stl_projection(m),ax,facecolor=color,edgecolor=INK,lw=.5)
        xmin,ymin,_=m.bounds[0];xmax,ymax,_=m.bounds[1]
        ax.set(xlim=(xmin-3,xmax+3),ylim=(ymin-3,ymax+3));ax.set_aspect('equal');ax.axis('off')
        if 'clearance' in path.name:
            side=path.name[0].upper();c=int(path.stem[-2:])/10
            title=f'{side}{int(c*10)} · {c:.1f} mm per side'
        else:title='C7 · independent corner sample'
        ax.set_title(title,fontsize=11,color=INK)
    axs.flat[-1].axis('off')
    axs.flat[-1].text(0,.85,'Fit sequence\n\n1. Remove supports.\n2. Try L5 and R5 separately.\n3. Compare 3 / 7 if needed.\n4. Try C7 without a nub.\n5. Report seating and rocking.\n\nLabels are recessed.\nFull holder uses L5 / R5 fit.',va='top',fontsize=11,color=INK,linespacing=1.6)
    fig.suptitle('V7 / Seven isolated fit samples',fontsize=21,color=INK)
    fig.tight_layout(rect=(.02,.03,.99,.94));fig.savefig(out/'previews/fit_samples.png',dpi=170);plt.close(fig)

    fig,ax=plt.subplots(figsize=(12,5),facecolor=BG)
    for line in contours(ms['right'],[1,0,0],[103,0,0]):ax.fill(line[:,1],line[:,2],facecolor=COLORS['right'],alpha=.65,ec=INK,lw=.5)
    yy=np.linspace(0,150,150);ax.plot(yy,phone_height(p,yy),label='Relieved phone-back support plane',color='#344d78',lw=2)
    cy=np.linspace(105,146.5,50);gap=phone_height(p,cy)-5
    ax.fill_between(cy,gap,0,color='#ad3c30',alpha=.2,label='Predicted lens interference, flat rigid pad')
    ax.axhline(0,color=INK,lw=.8);dim(ax,(0,-2.7),(36,-2.7),'First 36 mm clear',offset=(0,-.65))
    ax.set(xlim=(-4,170),ylim=(-4,6),xlabel='Distance from lower crease (mm)',ylabel='Height normal to pad (mm)',title='V7 / Phone seating and the retained lens diagnostic')
    ax.legend(frameon=False,loc='upper left',fontsize=9);ax.spines[['top','right']].set_visible(False)
    fig.tight_layout();fig.savefig(out/'previews/taper_section.png',dpi=170);plt.close(fig)
    print('V7 assembly, sections, corner comparison, fit samples and seating previews rendered.',flush=True)


if __name__=='__main__':render()
