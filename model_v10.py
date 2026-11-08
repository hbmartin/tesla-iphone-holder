"""V10: one holder with a perforated upper bridge and refined left opening."""
import hashlib
import json
import math
from pathlib import Path
import cadquery as cq
from shapely.geometry import Polygon,box,mapping
from shapely.ops import unary_union
from build_model import ROOT,camera_rect,rounded_profile,rounded_solid,validate_and_export
from model_v4 import derive,plane_volume,seating_volumes,diagnostics
from model_v9 import build_insert,opening_center,opening_ends,nub_width,nub_cutter


def prepare_parameters(additional_left_shift=.5):
    p=json.loads((ROOT/'output/v9/parameters.json').read_text())
    p.update(revision='prototype-v10',left_opening_x_offset=p['left_opening_x_offset']-additional_left_shift,
             bridge_x_min=10.,bridge_x_max=83.,bridge_y_min=140.5,bridge_y_max=165.,
             bridge_hex_count=9,bridge_hex_row_y=155.9,bridge_hex_center_x=46.5,
             print_orientation='outward face down; main taper plane leveled against plate')
    p['_notes'].update(nub_openings=f'V10 shifts the left opening another {additional_left_shift:g} mm left relative to V9. Right opening and both width profiles/endpoints retained.',
        prototype='V10 unites both inserts through a hex-perforated bridge above the camera opening. Physical single-piece fit untested.',
        bridge='73 mm construction span, top at Y=165; lower contour follows camera clearance, leaving an 18.2 mm central band. Nine 6 mm hexagons; 1.6 mm webs.')
    p['v10_evidence']=dict(date='2026-11-05',additional_left_shift_mm=additional_left_shift,
        baseline='output/v9/parameters.json',baseline_sha256=hashlib.sha256((ROOT/'output/v9/parameters.json').read_bytes()).hexdigest(),
        photos={n:hashlib.sha256((ROOT/n).read_bytes()).hexdigest() for n in ['IMG_0204.jpeg','IMG_0203.jpeg']},
        basis='User requests further left opening shift and upper bridge in red-marked location; dimensions remain fit-test assumptions.')
    return derive(p)


def bridge_geometry(p):
    region=box(p['bridge_x_min'],p['bridge_y_min'],p['bridge_x_max'],p['bridge_y_max'])
    camera=rounded_profile(*camera_rect(p));profile=region.difference(camera)
    n=p['bridge_hex_count'];pitch=p['hex_flat_to_flat']+p['hex_web'];radius=p['hex_flat_to_flat']/math.sqrt(3)
    holes=[]
    for i in range(n):
        x=p['bridge_hex_center_x']+(i-(n-1)/2)*pitch;y=p['bridge_hex_row_y']
        h=Polygon([(x+radius*math.cos(math.radians(30+60*k)),y+radius*math.sin(math.radians(30+60*k))) for k in range(6)])
        assert profile.buffer(-p['solid_border']).covers(h)
        holes.append(h)
    bridge=cq.Workplane('XY').box(p['bridge_x_max']-p['bridge_x_min'],p['bridge_y_max']-p['bridge_y_min'],p['thickness'],centered=False).translate((p['bridge_x_min'],p['bridge_y_min'],0))
    bridge=bridge.intersect(plane_volume(p['lower_edge_thickness'],p['outer_top_slope']))
    bridge=bridge.cut(rounded_solid(*camera_rect(p),10,z=-1))
    for keepout in seating_volumes(p):bridge=bridge.cut(keepout)
    cuts=[cq.Workplane('XY').workplane(offset=-1).polyline(list(h.exterior.coords)[:-1]).close().extrude(10).val() for h in holes]
    bridge=bridge.cut(cq.Compound.makeCompound(cuts)).clean()
    assert bridge.val().isValid() and len(bridge.solids().vals())==1
    return bridge,profile,holes


def build(parameters=None,out=ROOT/'output/v10'):
    p=prepare_parameters() if parameters is None else derive(parameters);out=Path(out)
    for folder in [out,out/'validation',out/'previews',out/'slicer',out/'evidence']:folder.mkdir(parents=True,exist_ok=True)
    bridge,profile,holes=bridge_geometry(p)
    parts={};infos={}
    for side in ['left','right']:
        print('Building V10',side,'region',flush=True)
        parts[side],infos[side]=build_insert(p,side)
    intersections={s:sum(v.Volume(1e-7) for v in bridge.intersect(part).solids().vals()) for s,part in parts.items()}
    assert min(intersections.values())>100,intersections
    solid=parts['left'].union(bridge).union(parts['right']).clean()
    # Perforate the fused body too: the end holes overlap the original
    # inserts and must remain full through-holes across those joins.
    bridge_cuts=[cq.Workplane('XY').workplane(offset=-1).polyline(list(h.exterior.coords)[:-1]).close().extrude(10).val() for h in holes]
    solid=solid.cut(cq.Compound.makeCompound(bridge_cuts)).clean()
    assert solid.val().isValid() and len(solid.solids().vals())==1
    allholes=infos['left']['holes']+infos['right']['holes']+holes
    fullprofile=unary_union([profile,infos['left']['profile'],infos['right']['profile']])
    info=dict(profile=fullprofile,holes=allholes)
    row=validate_and_export(solid,out/'holder_single_PROTOTYPE.stl','single_piece_holder',info,dict(p,edge_chamfer=0))
    cq.exporters.export(solid,str(out/'holder_single_PROTOTYPE.step'))
    cq.exporters.export(solid,str(out/'holder_single_geometry.3mf'),tolerance=p['stl_tolerance'],angularTolerance=p['stl_angular_tolerance'])
    # Export bridge as a diagnostic solid, not a separate print part.
    cq.exporters.export(bridge,str(out/'validation/bridge_region.step'))
    seating=[sum(s.Volume(1e-7) for s in solid.intersect(k).solids().vals()) for k in seating_volumes(p)]
    assert max(seating)<1e-6
    camera_intersection=sum(s.Volume(1e-7) for s in solid.intersect(rounded_solid(*camera_rect(p),10,z=-1)).solids().vals())
    assert camera_intersection<1e-6
    for side in parts:
        assert sum(s.Volume(1e-7) for s in solid.intersect(nub_cutter(p,side)).solids().vals())<1e-6
    bridge_info=dict(construction_bounds_mm=list(profile.bounds),central_band_height_mm=p['bridge_y_max']-146.8,
        hexagons=len(holes),hex_flat_to_flat_mm=p['hex_flat_to_flat'],minimum_hex_web_mm=min(a.distance(b) for i,a in enumerate(holes) for b in holes[i+1:]),
        minimum_hex_border_mm=min(h.distance(profile.boundary) for h in holes),attachment_overlap_mm3=intersections,
        cross_section_join_x_mm=[12.,81.],minimum_straight_attachment_width_mm=3.95,
        hole_centers_mm=[[h.centroid.x,h.centroid.y] for h in holes])
    report=dict(revision=p['revision'],parameters=p,parts=[row],bridge=bridge_info,
        physical_diagnostics=diagnostics(p),phone_seating_interference_mm3=seating,camera_interference_mm3=camera_intersection,
        opening_dimensions={s:dict(center_x_mm=opening_center(p,s),endpoints_y_mm=opening_ends(p,s),widths=[dict(z=z,width=nub_width(p,s,z)) for z in [0,2,4.4]]) for s in parts},
        manufacturing_cleanup={s:infos[s]['discarded_tip_volume_mm3'] for s in parts})
    (out/'parameters.json').write_text(json.dumps(p,indent=2)+'\n')
    (out/'evidence/fit_adjustments.json').write_text(json.dumps(p['v10_evidence'],indent=2)+'\n')
    (out/'validation/geometry_report.json').write_text(json.dumps(report,indent=2)+'\n')
    (out/'validation/bridge_profile.json').write_text(json.dumps(dict(profile=mapping(profile),holes=[mapping(h) for h in holes]))+'\n')
    print(json.dumps(dict(exported_models=1,single_solid=True,bridge=bridge_info)),flush=True)
    return {'holder':solid},{'holder':info},report


if __name__=='__main__':build()
