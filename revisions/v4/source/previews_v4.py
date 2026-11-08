"""Dimensioned V4 figures, rendered from exported STL geometry."""
import json
import math
from pathlib import Path
import numpy as np
import trimesh
from shapely.geometry import Polygon
from shapely.ops import unary_union
from shapely.geometry.polygon import orient
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.patches import PathPatch, Rectangle
from matplotlib.path import Path as MPath
from matplotlib.colors import to_rgb
from mpl_toolkits.mplot3d.art3d import Poly3DCollection
from build_model import rounded_profile, camera_rect
from model_v4 import nub_section, phone_rect, outer_height, phone_height

BG="#f5f6f3"; INK="#18343e"; MUTED="#536871"; RED="#ad3c30"
COLORS={"left":"#158b8b","right":"#df8547"}


def patch(poly,ax,**kw):
    if poly.is_empty:return
    if poly.geom_type=="MultiPolygon":
        for g in poly.geoms:patch(g,ax,**kw)
        return
    poly=orient(poly,sign=1)
    v=[];c=[]
    for ring in [poly.exterior,*poly.interiors]:
        pts=list(ring.coords);v+=pts
        c += [MPath.MOVETO]+[MPath.LINETO]*(len(pts)-2)+[MPath.CLOSEPOLY]
    ax.add_patch(PathPatch(MPath(v,c),**kw))


def dim(ax,a,b,text,offset=(0,0),color=INK,rotation=0):
    ax.annotate("",xy=a,xytext=b,arrowprops=dict(arrowstyle="<->",color=color,lw=1))
    middle=(np.array(a)+np.array(b))/2+offset
    ax.text(*middle,text,ha="center",va="center",fontsize=9,color=color,rotation=rotation,
            bbox=dict(facecolor=BG,edgecolor="none",pad=1.5))


def header(fig,kicker,title,sub):
    fig.text(.055,.955,kicker,fontsize=11,color=COLORS["left"],weight="bold")
    fig.text(.055,.907,title,fontsize=23,color=INK,weight="bold")
    fig.text(.055,.871,sub,fontsize=10.5,color=MUTED)


def stl_projection(mesh):
    ts=mesh.triangles[mesh.face_normals[:,2]>.00001]
    return unary_union([Polygon(t[:,:2]) for t in ts]).buffer(1e-5).buffer(-1e-5)


def top_view(out,p,meshes,report):
    fig=plt.figure(figsize=(14,10),facecolor=BG)
    header(fig,"V4 / FIT PROTOTYPE","Two inserts. Lower profile. Space at the crease.",
           "Actual exported STL outlines · provisional console and nub contours")
    ax=fig.add_axes([.045,.07,.53,.76]);ax.set_aspect("equal");ax.set_axis_off()
    for side,m in meshes.items():
        patch(stl_projection(m),ax,facecolor=COLORS[side],edgecolor=INK,lw=.45,zorder=3)
        patch(rounded_profile(*nub_section(p,side,0)),ax,facecolor="none",edgecolor=MUTED,lw=.8,ls="--",zorder=4)
    patch(rounded_profile(*phone_rect(p)),ax,facecolor="none",edgecolor="#344d78",ls="--",lw=1,zorder=5)
    patch(rounded_profile(*camera_rect(p,0)),ax,facecolor="#aa8fc4",alpha=.3,edgecolor="#75618b",zorder=4)
    ax.text(46.5,128,"Camera\n64.5 × 41.5",ha="center",va="center",fontsize=10,color=INK,zorder=6)
    ax.text(46.5,75,"Central\nopening",ha="center",va="center",fontsize=11,color=MUTED)
    ax.text(46.5,20,"Phone footprint\nclear below Y = 36",ha="center",va="center",fontsize=9,color=MUTED)
    ax.plot([-22,110],[0,0],color=INK,lw=1.5)
    ax.text(46.5,-6,"Factory lower crease · Y = 0",ha="center",fontsize=9,color=INK)
    dim(ax,(-31,0),(-31,150),"150 mm",offset=(-3,0),rotation=90)
    dim(ax,(10.95,170),(82.05,170),"71.1 mm",offset=(0,3))
    dim(ax,(118,0),(118,105),"105 mm to housing",offset=(4,0),rotation=90)
    ax.plot([80,118],[105,105],lw=.7,color=MUTED,ls=":")
    for side,y in [("left",120),("right",85)]:
        x=p[side+"_nub_x"]
        dim(ax,(x-2.8,y),(x+2.8,y),"5.6",offset=(0,7))
    ax.set(xlim=(-42,132),ylim=(-12,181))
    x=.625
    sections=[
        (.78,"CONFIRMED DIMENSIONS",
         "Phone: 71.1 × 150 mm\nHousing: centered, Y = 105–146.5 mm\nCamera opening: 65.1 × 42.1 mm\nUpper nub mouths: 5.6 mm, finished"),
        (.58,"CHANGES AT THE CONSOLE",
         "Right upper opening: +6 mm lower / −5 mm upper\nBoth lower edges reach the console crease\nOuter thickness: 1.0 → 4.4 mm; hard limit 4.5\nLower phone footprint is relieved for seating"),
        (.38,"PROVISIONAL CURVES",
         "9 mm lower outline corner radii\n0.5 mm underside edge rounds\nMeasured left-wall gaps retained\nContour-gauge measurements A–C pending"),
        (.18,"PRINT / PHYSICAL TEST",
         "A1 · PLA · 0.4 nozzle · 0.20 mm layers\nConsole side down; remove generated supports\nLens clearance is NOT verified"),
    ]
    for y,title,body in sections:
        fig.text(x,y,title,fontsize=10.5,color=INK,weight="bold")
        fig.text(x,y-.025,body,fontsize=10,color=MUTED,va="top",linespacing=1.65)
    fig.text(.055,.025,"FIT TEST ONLY · Dashed outlines show the phone and underside nub openings. No physical fit or charging certification.",
             fontsize=9,color=MUTED)
    for ext in ["png","svg"]:fig.savefig(out/"previews"/f"assembly_top.{ext}",dpi=170,facecolor=BG)
    plt.close(fig)


def perspective(out,p,meshes):
    fig=plt.figure(figsize=(13,9),facecolor=BG)
    header(fig,"V4 / ACTUAL MESHES","Tapered body and curved nub openings",
           "Assembled position · phone removed · lens clearance remains unverified")
    ax=fig.add_axes([0,.05,1,.8],projection="3d",computed_zorder=False)
    ax.set_facecolor(BG)
    light=np.array([-.45,-.3,.85]);light/=np.linalg.norm(light)
    view=np.array([np.cos(np.deg2rad(48))*np.cos(np.deg2rad(-68)),
                   np.cos(np.deg2rad(48))*np.sin(np.deg2rad(-68)),np.sin(np.deg2rad(48))])
    for side,m in meshes.items():
        shade=.5+.5*np.maximum(0,m.face_normals@light)
        fc=np.c_[np.array(to_rgb(COLORS[side]))[None,:]*shade[:,None],np.ones(len(m.faces))]
        mask=m.face_normals@view>0
        ax.add_collection3d(Poly3DCollection(m.triangles[mask],facecolors=fc[mask],
                                            edgecolors="none",antialiased=False,zorder=3))
    ax.set(xlim=(-29,115),ylim=(-5,169),zlim=(-2,12))
    ax.set_box_aspect((144,174,14));ax.view_init(48,-68);ax.set_axis_off();ax.set_proj_type("ortho")
    fig.text(.055,.035,"The lower recess leaves the phone's bottom free to seat against the console. Body height never exceeds 4.4 mm.",
             fontsize=10,color=MUTED)
    fig.savefig(out/"previews/assembly_3d.png",dpi=170,facecolor=BG);plt.close(fig)


def contours(mesh,normal,origin):
    section=mesh.section(plane_normal=normal,plane_origin=origin)
    return [] if section is None else [entity.discrete(section.vertices) for entity in section.entities]


def sections(out,p,meshes,report):
    fig,axs=plt.subplots(1,2,figsize=(13,4.6),facecolor=BG)
    fig.suptitle("V4 / Actual STL sections through the nub openings",fontsize=20,color=INK,y=.96)
    for ax,side in zip(axs,["left","right"]):
        ax.set_facecolor(BG)
        y=nub_section(p,side,1)[1];cx=p[side+"_nub_x"];z=outer_height(p,y)
        for line in contours(meshes[side],[0,1,0],[0,y,0]):
            ax.fill(line[:,0]-cx,line[:,2],facecolor=COLORS[side],edgecolor=INK,lw=.6)
        dim(ax,(-2.8,z+.6),(2.8,z+.6),"5.6 mm finished",offset=(0,1.0))
        dim(ax,(-9.7,-1.0),(9.7,-1.0),"19.4 mm underside",offset=(0,-.6))
        ax.axhline(0,color=MUTED,lw=.8)
        ax.set(xlim=(-26,24),ylim=(-2.5,7.5),xlabel="Across nub centerline (mm)",ylabel="Height above pad (mm)")
        ax.set_aspect("equal")
        ax.set_title(f"{side.upper()} · section at Y = {y:.2f} mm",fontsize=12,color=INK)
        ax.tick_params(colors=MUTED);ax.spines[["top","right"]].set_visible(False)
    fig.text(.06,.09,"Curved transitions are provisional. Upper widths include all clearance; underside mouths retain V3 dimensions.",
             fontsize=10,color=MUTED)
    fig.tight_layout(rect=(.015,.14,.985,.9))
    fig.savefig(out/"previews/nub_sections.png",dpi=180,facecolor=BG);plt.close(fig)

    fig=plt.figure(figsize=(13,7),facecolor=BG)
    header(fig,"V4 / SEATING AND THICKNESS","Space for the phone bottom at the crease",
           "Solid colored section: actual right insert at X = 103 mm. Phone and lens envelope: schematic.")
    ax=fig.add_axes([.07,.21,.87,.6]);ax.set_facecolor(BG)
    for line in contours(meshes["right"],[1,0,0],[103,0,0]):
        ax.fill(line[:,1],line[:,2],facecolor=COLORS["right"],alpha=.65,edgecolor=INK,lw=.6)
    ys=np.linspace(0,150,100);ph=phone_height(p,ys)
    ax.plot(ys,ph,color="#344d78",lw=2,label="Phone back / relieved bearing plane")
    ax.plot([0,0],[0,8.8],color="#344d78",lw=1.2)
    ax.plot(ys,ph+8.8,color="#344d78",lw=1.2)
    cy=np.linspace(105,146.5,30)
    gap=phone_height(p,cy)-5.
    ax.fill_between(cy,gap,0,color=RED,alpha=.22,label="Potential lens interference envelope")
    ax.plot(cy,gap,color=RED,lw=1.2,ls="--")
    ax.axhline(0,color=INK,lw=1)
    ax.annotate("Phone bottom seated at Z = 0",xy=(0,0),xytext=(10,7),
                fontsize=10,color=INK,arrowprops=dict(arrowstyle="->",color=INK))
    dim(ax,(0,-3),(36,-3),"First 36 mm clear",offset=(0,-.8))
    dim(ax,(166,0),(166,4.4),"4.4 max",offset=(9,0))
    ax.text(115,-3.7,"5 mm lens projection retained;\nactual lens positions unmeasured",
            color=RED,fontsize=9,ha="center")
    ax.set(xlim=(-5,180),ylim=(-5,15),xlabel="Distance from lower crease along pad (mm)",
           ylabel="Height normal to pad (mm)")
    ax.spines[["top","right"]].set_visible(False)
    ax.legend(loc="upper left",bbox_to_anchor=(.38,1),fontsize=9,frameon=False)
    fig.text(.055,.10,"1 mm lower structural edges lie outside the phone footprint. Phone support is about "
             f"{p['phone_support_top_height']:.2f} mm at Y = 150.",fontsize=10,color=MUTED)
    fig.text(.055,.055,"PHYSICAL CHECK REQUIRED: the rigid-phone / flat-pad model predicts lens contact. Do not force the phone down.",
             fontsize=10,color=RED)
    fig.savefig(out/"previews/taper_section.png",dpi=180,facecolor=BG);plt.close(fig)


def render(out):
    out=Path(out);report=json.loads((out/"validation/geometry_report.json").read_text());p=report["parameters"]
    meshes={s:trimesh.load_mesh(out/f"{s}_insert_PROTOTYPE.stl") for s in ("left","right")}
    top_view(out,p,meshes,report);perspective(out,p,meshes);sections(out,p,meshes,report)
    print("Rendered V4 assembly, dimensions, nub sections and seating section.",flush=True)
