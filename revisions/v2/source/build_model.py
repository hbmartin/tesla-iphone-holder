#!/usr/bin/env python3
"""Build the two-piece PROTOTYPE. Millimeters. Run with .venv/bin/python.

The original photos and reference STL are never modified. Edit parameters.json,
then rerun. Nub and camera geometry is deliberately simple and adjustable.
The independent Shapely profiles select safe honeycomb positions; the actual
CAD uses native circular arcs and CadQuery solids, not traced mesh surfaces.
"""
from __future__ import annotations

import argparse
import json
import math
from pathlib import Path

import cadquery as cq
import numpy as np
import shapely
from shapely.geometry import Point, Polygon, box
from shapely.ops import unary_union
import trimesh

ROOT = Path(__file__).resolve().parent


def rounded_profile(cx, cy, w, h, r):
    r = min(r, w / 2, h / 2)
    # Buffer four centers; this also supports exact capsule limiting cases.
    centers = [(cx + sx * (w / 2 - r), cy + sy * (h / 2 - r))
               for sx in (-1, 1) for sy in (-1, 1)]
    return unary_union([Point(x, y) for x, y in centers]).convex_hull.buffer(r, quad_segs=96)


def rounded_solid(cx, cy, w, h, r, height, z=0):
    """Analytic rounded-rectangle wire, including capsule/round limits."""
    if min(w, h, r, height) <= 0 or r > min(w, h) / 2 + 1e-8:
        raise ValueError(f"Invalid rounded rectangle: {(w,h,r,height)}")
    wp = cq.Workplane("XY").workplane(offset=z).center(cx, cy)
    if abs(w - 2*r) < 1e-8 and abs(h - 2*r) < 1e-8:
        return wp.circle(r).extrude(height)
    if abs(w - 2*r) < 1e-8:
        return wp.slot2D(h, w, angle=90).extrude(height)
    if abs(h - 2*r) < 1e-8:
        return wp.slot2D(w, h, angle=0).extrude(height)
    x0, x1, y0, y1 = -w/2, w/2, -h/2, h/2
    d = r/math.sqrt(2)
    return (wp.moveTo(x0+r,y0).lineTo(x1-r,y0)
            .threePointArc((x1-r+d,y0+r-d),(x1,y0+r))
            .lineTo(x1,y1-r)
            .threePointArc((x1-r+d,y1-r+d),(x1-r,y1))
            .lineTo(x0+r,y1)
            .threePointArc((x0+r-d,y1-r+d),(x0,y1-r))
            .lineTo(x0,y0+r)
            .threePointArc((x0+r-d,y0+r-d),(x0+r,y0)).close().extrude(height))


def chamfer_rims(solid, amount):
    # Top/bottom perimeter AND slot entrances. Vertical outline corners are arcs.
    return solid.faces(">Z or <Z").edges().chamfer(amount) if amount else solid


def camera_rect(p, clearance=None, centered=False):
    c = p["camera_clearance"] if clearance is None else clearance
    cx = 0 if centered else p["phone_center_x"] + p["camera_center_offset_x"]
    cy = 0 if centered else (p["phone_bottom_y"] + p["phone_length"]
                            - p["camera_top_offset"] - p["camera_length"]/2)
    return (cx, cy, p["camera_width"]+2*c, p["camera_length"]+2*c,
            p["camera_corner_radius"]+c)


def nub_rect(p, side, clearance=None):
    c = p["nub_clearance"] if clearance is None else clearance
    w = p[f"{side}_nub_width"] + 2*c
    return (p[f"{side}_nub_x"], p[f"{side}_nub_y"], w,
            p[f"{side}_nub_length"]+2*c, w/2)


def hexagons(profile, p):
    """Point-up hexagons. Web width is measured normal to adjacent faces."""
    a = p["hex_flat_to_flat"]
    pitch = a + p["hex_web"]
    radius = a/math.sqrt(3)
    # The extra chamfer reserve keeps the requested dimensions at the surfaces.
    border = p["solid_border"] + 2*p["edge_chamfer"]
    interior = profile.buffer(-border)
    x0,y0,x1,y1 = profile.bounds
    holes = []
    for row in range(math.floor(y0/(pitch*math.sqrt(3)/2))-1,
                     math.ceil(y1/(pitch*math.sqrt(3)/2))+2):
        y = row*pitch*math.sqrt(3)/2
        for col in range(math.floor(x0/pitch)-2, math.ceil(x1/pitch)+2):
            x = (col + (row % 2)/2)*pitch
            poly = Polygon([(x+radius*math.cos(math.radians(30+60*k)),
                             y+radius*math.sin(math.radians(30+60*k))) for k in range(6)])
            if interior.covers(poly):
                holes.append(poly)
    return holes


def build_insert(p, side):
    t = p["thickness"]
    if side == "left":
        xmin,xmax = p["left_outer_x_min"],p["left_wing_x_max"]
        ymin,ymax = p["left_wing_y_min"],p["left_wing_y_max"]
        body = ((xmin+xmax)/2,(ymin+ymax)/2,xmax-xmin,ymax-ymin,p["left_wing_corner_radius"])
        n = nub_rect(p,"left")
        b = p["left_nub_collar_border"]
        collar = (n[0],n[1],n[2]+2*b,n[3]+2*b,(n[2]+2*b)/2)
        solid = rounded_solid(*body,t).union(rounded_solid(*collar,t))
        outer = rounded_profile(*body).union(rounded_profile(*collar))
    else:
        xmin,xmax = p["right_outer_x_min"],p["right_outer_x_max"]
        ymin,ymax = p["right_outer_y_min"],p["right_outer_y_max"]
        body = ((xmin+xmax)/2,(ymin+ymax)/2,xmax-xmin,ymax-ymin,p["right_corner_radius"])
        solid = rounded_solid(*body,t)
        outer = rounded_profile(*body)

    cuts = [nub_rect(p,side), camera_rect(p)]
    profile = outer
    for shape in cuts:
        solid = solid.cut(rounded_solid(*shape,t+2,z=-1))
        profile = profile.difference(rounded_profile(*shape))
    cx = p["phone_center_x"]+p["charging_open_offset_x"]
    cy = p["phone_bottom_y"]+p["charging_open_offset_y"]
    r = p["charging_open_radius"]
    solid = solid.cut(cq.Workplane("XY").workplane(offset=-1).center(cx,cy).circle(r).extrude(t+2))
    profile = profile.difference(Point(cx,cy).buffer(r,quad_segs=192))
    if profile.geom_type != "Polygon":
        raise ValueError(f"{side} parameters disconnect the insert before honeycomb")

    holes = hexagons(profile,p)
    if holes:
        cutters=[]
        for hole in holes:
            cutters.append(cq.Workplane("XY").workplane(offset=-1)
                           .polyline(list(hole.exterior.coords)[:-1]).close().extrude(t+2).val())
        solid = solid.cut(cq.Compound.makeCompound(cutters))
    # Chamfer functional rims before adding honeycomb would enlarge hex openings;
    # chamfer all now, compensating lattice pitch below to retain 1.6 mm surface webs.
    solid = chamfer_rims(solid,p["edge_chamfer"])
    final_profile = profile.difference(unary_union(holes)) if holes else profile
    info = {"hex_count": len(holes), "profile": profile, "final_profile": final_profile,
            "holes": holes, "side": side}
    return solid,info


def label_tab(solid, label, x, y, width, height, t):
    tab = rounded_solid(x,y,width,height,1.5,t)
    solid = solid.union(tab)
    # Raised lettering is attached to the tab, with no detached islands.
    letters = (cq.Workplane("XY").workplane(offset=t-0.05).center(x,y)
               .text(label,4.2,0.65,font="Arial",kind="bold",halign="center",valign="center",combine=True))
    return solid.union(letters)


def build_nub_coupon(p,side,c):
    # Coupons isolate XY fit; they do not need the full phone-support height.
    p=dict(p,thickness=p.get("coupon_thickness",p["thickness"]))
    b = p["solid_border"]
    w = p[f"{side}_nub_width"]+2*c
    outer = rounded_solid(0,13,w+2*b,26,(w+2*b)/2,p["thickness"])
    # A U gauge fits over ONE nub end, testing width/end radius without using
    # an unverified full nub length. Its open end is intentionally not bridged.
    inner = rounded_solid(0,25+b,w,50,w/2,p["thickness"]+2,z=-1)
    solid = chamfer_rims(outer.cut(inner),p["edge_chamfer"])
    name = f"{p.get('coupon_prefix','')}{side[0].upper()}{int(round(c*10)):02d}"
    solid = label_tab(solid,name,w/2+b+4,12,14 if p.get('coupon_prefix') else 10,11,p["thickness"])
    return solid


def build_camera_coupon(p,c):
    p=dict(p,thickness=p.get("coupon_thickness",p["thickness"]))
    r = camera_rect(p,c,centered=True)
    b = p["solid_border"]
    outer = (r[0],r[1],r[2]+2*b,r[3]+2*b,r[4]+b)
    solid = rounded_solid(*outer,p["thickness"]).cut(rounded_solid(*r,p["thickness"]+2,z=-1))
    solid = chamfer_rims(solid,p["edge_chamfer"])
    return label_tab(solid,f"{p.get('coupon_prefix','')}C{int(round(c*10)):02d}",0,-outer[3]/2-2.0,18,7,p["thickness"])


def validate_and_export(solid,path,kind,info=None,p=None):
    shape = solid.val()
    if len(solid.solids().vals()) != 1 or not shape.isValid():
        raise ValueError(f"{path.name}: CAD is not one valid solid")
    cq.exporters.export(solid,str(path),tolerance=0.025,angularTolerance=0.08)
    mesh = trimesh.load_mesh(path,process=True)
    components = mesh.split(only_watertight=False)
    if not mesh.is_watertight or not mesh.is_winding_consistent or len(components)!=1 or mesh.volume<=0:
        raise ValueError(f"{path.name}: mesh validation failed")
    result={"file":str(path.relative_to(ROOT)),"kind":kind,"cad_valid":True,
            "cad_solids":1,"mesh_watertight":bool(mesh.is_watertight),
            "mesh_winding_consistent":bool(mesh.is_winding_consistent),
            "mesh_components":len(components),"triangles":len(mesh.faces),
            "bounds_mm":mesh.bounds.round(4).tolist(),"size_mm":mesh.extents.round(4).tolist(),
            "volume_mm3":round(float(mesh.volume),3),"cad_volume_mm3":round(shape.Volume(),3)}
    if info:
        holes=info["holes"]
        result["hexagonal_openings"]=len(holes)
        boundary=min((h.distance(info["profile"].boundary) for h in holes),default=None)
        spacing=min((a.distance(b) for i,a in enumerate(holes) for b in holes[i+1:]),default=None)
        result["min_hex_to_boundary_mm_before_chamfer"]=round(boundary,4) if boundary is not None else None
        result["min_hex_web_mm_before_chamfer"]=round(spacing,4) if spacing is not None else None
        if boundary is not None and boundary-2*p["edge_chamfer"] < p["solid_border"]-0.005:
            raise ValueError("Honeycomb infringes the solid border")
        if spacing is not None and spacing-2*p["edge_chamfer"] < p["hex_web"]-0.005:
            raise ValueError("Honeycomb web too thin after chamfer")
    return result


def build(p,out):
    for folder in [out,out/"fit_tests",out/"previews",out/"validation",out/"slicer"]:
        folder.mkdir(parents=True,exist_ok=True)
    # Increase center pitch by 2 chamfers: finished top/bottom webs remain 1.6 mm.
    geom_p=dict(p)
    geom_p["hex_web"]=p["hex_web"]+2*p["edge_chamfer"]
    parts,infos,reports={},{},[]
    assembly=cq.Assembly(name="Tesla_iPhone_holder_"+p["revision"].replace('-','_'))
    for side,color in [("left",(0.08,0.61,0.59)),("right",(0.94,0.48,0.22))]:
        print(f"Building {side} insert",flush=True)
        part,info=build_insert(geom_p,side)
        path=out/f"{side}_insert_PROTOTYPE.stl"
        reports.append(validate_and_export(part,path,"insert",info,p))
        cq.exporters.export(part,str(out/f"{side}_insert_PROTOTYPE.step"))
        assembly.add(part,name=f"{side}_insert",color=cq.Color(*color))
        parts[side]=part;infos[side]=info
    a,b=(infos[s]["final_profile"] for s in ["left","right"])
    assert a.intersection(b).area<1e-6,"Inserts overlap"
    assert a.is_valid and b.is_valid
    for side in ("left","right"):
        fp=infos[side]["final_profile"]
        assert fp.intersection(rounded_profile(*camera_rect(p,0))).area<1e-6
        assert fp.intersection(rounded_profile(*nub_rect(p,side,0))).area<1e-6
        for opposite in [s for s in ("left","right") if s!=side]:
            assert fp.intersection(rounded_profile(*nub_rect(p,opposite,0))).area<1e-6
    assembly.export(str(out/"holder_assembled_PROTOTYPE.step"))
    # Also provide a standards-based 3MF assembly; slicer project is built separately.
    cq.exporters.export(cq.Compound.makeCompound([parts[s].val() for s in parts]),
                        str(out/"holder_assembled_geometry.3mf"),tolerance=0.025,angularTolerance=0.08)
    for c in p["fit_clearances"]:
        code=f"{int(round(c*10)):02d}"
        for side in ("left","right"):
            path=out/"fit_tests"/f"{side}_nub_U_gauge_{code}.stl"
            reports.append(validate_and_export(build_nub_coupon(p,side,c),path,"nub_width_end_gauge"))
        path=out/"fit_tests"/f"camera_ring_gauge_{code}.stl"
        reports.append(validate_and_export(build_camera_coupon(p,c),path,"camera_envelope_gauge"))
    vertical={}
    if "phone_body_plus_lenses" in p:
        projection=p["phone_body_plus_lenses"]-p["phone_depth"]
        housing=p["phone_body_plus_bump"]-p["phone_depth"]
        clearance=p["thickness"]-projection
        if clearance+1e-8<p["lens_to_pad_clearance"]:
            raise ValueError("Body support is too low to clear the measured lens tips")
        if not 0<housing<projection:raise ValueError("Invalid measured height stack")
        gap=(p["right_nub_x"]-p["right_nub_width"]/2)-(p["left_nub_x"]+p["left_nub_width"]/2)
        if abs(gap-p["nub_base_gap"])>1e-8:raise ValueError("Nub positions do not match the measured base gap")
        vertical={"camera_housing_projection_mm":round(housing,4),"lens_tip_projection_mm":round(projection,4),
                  "lens_to_flat_pad_clearance_mm":round(clearance,4),"nub_base_clear_gap_mm":round(gap,4)}
    report={"revision":p["revision"],"units":"mm","parameters":p,"parts":reports,"measured_dimension_checks":vertical,
            "assembly_checks":{"inserts_do_not_overlap":True,"nominal_nubs_clear":True,
                               "nominal_camera_envelope_clear":True},
            "physical_validation":{"console_fit":"not tested","camera_fit":"not tested",
                                   "charging":"not tested","cabin_heat":"not tested"}}
    (out/"validation"/"geometry_report.json").write_text(json.dumps(report,indent=2)+"\n")
    (out/"validation"/"planar_profiles.json").write_text(json.dumps(
        {side:shapely.geometry.mapping(info["final_profile"]) for side,info in infos.items()})+"\n")
    return parts,infos,report


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--parameters",type=Path,default=ROOT/"parameters.json")
    ap.add_argument("--output",type=Path,default=ROOT/"output/v2")
    args=ap.parse_args()
    p=json.loads(args.parameters.read_text())
    for key in ["thickness","hex_flat_to_flat","hex_web","solid_border"]:
        if p[key]<=0: raise ValueError(f"{key} must be positive")
    if not 0 <= p["edge_chamfer"] < p["thickness"]/2:
        raise ValueError("Chamfer must be below half the plate thickness")
    _,_,report=build(p,args.output.resolve())
    print(json.dumps({"exported_meshes":len(report["parts"]),
                      "all_single_watertight_solids":True,
                      "output":str(args.output.resolve())}),flush=True)


if __name__=="__main__":
    main()
