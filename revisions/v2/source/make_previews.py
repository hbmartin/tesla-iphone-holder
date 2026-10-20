#!/usr/bin/env python3
"""Render dimensional and shaded previews from the actual exported meshes."""
from pathlib import Path
import json
import numpy as np
import trimesh
from shapely.geometry import Polygon,shape
from shapely.ops import unary_union
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.path import Path as MPath
from matplotlib.patches import PathPatch,Circle,Rectangle
from matplotlib.colors import to_rgb
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
from build_model import rounded_profile,nub_rect,camera_rect

ROOT=Path(__file__).resolve().parent
OUT=ROOT/"output/v2"
BG="#f4f5f0";INK="#182e36";MUTED="#60727a"
COLORS={"left":"#168f8b","right":"#e1824c"}


def patch(poly,ax,**kwargs):
    # Consistent winding makes polygon holes transparent.
    from shapely.geometry.polygon import orient
    poly=orient(poly,sign=1.0)
    vertices=[];codes=[]
    for ring in [poly.exterior,*poly.interiors]:
        pts=list(ring.coords)
        vertices.extend(pts)
        codes.extend([MPath.MOVETO]+[MPath.LINETO]*(len(pts)-2)+[MPath.CLOSEPOLY])
    ax.add_patch(PathPatch(MPath(vertices,codes),**kwargs))


def profiles():
    result={}
    for side in ("left","right"):
        mesh=trimesh.load_mesh(OUT/f"{side}_insert_PROTOTYPE.stl")
        result[side]=unary_union([Polygon(t[:,:2]) for t in mesh.triangles[mesh.face_normals[:,2]>.01]])
    return result


def top_view(p,ps):
    fig=plt.figure(figsize=(14,10),facecolor=BG)
    fig.text(.06,.94,"CONSOLE / 01",fontsize=11,fontweight="bold",color=COLORS["left"],family="sans-serif")
    fig.text(.06,.895,"Two-piece phone holder",fontsize=27,fontweight="bold",color=INK)
    fig.text(.06,.858,"iPhone 18 Pro  ·  left factory charging bay  ·  estimated-fit prototype",fontsize=11.5,color=MUTED)
    ax=fig.add_axes([.055,.08,.53,.74]);ax.set_aspect("equal");ax.set_axis_off()
    patch(rounded_profile(44,89,128,186,11),ax,facecolor="#e5e8e2",edgecolor="#d3d9d1",lw=1)
    phone=rounded_profile(p["phone_center_x"],p["phone_bottom_y"]+p["phone_length"]/2,
                          p["phone_width"],p["phone_length"],p["phone_corner_radius"])
    patch(phone,ax,facecolor="#ffffff",alpha=.75,edgecolor="none",zorder=2)
    for side in ("left","right"):
        patch(rounded_profile(*nub_rect(p,side,0)),ax,facecolor="#8f9b96",edgecolor="#65736b",lw=.7,zorder=3)
        patch(ps[side],ax,facecolor=COLORS[side],edgecolor="#244951",lw=.6,zorder=4)
    patch(phone,ax,facecolor="none",edgecolor="#465d72",lw=1.25,linestyle=(0,(4,3)),zorder=5)
    patch(rounded_profile(*camera_rect(p,0)),ax,facecolor="#9c7ac1",alpha=.13,edgecolor="none",zorder=5)
    patch(rounded_profile(*camera_rect(p,0)),ax,facecolor="none",edgecolor="#806397",lw=1.2,linestyle=(0,(3,3)),zorder=6)
    cx=p["phone_center_x"]+p["charging_open_offset_x"]
    cy=p["phone_bottom_y"]+p["charging_open_offset_y"]
    ax.add_patch(Circle((cx,cy),p["charging_open_radius"],facecolor="none",edgecolor="#9aa9a4",ls=(0,(3,4)),lw=1,zorder=5))
    ax.text(cx,cy+2,"OPEN",ha="center",fontsize=13,fontweight="bold",color="#60786f",zorder=7)
    ax.text(cx,cy-5,"charging region",ha="center",fontsize=8,color="#60786f",zorder=7)
    ax.text(cx,129,"Camera recess",ha="center",va="center",fontsize=9,color="#745a8b",zorder=7)
    ax.plot([-15,106],[0,0],color="#465d72",lw=2,zorder=7)
    ax.text(42,-7,"Factory lower ledge / Y = 0",ha="center",fontsize=8.5,color=MUTED)
    ax.annotate("TOP / CAMERA END",xy=(43,180),ha="center",fontsize=8,fontweight="bold",color=MUTED)
    ax.set_xlim(-22,111);ax.set_ylim(-12,187)

    x=.625
    fig.text(x,.77,"TWO INDEPENDENT INSERTS",fontsize=11,fontweight="bold",color=INK)
    report=json.loads((OUT/"validation"/"geometry_report.json").read_text())
    rows=[]
    for side,desc in [("left","Wide lower wing"),("right","Long ridge collar")]:
        r=next(a for a in report["parts"] if a["file"].endswith(f"{side}_insert_PROTOTYPE.stl"))
        size=" × ".join(f"{v:.1f}" for v in r["size_mm"])+" mm"
        rows.append((side.upper(),COLORS[side],size,f"{desc} · {r['hexagonal_openings']} hex openings"))
    for i,(name,color,size,desc) in enumerate(rows):
        y=.71-i*.13
        fig.text(x,y,name,fontsize=11,fontweight="bold",color=color)
        fig.text(x,y-.035,size,fontsize=16,color=INK)
        fig.text(x,y-.064,desc,fontsize=10,color=MUTED)
    fig.text(x,.435,"HOW IT LOCATES THE PHONE",fontsize=11,fontweight="bold",color=INK)
    fig.text(x,.408,"Through-slots surround the existing nubs.\nThe upper relief surrounds the camera housing.\nThe lower ledge remains the phone’s bottom stop.",
             fontsize=10.5,color=MUTED,linespacing=1.65,va="top")
    fig.text(x,.285,"PRINT THE FIT GAUGES FIRST",fontsize=11,fontweight="bold",color=INK)
    fig.text(x,.258,"2L / 2R / 2C identify the new V2 fit gauges.\n03 / 05 / 08 = 0.3 / 0.5 / 0.8 mm per side.\nCamera length and nub lengths still need fit checks.",
             fontsize=10.5,color=MUTED,linespacing=1.65,va="top")
    fig.text(x,.135,"A1 · 0.4 mm · PLA · 0.20 mm layers",fontsize=11,color=INK)
    fig.text(x,.105,"Flat on the bed. No supports. No added charger.",fontsize=10,color=MUTED)
    fig.text(.06,.025,"PROTOTYPE V2  |  18 mm nub bases / 75 mm clear gap  |  Camera length is scan-estimated. Fit and charging unverified.",fontsize=9,color=MUTED)
    fig.savefig(OUT/"previews"/"assembly_top.png",dpi=180,facecolor=BG)
    fig.savefig(OUT/"previews"/"assembly_top.svg",facecolor=BG)
    plt.close(fig)


def perspective(p):
    fig=plt.figure(figsize=(13,10),facecolor=BG)
    ax=fig.add_axes([0,.04,1,.86],projection="3d",computed_zorder=False)
    ax.set_facecolor(BG)
    light=np.array([-.4,-.6,.7]);light/=np.linalg.norm(light)
    for side in ("left","right"):
        m=trimesh.load_mesh(OUT/f"{side}_insert_PROTOTYPE.stl")
        base=np.array(to_rgb(COLORS[side]))
        shade=.62+.38*np.maximum(0,m.face_normals@light)
        fc=np.column_stack([base[None,:]*shade[:,None],np.ones(len(m.faces))])
        ax.add_collection3d(Poly3DCollection(m.triangles,facecolors=fc,edgecolors="none",antialiased=False,zorder=4))
    ax.set_xlim(-18,111);ax.set_ylim(0,179);ax.set_zlim(-4,22)
    ax.set_box_aspect((121,179,26));ax.view_init(elev=57,azim=-69)
    ax.set_axis_off();ax.set_proj_type("ortho")
    fig.text(.06,.94,"PRINTED PARTS / ASSEMBLED POSITION",fontsize=11,fontweight="bold",color=COLORS["left"])
    fig.text(.06,.897,"Open honeycomb. Solid contact borders.",fontsize=22,fontweight="bold",color=INK)
    fig.text(.06,.05,f"Actual exported STL geometry  ·  {p['thickness']:.1f} mm thick  ·  0.4 mm nominal lens-to-pad clearance",fontsize=11,color=MUTED)
    fig.text(.06,.022,"Colors distinguish the two parts; both can be printed in one filament. Prototype fit requires checking in the car.",fontsize=9,color=MUTED)
    fig.savefig(OUT/"previews"/"assembly_3d.png",dpi=180,facecolor=BG)
    plt.close(fig)


def gauges():
    fig,axs=plt.subplots(3,3,figsize=(12,8),facecolor=BG)
    for row,kind in enumerate(["left_nub_U_gauge","right_nub_U_gauge","camera_ring_gauge"]):
        for col,c in enumerate(["03","05","08"]):
            ax=axs[row,col];ax.set_facecolor(BG);ax.set_aspect("equal");ax.set_axis_off()
            m=trimesh.load_mesh(OUT/"fit_tests"/f"{kind}_{c}.stl")
            poly=unary_union([Polygon(t[:,:2]) for t in m.triangles[m.face_normals[:,2]>.01]])
            color=[COLORS["left"],COLORS["right"],"#9273a9"][row]
            patch(poly,ax,facecolor=color,edgecolor=INK,lw=.5)
            # Draw embossed text as outlines at the correct actual mesh location.
            labeltris=m.triangles[(m.face_normals[:,2]>.99)&(m.triangles_center[:,2]>2.7)]
            if len(labeltris):
                lp=unary_union([Polygon(t[:,:2]) for t in labeltris])
                for g in ([lp] if lp.geom_type=="Polygon" else lp.geoms):
                    patch(g,ax,facecolor="#fafbf7",edgecolor="none")
            xmin,ymin,xmax,ymax=poly.bounds
            ax.set_xlim(xmin-3,xmax+3);ax.set_ylim(ymin-3,ymax+3)
            title=["L / short nub","R / long ridge","C / camera outline"][row]
            ax.set_title(f"{title}   ·   {int(c)/10:.1f} mm",fontsize=11,color=INK,pad=10)
    fig.suptitle("Fit gauges / clearance per side",fontsize=23,fontweight="bold",color=INK,y=.98)
    fig.text(.06,.025,"U gauges check width and one rounded end only. Camera rings check the estimated outline, not lens projection or charging.",fontsize=9,color=MUTED)
    fig.tight_layout(rect=[.025,.055,.98,.94],h_pad=2)
    fig.savefig(OUT/"previews"/"fit_gauges.png",dpi=160,facecolor=BG)
    plt.close(fig)


def revision_comparison(p):
    scanfile=OUT/'scan/aligned_scan.npz'
    if not scanfile.exists():return
    a=np.load(scanfile);v=a['vertices'];f=a['faces'];rgb=a['rgb']
    fig,axs=plt.subplots(1,2,figsize=(14,7),facecolor=BG,gridspec_kw={'width_ratios':[1,1.2]})
    for ax in axs:ax.set_facecolor(BG)
    from matplotlib.collections import PolyCollection
    order=np.argsort(v[f,2].mean(axis=1))
    axs[0].add_collection(PolyCollection(v[f][order,:,:2],facecolors=rgb[f][order].mean(axis=1)/255,edgecolors='none'))
    for length,col,ls,lab in [(35.,'#e48b44',(0,(5,3)),'V1 opening · 66.5 × 36 mm'),
                              (p['camera_length'],'#2ddda2','solid',f"V2 opening · 66.5 × {p['camera_length']+1:g} mm")]:
        pp=dict(p,phone_center_x=0,camera_length=length)
        patch(rounded_profile(*camera_rect(pp)),axs[0],facecolor='none',edgecolor=col,lw=2.3,linestyle=ls,label=lab)
    axs[0].set(xlim=(-40,40),ylim=(94,154),xlabel='Across phone (mm)',ylabel='From phone bottom (mm)')
    axs[0].set_aspect('equal');axs[0].legend(loc='lower left',fontsize=10,framealpha=.95)
    axs[0].set_title('Same width. Longer camera relief.',fontsize=15,color=INK,pad=15)
    ax=axs[1];t=p['thickness'];body=p['phone_depth'];bump=p['phone_body_plus_bump']-body;lens=p['phone_body_plus_lenses']-body
    ax.add_patch(Rectangle((0,t),72.1,body,facecolor='#cbd9e5',edgecolor='#415c74',lw=1.2))
    ax.add_patch(Rectangle((3.3,t-bump),65.5,bump,facecolor='#a48bbe',edgecolor='#715b8e',lw=1.2))
    ax.add_patch(Rectangle((21,t-lens),30,lens-bump,facecolor='#6b547e',edgecolor='#443354',lw=1.2))
    ax.add_patch(Rectangle((-5,0),7.8,t,facecolor=COLORS['left'],edgecolor='none'))
    ax.add_patch(Rectangle((69.3,0),7.8,t,facecolor=COLORS['right'],edgecolor='none'))
    ax.plot([-8,81],[0,0],color=INK,lw=2)
    ax.text(36,t+body/2,'Phone body · 8.8 mm',ha='center',va='center',fontsize=12,color=INK)
    ax.text(36,t-bump/2,'Housing · +2.9 mm',ha='center',va='center',fontsize=11,color=INK)
    ax.text(36,t-lens+(lens-bump)/2,'Lenses · +2.1 mm',ha='center',va='center',fontsize=9,color='white')
    ax.annotate('',xy=(-7,0),xytext=(-7,t),arrowprops={'arrowstyle':'<->','color':INK})
    ax.text(-9,t/2,'5.4 mm\nsupport',ha='right',va='center',fontsize=10,color=INK)
    ax.annotate('0.4 mm lens-to-pad gap',xy=(36,(t-lens)/2),xytext=(36,-2.3),ha='center',fontsize=11,color=INK,
                arrowprops={'arrowstyle':'->','color':INK,'connectionstyle':'angle,angleA=90,angleB=0,rad=0'})
    ax.text(36,-4,'Flat console surface · section schematic',ha='center',fontsize=10,color=MUTED)
    ax.set(xlim=(-24,86),ylim=(-5,17));ax.set_axis_off()
    ax.set_title('Measured thickness stack',fontsize=15,color=INK,pad=15)
    fig.suptitle('PROTOTYPE V2 / scan and caliper corrections',fontsize=21,fontweight='bold',color=INK,y=.97)
    fig.text(.055,.065,'Scan scaled to 72.1 mm phone width. V2 includes 2 mm extra lower blending relief beyond the ~44 mm raised region.',fontsize=10,color=MUTED)
    fig.text(.055,.03,'Camera length remains a scan estimate. Full parts lift the phone 5.4 mm: verify fit first, then charging.',fontsize=10,color=MUTED)
    fig.tight_layout(rect=[.025,.11,.98,.9],w_pad=3)
    fig.savefig(OUT/'scan/revision_comparison.png',dpi=170,facecolor=BG)
    plt.close(fig)


if __name__=="__main__":
    p=json.loads((ROOT/"parameters.json").read_text())
    top_view(p,profiles());perspective(p);gauges();revision_comparison(p)
    print("Rendered assembly_top.png, assembly_3d.png and fit_gauges.png")
