"""V8 dimensioned previews from the exported meshes and recorded photo estimates."""
import json
import numpy as np
import trimesh
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from build_model import ROOT,rounded_profile,camera_rect
from model_v4 import phone_rect,outer_height,phone_height
from model_v8 import nub_width,corner_points
from model_v7 import nub_width as old_width
from previews_v5 import patch,dim,header,stl_projection,perspective,contours,BG,INK,MUTED,COLORS


def render(out=ROOT/'output/v8'):
    p=json.loads((out/'parameters.json').read_text())
    oldp=json.loads((ROOT/'output/v7/parameters.json').read_text())
    evidence=json.loads((out/'evidence/photo_estimates.json').read_text())
    ms={s:trimesh.load_mesh(out/f'{s}_insert_PROTOTYPE.stl') for s in ['left','right']}
    fig=plt.figure(figsize=(14,10),facecolor=BG)
    header(fig,'V8 / PHOTO-INFORMED FIT','Closer nub fit and a completed console turn',
           'Actual exported models · direct measurements retained · photo estimates remain provisional')
    ax=fig.add_axes([.04,.08,.54,.75]);ax.set_aspect('equal');ax.axis('off')
    for side,m in ms.items():patch(stl_projection(m),ax,facecolor=COLORS[side],edgecolor=INK,lw=.5)
    patch(rounded_profile(*phone_rect(p)),ax,facecolor='none',edgecolor='#344d78',ls='--',lw=1)
    patch(rounded_profile(*camera_rect(p,0)),ax,facecolor='#aa8fc4',alpha=.3,edgecolor='#75618b')
    ax.text(46.5,127,'Camera housing\n64.5 × 41.5',ha='center',va='center',fontsize=10,color=INK)
    ax.text(46.5,74,'Central\nopening',ha='center',fontsize=11,color=MUTED)
    ax.text(46.5,19,'Phone footprint\nclear below 36 mm',ha='center',fontsize=9,color=MUTED)
    ax.plot([-22,110],[0,0],color=INK,lw=1.3);ax.text(46.5,-7,'Estimated lower crease · Y = 0',ha='center',fontsize=9)
    dim(ax,(-32,0),(-32,150),'150 mm',offset=(-3,0),rotation=90)
    dim(ax,(10.95,175),(82.05,175),'71.1 mm',offset=(0,3))
    dim(ax,(118,0),(118,105),'105 mm to housing',offset=(4,0),rotation=90)
    ax.set(xlim=(-43,133),ylim=(-13,186))
    blocks=[(.78,'NUB OPENINGS','17.6 mm at the underside\n12.6 mm at 2 mm above the pad\n8.1 mm at the 4.4 mm reference height\n0.3 mm allowance per side'),
        (.58,'PHOTO ESTIMATES','Nub width at Z = 2: approximately 12 mm\nLeft base end to crease: approximately 95 mm\nBoth nub positions shift 6.1 mm from V7\n93 mm center spacing remains unchanged'),
        (.38,'LOWER CONSOLE CONTOUR','Complete turn fitted to the visible transition\n0.5 mm allowance along the lower outline\n1.2 mm round removes the pointed tip\nUpper measured wall gaps and inset retained'),
        (.18,'READY FOR ANOTHER FIT CHECK','Full left and right inserts + L8 / R8 / C8 samples\nOuter thickness: 1.0 → 4.4 mm\nCamera opening: 65.1 × 42.1 mm\nPhysical fit and lens clearance unverified')]
    for y,title,body in blocks:
        fig.text(.62,y,title,fontsize=10.5,weight='bold',color=INK)
        fig.text(.62,y-.026,body,fontsize=10,color=MUTED,va='top',linespacing=1.6)
    for ext in ['png','svg']:fig.savefig(out/'previews'/f'assembly_top.{ext}',dpi=170,facecolor=BG)
    plt.close(fig);perspective(out,p,ms)

    fig,axs=plt.subplots(1,3,figsize=(15,5.5),facecolor=BG)
    for ax,side,y in zip(axs[:2],['left','right'],[120,80]):
        z=outer_height(p,y);cx=p[side+'_nub_x']
        for line in contours(ms[side],[0,1,0],[0,y,0]):ax.fill(line[:,0]-cx,line[:,2],color=COLORS[side],ec=INK,lw=.5)
        half=nub_width(p,z)/2
        dim(ax,(-half,z+.45),(half,z+.45),f'{2*half:.2f} mm at this rim',offset=(0,.8))
        dim(ax,(-8.8,-.6),(8.8,-.6),'17.6 mm underside',offset=(0,-.6))
        ax.set(xlim=(-24,24),ylim=(-2.1,6.8),xlabel='Across nub centerline (mm)',ylabel='Height above pad (mm)',title=f'{side.title()} at Y = {y} mm')
        ax.set_aspect('equal');ax.spines[['top','right']].set_visible(False)
    zs=np.linspace(0,4.4,150)
    axs[2].plot([old_width(oldp,float(z)) for z in zs],zs,color='#9b64a0',ls='--',label='V7 opening')
    axs[2].plot([nub_width(p,float(z)) for z in zs],zs,color=COLORS['left'],lw=2,label='V8 opening (+0.3 / side)')
    axs[2].plot([nub_width(p,float(z),0) for z in zs],zs,color=MUTED,lw=1,label='Estimated nub profile')
    axs[2].scatter([17,7.5],[0,4.4],color='#b44c31',zorder=5,label='Direct measurements')
    axs[2].scatter([12],[2],color='#b49023',marker='D',zorder=5,label='Photo estimate')
    axs[2].set(xlabel='Total width (mm)',ylabel='Actual height above pad (mm)',title='Reduced intermediate flare')
    axs[2].legend(frameon=False,fontsize=8);axs[2].grid(alpha=.15)
    fig.suptitle('V8 / Nub openings follow pad height, including the new photo estimate',fontsize=17,color=INK)
    fig.text(.04,.03,'The wider base is retained. The intermediate profile is narrower; 8.1 mm applies only at Z = 4.4, not along the entire sloped rim.',fontsize=10,color=MUTED)
    fig.tight_layout(rect=(.01,.10,.99,.91),w_pad=2.5);fig.savefig(out/'previews/nub_sections.png',dpi=170);plt.close(fig)

    fig,axs=plt.subplots(1,2,figsize=(12,7),facecolor=BG)
    old=trimesh.load_mesh(ROOT/'output/v7/left_insert_PROTOTYPE.stl');old.apply_translation([0,6.1,0])
    for ax,z in zip(axs,[.1,1.]):
        for m,color,label in [(old,'#9b64a0','V7, registered to new crease'),(ms['left'],COLORS['left'],'V8')]:
            first=True
            for line in contours(m,[0,0,1],[0,0,z]):
                ax.plot(line[:,0],line[:,1],color=color,lw=1.5,label=label if first else None);first=False
        q=np.array(evidence['corner_photo_points_in_new_frame_mm'])
        ax.plot(q[:,0],q[:,1],'.',color='#3a3b40',label='Photo transition estimate')
        ax.set(xlim=(-20,28),ylim=(-1,45),xlabel='Installed X (mm)',ylabel='From estimated crease, Y (mm)',title=f'Actual STL section at Z = {z:g} mm')
        ax.set_aspect('equal');ax.grid(alpha=.15);ax.legend(frameon=False,fontsize=8,loc='upper right')
    fig.suptitle('V8 / Lower-left corner: complete curve and rounded termination',fontsize=17,color=INK)
    fig.text(.06,.035,'The photo transition is not a calibrated console surface. The underside retains relief; C8 isolates this contour for a short test.',fontsize=10,color=MUTED)
    fig.tight_layout(rect=(.02,.12,.99,.93));fig.savefig(out/'previews/corner_comparison.png',dpi=170);plt.close(fig)

    fig,axs=plt.subplots(1,4,figsize=(12,8),facecolor=BG)
    names=['left_nub_fit_V8','right_nub_fit_V8','lower_left_corner_C8']
    for ax,name,title in zip(axs,names,['L8 · left nub','R8 · right nub','C8 · lower-left corner']):
        m=trimesh.load_mesh(out/'fit_tests'/f'{name}.stl')
        patch(stl_projection(m),ax,facecolor=COLORS['right' if name.startswith('right') else 'left'],edgecolor=INK,lw=.5)
        xmin,ymin,_=m.bounds[0];xmax,ymax,_=m.bounds[1]
        ax.set(xlim=(xmin-3,xmax+3),ylim=(ymin-3,ymax+3));ax.set_aspect('equal');ax.axis('off');ax.set_title(title,fontsize=11,color=INK)
    axs[3].axis('off');axs[3].text(0,.85,'Fit sequence\n\n1. Remove supports.\n2. Try L8 and R8.\n3. Check sideways play.\n4. Try C8 at the corner.\n5. Check contact and rocking.\n\nAll use the final geometry.\nLabels are recessed.',va='top',fontsize=10.5,color=INK,linespacing=1.6)
    fig.suptitle('V8 / Three fit samples matching the full inserts',fontsize=20,color=INK)
    fig.tight_layout(rect=(.02,.03,.99,.94));fig.savefig(out/'previews/fit_samples.png',dpi=170);plt.close(fig)

    fig,ax=plt.subplots(figsize=(12,5),facecolor=BG)
    for line in contours(ms['right'],[1,0,0],[103,0,0]):ax.fill(line[:,1],line[:,2],facecolor=COLORS['right'],alpha=.65,ec=INK,lw=.5)
    yy=np.linspace(0,150,150);ax.plot(yy,phone_height(p,yy),label='Relieved phone-back support plane',color='#344d78',lw=2)
    cy=np.linspace(105,146.5,50);gap=phone_height(p,cy)-5
    ax.fill_between(cy,gap,0,color='#ad3c30',alpha=.2,label='Predicted lens interference, rigid flat pad')
    ax.axhline(0,color=INK,lw=.8);dim(ax,(0,-2.7),(36,-2.7),'First 36 mm clear',offset=(0,-.65))
    ax.set(xlim=(-4,170),ylim=(-4,6),xlabel='Distance from estimated crease (mm)',ylabel='Height normal to pad (mm)',title='V8 / Phone seating and retained lens diagnostic')
    ax.legend(frameon=False,loc='upper left',fontsize=9);ax.spines[['top','right']].set_visible(False)
    fig.tight_layout();fig.savefig(out/'previews/taper_section.png',dpi=170);plt.close(fig)
    print('V8 mesh previews rendered.',flush=True)


if __name__=='__main__':render()
