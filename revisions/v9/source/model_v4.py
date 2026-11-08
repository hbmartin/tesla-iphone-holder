"""V4 geometry: sloped support, seated phone, curved/asymmetric nub relief.

Dimensions are in the installed console coordinate frame, in millimeters.
The physical nub/console surfaces are provisional; generated cutters are
design intent, not measurements of the actual console.
"""
from pathlib import Path
import json
import math

import cadquery as cq
import numpy as np
from shapely.geometry import Polygon, Point, box, mapping
from shapely.ops import unary_union

from build_model import (
    ROOT, rounded_profile, rounded_solid, camera_rect, left_wall_x,
    hexagons, validate_and_export,
)


def derive(p):
    p = dict(p)
    for side in ("left", "right"):
        p[f"{side}_nub_y"] = p[f"{side}_nub_bottom_y"] + p[f"{side}_nub_length"]/2
        p[f"{side}_outer_y_max"] = (
            p[f"{side}_nub_bottom_y"] + p[f"{side}_nub_length"]
            + p["nub_clearance"] + p[f"{side}_nub_collar_border"])
    p["taper_upper_y"] = max(p[f"{s}_outer_y_max"] for s in ("left", "right"))
    p["outer_top_slope"] = (p["thickness"]-p["lower_edge_thickness"])/p["taper_upper_y"]
    p["phone_support_top_height"] = outer_height(p, p["phone_length"])
    p["phone_support_slope"] = p["phone_support_top_height"]/p["phone_length"]
    return p


def outer_height(p, y):
    return p["lower_edge_thickness"] + p["outer_top_slope"]*y


def phone_height(p, y):
    return p["phone_support_slope"]*(y-p["phone_bottom_y"])


def plane_volume(intercept, slope, above=False):
    """Large prism bounded by z=intercept+slope*y; finite outside work area."""
    y0, y1 = -50., 210.
    z0, z1 = intercept+slope*y0, intercept+slope*y1
    points = [(y0,z0),(y1,z1),(y1,30),(y0,30)] if above else [
        (y0,-3),(y1,-3),(y1,z1),(y0,z0)]
    return cq.Workplane("YZ", origin=(-60,0,0)).polyline(points).close().extrude(200)


def phone_rect(p, clearance=0):
    return (p["phone_center_x"], p["phone_bottom_y"]+p["phone_length"]/2,
            p["phone_width"]+2*clearance, p["phone_length"]+2*clearance,
            p["phone_corner_radius"]+clearance)


def seating_volumes(p):
    footprint = rounded_solid(*phone_rect(p, p["phone_seating_clearance"]), 12, z=-1)
    low = cq.Workplane("XY").box(200,p["phone_seating_relief_length"]+1,12,
                                 centered=False).translate((-50,-1,-1))
    return footprint.intersect(low), footprint.intersect(
        plane_volume(-p["phone_support_slope"]*p["phone_bottom_y"],
                     p["phone_support_slope"], above=True))


def nub_section(p, side, fraction):
    """XY capsule dimensions at normalized local height.

    Legacy finished rim includes 0.5 clearance + 0.2 lead-in per side.
    Reductions refer to that finished rim, not the bare nub end.
    """
    u = min(1.,max(0.,fraction))
    blend = u*u*(3-2*u)
    width_blend=lower_blend=upper_blend=blend
    if p.get('revision')=='prototype-v6':
        from model_v6 import nub_blends
        width_blend,lower_blend,upper_blend=nub_blends(p,u)
    rim = p["nub_clearance"]+p["nub_legacy_rim_leadin"]
    base_w = p.get("nub_lower_opening_width",p[f"{side}_nub_width"]+2*rim)
    bottom = p[f"{side}_nub_bottom_y"]-rim + lower_blend*p[f"{side}_nub_upper_bottom_reduction"]
    top = (p[f"{side}_nub_bottom_y"]+p[f"{side}_nub_length"]+rim
           - upper_blend*p[f"{side}_nub_upper_top_reduction"])
    w = base_w + width_blend*(p["nub_upper_opening_width"]-base_w)
    return p[f"{side}_nub_x"], (bottom+top)/2, w, top-bottom, w/2


def nub_wire(p, side, fraction):
    cx,cy,w,h,_ = nub_section(p,side,fraction)
    wire = cq.Workplane("XY").center(cx,cy).slot2D(h,w,angle=90).val()
    # Affine image of the analytic capsule. Preserve XY dimensions while
    # lifting it onto z=u*(lower_thickness + slope*y).
    matrix = cq.Matrix([[1,0,0,0],[0,1,0,0],
                        [0,fraction*p["outer_top_slope"],1,
                         fraction*p["lower_edge_thickness"]],[0,0,0,1]])
    return wire.transformGeometry(matrix)


def nub_cutter(p, side):
    # Extensions keep the boolean away from coplanar end caps. Intermediate
    # sections round the inward contour at both its upper and lower edges.
    # Fine ruled bands preserve section dimensions and monotonic nesting.
    # OCC's global smooth loft can oscillate between these very different
    # tilted capsules. 32 bands approximate smoothstep to <0.011 mm in width,
    # below STL tolerance and far below the 0.20 mm print layer height.
    sections = [-.25, *np.linspace(0,1,p.get("nub_profile_sections",32)+1), 1.25]
    return cq.Workplane("XY").add(cq.Solid.makeLoft(
        [nub_wire(p,side,u) for u in sections], ruled=True))


def outer_body(p, side):
    if p.get('revision')=='prototype-v6':
        from model_v6 import outer_body as contour_body
        return contour_body(p,side)
    if side == "right":
        xmin,xmax = p["right_outer_x_min"],p["right_outer_x_max"]
        ymax = p["right_outer_y_max"]
        dims = ((xmin+xmax)/2,ymax/2,xmax-xmin,ymax,p["lower_outline_radius"])
        solid = rounded_solid(*dims,p["thickness"]+1)
        profile = rounded_profile(*dims)
    else:
        ymax = p["left_outer_y_max"]
        collar_right = p["left_nub_x"]+p["left_nub_width"]/2+p["nub_clearance"]+p["left_nub_collar_border"]
        shoulder = min(p["left_wing_y_max"],ymax-12)
        inset = p.get("left_outer_edge_inset",0.)
        pts = [(left_wall_x(p,0)+p["left_wall_clearance"]+inset,0),
               (p["left_wing_x_max"],0),(p["left_wing_x_max"],shoulder-8),
               (collar_right,shoulder),(collar_right,ymax),
               (left_wall_x(p,ymax)+p["left_wall_clearance"]+inset,ymax)]
        wire = cq.Workplane("XY").polyline(pts).close().val()
        # Independent lower corners retain the existing phone-side shape.
        wire = wire.fillet2D(p.get("left_lower_outer_corner_radius",p["lower_outline_radius"]),
                             [v for v in wire.Vertices() if abs(v.X-pts[0][0])<1e-6 and abs(v.Y)<1e-6])
        wire = wire.fillet2D(p["lower_outline_radius"],
                             [v for v in wire.Vertices() if abs(v.X-pts[1][0])<1e-6 and abs(v.Y)<1e-6])
        upper = [v for v in wire.Vertices()
                 if any(abs(v.X-x)<1e-6 and abs(v.Y-y)<1e-6 for x,y in pts[2:])]
        wire = wire.fillet2D(p["left_outline_radius"],upper)
        sampled,_ = wire.sample(.005)
        profile = Polygon([(v.x,v.y) for v in sampled])
        solid = cq.Workplane("XY").add(wire).toPending().extrude(p["thickness"]+1)
    # Round only external pad-facing edges, before functional openings exist.
    edge_radius = p.get("left_console_edge_radius",p["underside_edge_radius"]) if side=="left" else p["underside_edge_radius"]
    solid = solid.faces("<Z").edges().fillet(edge_radius)
    solid = solid.intersect(plane_volume(p["lower_edge_thickness"],p["outer_top_slope"]))
    return solid,profile


def build_insert(p, side):
    solid,outer = outer_body(p,side)
    camera = camera_rect(p)
    cp = rounded_profile(*camera)
    center = (p["phone_center_x"]+p["charging_open_offset_x"],
              p["phone_bottom_y"]+p["charging_open_offset_y"])
    charge = Point(*center).buffer(p["charging_open_radius"],quad_segs=192)
    seat_xy = rounded_profile(*phone_rect(p,p["phone_seating_clearance"])).intersection(
        box(-50,-1,150,p["phone_seating_relief_length"]))
    safe = (outer.difference(rounded_profile(*nub_section(p,side,0)))
            .difference(cp).difference(charge).difference(seat_xy))
    # Reserve the underside radius as well as the required finished border.
    edge_radius = p.get("left_console_edge_radius",p["underside_edge_radius"]) if side=="left" else p["underside_edge_radius"]
    hp = dict(p,edge_chamfer=0,solid_border=p["solid_border"]+edge_radius)
    if p.get('revision')=='prototype-v6':
        reserve=p['photo_contours']['left_wall_maximum_extra_underside_setback_mm'] if side=='left' else p['photo_contours']['front_maximum_underside_setback_mm']
        hp['solid_border']=p['solid_border']+max(edge_radius,reserve)
    holes = [h for h in hexagons(safe,hp) if h.bounds[1]>=p["phone_seating_relief_length"]]
    solid = solid.cut(rounded_solid(*camera,10,z=-1))
    solid = solid.cut(cq.Workplane("XY").workplane(offset=-1).center(*center)
                      .circle(p["charging_open_radius"]).extrude(10))
    for volume in seating_volumes(p):
        solid = solid.cut(volume)
    if holes:
        cuts = [cq.Workplane("XY").workplane(offset=-1)
                .polyline(list(h.exterior.coords)[:-1]).close().extrude(10).val() for h in holes]
        solid = solid.cut(cq.Compound.makeCompound(cuts))
    cutter = nub_cutter(p,side)
    solid = solid.cut(cutter).clean()
    top = outer.difference(cp).difference(charge).difference(seat_xy).difference(
        rounded_profile(*nub_section(p,side,1))).difference(unary_union(holes))
    base = safe.difference(unary_union(holes))
    return solid,dict(side=side,holes=holes,profile=safe,final_profile=top,base_profile=base)


def diagnostics(p):
    projection = p["phone_body_plus_lenses"]-p["phone_depth"]
    theta = math.atan(p["phone_support_slope"])
    # Lens XY locations are unmeasured. Report a range for a 5 mm projection
    # anywhere within the housing, not a fabricated exact minimum gap.
    ys = [p["camera_bottom_y"],p["camera_bottom_y"]+p["camera_length"]]
    gaps = [y*math.sin(theta)-projection*math.cos(theta) for y in ys]
    return {
        "phone_back_tilt_degrees":math.degrees(theta),
        "housing_projection_mm":p["phone_body_plus_bump"]-p["phone_depth"],
        "lens_projection_mm":projection,
        "lens_to_flat_pad_gap_range_mm":gaps,
        "lens_clearance_status":"PREDICTED_INTERFERENCE",
        "diagnostic_is_blocking":not p["allow_unverified_physical_fit"],
        "assumptions":"Rigid phone, ideal flat pad, no fabric compression; exact lens positions unmeasured.",
        "scan_status":"Historical scan is not a gate: its earlier 72.1 mm width calibration is superseded.",
        "physical_fit_status":"UNTESTED: provisional console and nub profiles; no clearance certification."
    }


def build_v4(parameters, out):
    p = derive(parameters)
    label=p["revision"].replace("prototype-","").upper()
    assert 0<p["lower_edge_thickness"]<=p["thickness"]<=p["maximum_allowed_thickness"]
    assert p["nub_upper_opening_width"]>0 and p["camera_clearance"]>=0
    assert p["phone_seating_relief_length"]<p["camera_bottom_y"]
    gap = (p["right_nub_x"]-p["right_nub_width"]/2)-(p["left_nub_x"]+p["left_nub_width"]/2)
    assert abs(gap-p["nub_base_gap"])<1e-8
    if not p["allow_unverified_physical_fit"]:
        raise ValueError("V4 requires explicit permission for provisional physical fit.")
    out = Path(out)
    for folder in [out,out/"previews",out/"validation",out/"slicer"]:
        folder.mkdir(parents=True,exist_ok=True)
    parts,infos,reports = {},{},[]
    assembly = cq.Assembly(name=f"Tesla_iPhone_holder_{label}_PROTOTYPE")
    for side,color in [("left",(.08,.61,.59)),("right",(.94,.48,.22))]:
        print(f"Building {label} {side} insert",flush=True)
        solid,info = build_insert(p,side)
        export_p = dict(p,edge_chamfer=0)
        result = validate_and_export(solid,out/f"{side}_insert_PROTOTYPE.stl","insert",info,export_p)
        assert result["bounds_mm"][1][2]<=p["maximum_allowed_thickness"]+1e-5
        cq.exporters.export(solid,str(out/f"{side}_insert_PROTOTYPE.step"))
        assembly.add(solid,name=f"{side}_insert",color=cq.Color(*color))
        parts[side],infos[side] = solid,info
        reports.append(result)
    overlap = parts["left"].intersect(parts["right"]).val().Volume()
    assert overlap<1e-6
    seat_checks = {}
    for side,part in parts.items():
        volumes = [part.intersect(v).val().Volume() for v in seating_volumes(p)]
        assert max(volumes)<1e-6,(side,volumes)
        seat_checks[side] = dict(lower_phone_keepout_interference_mm3=volumes[0],
                                above_phone_back_plane_interference_mm3=volumes[1])
    assembly.export(str(out/"holder_assembled_PROTOTYPE.step"))
    cq.exporters.export(cq.Compound.makeCompound([s.val() for s in parts.values()]),
                        str(out/"holder_assembled_geometry.3mf"),tolerance=.025,angularTolerance=.08)
    report = dict(revision=p["revision"],units="mm",parameters=p,parts=reports,
                  assembly_checks=dict(overlap_volume_mm3=overlap,phone_seating=seat_checks),
                  physical_diagnostics=diagnostics(p),
                  opening_design={side:{
                      "underside":list(nub_section(p,side,0)),
                      "upper":list(nub_section(p,side,1))} for side in parts})
    (out/"validation/geometry_report.json").write_text(json.dumps(report,indent=2)+"\n")
    (out/"parameters.json").write_text(json.dumps(p,indent=2)+"\n")
    for name,key in [("planar_profiles","final_profile"),("base_profiles","base_profile")]:
        (out/"validation"/f"{name}.json").write_text(json.dumps(
            {side:mapping(info[key]) for side,info in infos.items()})+"\n")
    print(f"{label} meshes exported. Physical lens interference remains an explicit diagnostic.",flush=True)
    return parts,infos,report
