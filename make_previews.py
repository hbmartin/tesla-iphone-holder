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
from matplotlib.patches import PathPatch,Circle
from matplotlib.colors import to_rgb
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
from build_model import rounded_profile,nub_rect,camera_rect

ROOT=Path(__file__).resolve().parent
OUT=ROOT/"output"
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
    fig.text(x,.258,"03 / 05 / 08 = 0.3 / 0.5 / 0.8 mm per-side clearance.\nL and R test nub width; C tests the camera outline.\nCamera and console dimensions are estimates.",
             fontsize=10.5,color=MUTED,linespacing=1.65,va="top")
    fig.text(x,.135,"A1 · 0.4 mm · PLA · 0.20 mm layers",fontsize=11,color=INK)
    fig.text(x,.105,"Flat on the bed. No supports. No added charger.",fontsize=10,color=MUTED)
    fig.text(.06,.025,"PROTOTYPE V1  |  mm  |  Dashed phone/camera outlines are reference envelopes. Physical fit and charging are unverified.",fontsize=9,color=MUTED)
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
    ax.set_xlim(-13,108);ax.set_ylim(0,179);ax.set_zlim(-4,22)
    ax.set_box_aspect((121,179,26));ax.view_init(elev=57,azim=-69)
    ax.set_axis_off();ax.set_proj_type("ortho")
    fig.text(.06,.94,"PRINTED PARTS / ASSEMBLED POSITION",fontsize=11,fontweight="bold",color=COLORS["left"])
    fig.text(.06,.897,"Open honeycomb. Solid contact borders.",fontsize=22,fontweight="bold",color=INK)
    fig.text(.06,.05,"Actual exported STL geometry  ·  2.4 mm thick  ·  0.2 mm rim chamfers",fontsize=11,color=MUTED)
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


if __name__=="__main__":
    p=json.loads((ROOT/"parameters.json").read_text())
    top_view(p,profiles());perspective(p);gauges()
    print("Rendered assembly_top.png, assembly_3d.png and fit_gauges.png")
