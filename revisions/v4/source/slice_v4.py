"""Inspect positive-extrusion paths in the actual exported Bambu sliced plate."""
import math
import re
import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection
from matplotlib.lines import Line2D


def paths(code):
    x=y=e=0.; relative=True; absolute_xy=True; layer=0.; feature="Custom"
    result=[]
    number=r"[-+]?(?:\d+(?:\.\d*)?|\.\d+)"
    for raw in code.splitlines():
        if raw.startswith("; Z_HEIGHT:"):layer=float(raw.split(":")[1])
        if raw.startswith("; FEATURE:"):feature=raw.split(":")[1].strip()
        line=raw.split(";")[0].strip()
        if line=="G90":absolute_xy=True
        if line=="G91":absolute_xy=False
        if line.startswith("M83"):relative=True
        if line.startswith("M82"):relative=False
        if line.startswith("G92 E"):e=float(line.split("E")[1].split()[0])
        if not re.match(r"^G[0123]\s",line):continue
        v={k:float(n) for k,n in re.findall(r"([XYEIJ])("+number+")",line)}
        nx=v.get("X",x) if absolute_xy else x+v.get("X",0)
        ny=v.get("Y",y) if absolute_xy else y+v.get("Y",0)
        de=v.get("E",0) if relative else v.get("E",e)-e
        if "E" in v:e=v["E"]
        if layer and feature!="Custom" and de>0 and (x!=nx or y!=ny):
            points=np.array([[x,y],[nx,ny]])
            if line.startswith(("G2 ","G3 ")) and ("I" in v or "J" in v):
                center=np.array([x+v.get("I",0),y+v.get("J",0)])
                start=np.arctan2(y-center[1],x-center[0])
                end=np.arctan2(ny-center[1],nx-center[0])
                sweep=(end-start)%(2*np.pi)
                if line.startswith("G2 "):sweep-=2*np.pi
                radius=np.linalg.norm(points[0]-center)
                angles=np.linspace(start,start+sweep,max(2,math.ceil(abs(sweep)*radius/.3)))
                points=center+radius*np.c_[np.cos(angles),np.sin(angles)]
                points[0]=[x,y];points[-1]=[nx,ny]
            result.append((round(layer,3),feature,points))
        x,y=nx,ny
    return result


def inspect(code,out):
    data=paths(code)
    # Both lower rails must survive as real model extrusion through five
    # layers (1.0 mm). Y=25 is their placement datum; avoid the rounded corners.
    rail_counts={}
    for z in [.2,.4,.6,.8,1.]:
        counts=[]
        for xmin,xmax in [(25,73),(82,118)]:
            count=sum(len(p) for layer,feature,p in data if layer==z
                      and not feature.startswith("Support")
                      and np.any((p[:,0]>xmin)&(p[:,0]<xmax)&(p[:,1]<27)))
            assert count>0,(z,xmin,"Missing lower structural edge")
            counts.append(count)
        rail_counts[str(z)]=counts
    support_layers=sorted({z for z,f,p in data if f.startswith("Support")})
    assert support_layers[0]==.2 and len(support_layers)>5
    fig,axs=plt.subplots(1,4,figsize=(13,7),facecolor="#f5f6f3")
    for ax,z in zip(axs,[.2,1.,2.6,4.4]):
        for support,color in [(False,"#158b8b"),(True,"#b250b8")]:
            lines=[p for layer,f,p in data if layer==z and f.startswith("Support")==support]
            ax.add_collection(LineCollection(lines,colors=color,linewidths=.45))
        ax.set(xlim=(19,122),ylim=(18,191),title=f"Layer {round(z/.2)} · Z = {z:.1f} mm")
        ax.set_aspect("equal");ax.set_facecolor("#f5f6f3")
        ax.set_xlabel("Plate X (mm)")
        ax.spines[["top","right"]].set_visible(False)
    axs[0].set_ylabel("Plate Y (mm)")
    fig.suptitle("V4 / Actual sliced extrusion paths",fontsize=19,color="#18343e",y=.96)
    fig.legend([Line2D([0],[0],color="#158b8b"),Line2D([0],[0],color="#b250b8")],
               ["Model","Supports and interfaces"],loc="lower center",ncol=2,frameon=False,bbox_to_anchor=(.5,.04))
    fig.text(.05,.02,"Console side down · lower rails present through five layers · remove supports through the wider underside mouths",
             fontsize=9,color="#536871")
    fig.tight_layout(rect=(.015,.11,.985,.91))
    fig.savefig(out/"previews/sliced_layers.png",dpi=180,facecolor=fig.get_facecolor())
    plt.close(fig)
    return dict(lower_edges_have_model_extrusion_through_1mm=True,
                lower_edge_path_points_by_layer_left_right=rail_counts,
                support_layers_mm=support_layers,
                preview="previews/sliced_layers.png",
                method="Positive-extrusion G0/G1/G2/G3 moves from GUI-exported G-code; arcs sampled at <=0.3 mm.")
