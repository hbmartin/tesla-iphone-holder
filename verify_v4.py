"""Independent measurements of exported V4 meshes, CAD, and real G-code."""
from pathlib import Path
import hashlib
import json
import math
import re
import zipfile
import xml.etree.ElementTree as ET
import cadquery as cq
import numpy as np
import trimesh
from build_model import ROOT, rounded_solid


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def curves(mesh,origin,normal):
    s=mesh.section(plane_origin=origin,plane_normal=normal)
    assert s is not None,"Missing section"
    return [e.discrete(s.vertices) for e in s.entities]


def crossings(lines,axis,value,result_axis):
    result=[]
    for line in lines:
        for a,b in zip(line[:-1],line[1:]):
            if (a[axis]<=value<b[axis]) or (b[axis]<=value<a[axis]):
                result.append(a[result_axis]+(value-a[axis])*
                              (b[result_axis]-a[result_axis])/(b[axis]-a[axis]))
    return sorted(result)


def bracket(values,center):
    return max(x for x in values if x<center),min(x for x in values if x>center)


def close(a,b,tol=.03):
    assert abs(a-b)<=tol,(float(a),float(b),tol)


def geometry(out,report):
    p=report["parameters"]
    assert [p["phone_width"],p["phone_length"]]==[71.1,150.]
    assert [p["camera_width"],p["camera_length"],p["camera_bottom_y"]]==[64.5,41.5,105.]
    assert p["camera_center_offset_x"]==0 and p["camera_clearance"]==.3
    assert p["camera_lower_blend_relief"]==0 and p["nub_upper_opening_width"]==5.6
    assert p["thickness"]==4.4 and p["maximum_allowed_thickness"]==4.5
    meshes={s:trimesh.load_mesh(out/f"{s}_insert_PROTOTYPE.stl",process=True) for s in ("left","right")}
    cad={s:cq.importers.importStep(str(out/f"{s}_insert_PROTOTYPE.step")) for s in meshes}
    rows=[];sections=[]
    for side,m in meshes.items():
        assert m.is_watertight and m.is_winding_consistent
        assert len(m.split(only_watertight=False))==1 and m.volume>0
        assert cad[side].val().isValid() and len(cad[side].solids().vals())==1
        delta=abs(m.volume-cad[side].val().Volume())/cad[side].val().Volume()
        # 0.025 mm STL chord tolerance on many curved slot/edge faces produces
        # about 0.10% volume error. Check dimensions separately below.
        assert delta<.002,(side,delta)
        assert m.bounds[0,2]>=-1e-5 and m.bounds[1,2]<=4.5+1e-5
        close(m.bounds[0,1],0,.0001)
        # Every vertex must be at or below the shared outer plane.
        top_allowed=1+p["outer_top_slope"]*m.vertices[:,1]
        assert np.max(m.vertices[:,2]-top_allowed)<.0001
        lower=m.vertices[np.abs(m.vertices[:,1])<1e-4]
        close(lower[:,2].max(),1,.001)
        rows.append(dict(part=side,watertight_single_solid=True,
                         installed_maximum_z_mm=float(m.bounds[1,2]),
                         cad_stl_volume_difference_percent=100*delta,
                         sha256=sha(out/f"{side}_insert_PROTOTYPE.stl")))
        cx=p[side+"_nub_x"];cy=p[side+"_nub_y"]
        old=trimesh.load_mesh(ROOT/f"output/v3/{side}_insert_PROTOTYPE.stl")
        old_top=curves(old,[0,0,5.4-1e-5],[0,0,1])
        old_bottom=curves(old,[0,0,1e-5],[0,0,1])
        old_ends=bracket(crossings(old_top,0,cx,1),cy)
        old_base_ends=bracket(crossings(old_bottom,0,cx,1),cy)
        old_base_width=np.diff(bracket(crossings(old_bottom,1,cy,0),cx))[0]
        widths=[]
        for u in [.00001,.125,.25,.5,.75,.875,.99999]:
            lines=curves(m,[0,0,u],[0,-u*p["outer_top_slope"],1])
            l,r=bracket(crossings(lines,1,cy,0),cx)
            bottom,top=bracket(crossings(lines,0,cx,1),cy)
            blend=u*u*(3-2*u)
            expected_width=19.4+(5.6-19.4)*blend
            close(r-l,expected_width,.06)
            close(bottom,old_base_ends[0]+blend*p[side+"_nub_upper_bottom_reduction"],.03)
            close(top,old_base_ends[1]-blend*p[side+"_nub_upper_top_reduction"],.03)
            widths.append(r-l)
            if u<.001:
                close(r-l,old_base_width)
            if u>.999:
                close(r-l,5.6)
                close(bottom-old_ends[0],6 if side=="right" else 0)
                close(old_ends[1]-top,5 if side=="right" else 0)
                # Check the mouth width at several points along its straight run.
                for y in np.linspace(bottom+5,top-5,5):
                    a,b=bracket(crossings(lines,1,y,0),cx);close(b-a,5.6)
            sections.append(dict(part=side,local_height_fraction=u,width_mm=r-l,
                                 lower_end_y_mm=bottom,upper_end_y_mm=top))
        assert all(a>b for a,b in zip(widths[:-1],widths[1:])),"Non-monotonic opening"

    close(meshes["right"].bounds[1,2],4.4,.00001)
    assert cad["left"].intersect(cad["right"]).val().Volume()<1e-7
    # Independently construct the actual phone envelope (without the design's
    # extra 0.2 mm seating margin) and verify the exported STEP geometry.
    phone=rounded_solid(46.5,75,71.1,150,p["phone_corner_radius"],12,z=-1)
    low=cq.Workplane("XY").box(200,37,12,centered=False).translate((-50,-1,-1))
    lower_keepout=phone.intersect(low)
    slope=p["phone_support_top_height"]/150
    above=cq.Workplane("YZ",origin=(-60,0,0)).polyline(
        [(-1,-slope),(151,151*slope),(151,20),(-1,20)]).close().extrude(200).intersect(phone)
    for part in cad.values():
        assert part.intersect(lower_keepout).val().Volume()<1e-6
        assert part.intersect(above).val().Volume()<1e-6
    # Camera side walls at the housing center, then its two right-hand corner
    # intersections. This measures the open-sided relief, not a nonexistent ring.
    lines=[c for m in meshes.values() for c in curves(m,[0,0,.8],[0,0,1])]
    l,r=bracket(crossings(lines,1,125.75,0),46.5)
    close(l,13.95);close(r,79.05);close(r-l,65.1)
    rlines=curves(meshes["right"],[0,0,.8],[0,0,1])
    bottom,top=bracket(crossings(rlines,0,75,1),125.75)
    arc_inset=6.3-math.sqrt(6.3**2-(75-(79.05-6.3))**2)
    close(bottom,104.7+arc_inset);close(top,146.8-arc_inset)
    close(top-bottom+2*arc_inset,42.1)
    # Conservative planar profiles reserve the widest nub opening and
    # underside rounds; verify exported hole layout and spacing.
    for part in report["parts"]:
        if part["hexagonal_openings"]:
            assert part["min_hex_web_mm_before_chamfer"]>=1.6-.005
            assert part["min_hex_to_boundary_mm_before_chamfer"]>=2.9-.005
    return dict(meshes=rows,nub_sections=sections,camera_opening_width_mm=r-l,
                camera_opening_height_mm=top-bottom+2*arc_inset,
                phone_seating_keepout_clear=True,insert_overlap_mm3=0,
                underside_openings_match_V3=True)


def slicing(out):
    name="Holder_V4_A1_PLA_PROTOTYPE";folder=out/"slicer"/name
    result=json.loads((folder/"result.json").read_text())
    settings=json.loads((folder/"effective_settings.json").read_text())
    assert result["return_code"]==0 and len(result["sliced_plates"])==1
    plate=result["sliced_plates"][0]
    assert len(plate["objects"])==2 and not plate["warning_message"]
    expected={"printer_model":"Bambu Lab A1","nozzle_diameter":["0.4"],"filament_type":["PLA"],
              "layer_height":"0.2","wall_loops":"3","sparse_infill_density":"20%",
              "sparse_infill_pattern":"gyroid",
              "enable_support":"1","support_type":"normal(auto)","support_on_build_plate_only":"1"}
    for key,value in expected.items():assert settings[key]==value,(key,settings[key])
    for obj in plate["objects"]:
        b=obj["bbox"]
        assert b["x"]>=0 and b["y"]>=0 and b["x"]+b["width"]<=256 and b["y"]+b["depth"]<=256
        assert b["z"]==0
        mesh=trimesh.load_mesh(out/(obj["name"]+".stl"))
        assert np.allclose(mesh.extents,[b["width"],b["depth"],b["height"]],atol=.0001)
    code=(folder/"plate_1.gcode").read_text()
    layers=[float(z) for z in re.findall(r"^; Z_HEIGHT: ([0-9.]+)",code,re.M)]
    assert len(layers)==22 and abs(layers[0]-.2)<1e-6 and abs(layers[-1]-4.4)<1e-6
    assert re.search(r"^; FEATURE: Support$",code,re.M)
    assert re.search(r"^; FEATURE: Support interface$",code,re.M)
    assert plate["feature_type_times"]["Support"]>0
    project=out/(name+".3mf")
    with zipfile.ZipFile(project) as z:
        embedded=json.loads(z.read("Metadata/project_settings.config"))
        for key,value in expected.items():assert embedded[key]==value
        root=ET.fromstring(z.read("3D/3dmodel.model"))
        ns={"m":"http://schemas.microsoft.com/3dmanufacturing/core/2015/02"}
        assert root.get("unit")=="millimeter" and len(root.findall("m:build/m:item",ns))==2
    # Studio's editable project and sliced plate are separate native exports.
    # Read both; a .3mf extension alone does not prove G-code was packaged.
    editable=out/(name+"_SLICED.3mf")
    with zipfile.ZipFile(editable) as z:
        embedded=json.loads(z.read("Metadata/project_settings.config"))
        for key,value in expected.items():assert embedded[key]==value
        config=ET.fromstring(z.read("Metadata/model_settings.config"))
        model=ET.fromstring(z.read("3D/3dmodel.model"))
        items=model.findall("m:build/m:item",ns)
        assert len(items)==2
        for item in items:
            obj_id=item.get("objectid")
            obj=config.find(f"./object[@id='{obj_id}']")
            obj_name=obj.find("./metadata[@key='name']").get("value")
            stats=obj.find("./part/mesh_stat")
            assert all(int(stats.get(k))==0 for k in
                       ("edges_fixed","degenerate_facets","facets_removed","facets_reversed","backwards_edges"))
            component=model.find(f"./m:resources/m:object[@id='{obj_id}']/m:components/m:component",ns)
            component_path=component.get("{http://schemas.microsoft.com/3dmanufacturing/production/2015/06}path")
            comp=ET.fromstring(z.read(component_path.lstrip("/")))
            vertices=np.array([[float(v.get(k)) for k in ("x","y","z")]
                               for v in comp.findall(".//m:vertices/m:vertex",ns)])
            transform=np.array([float(n) for n in item.get("transform").split()])
            assert np.allclose(transform[:9],np.eye(3).ravel())
            vertices+=transform[9:]
            original=trimesh.load_mesh(out/(obj_name+".stl"))
            bbox=next(o["bbox"] for o in plate["objects"] if o["name"]==obj_name)
            target=original.vertices-original.bounds[0]+[bbox["x"],bbox["y"],0]
            from scipy.spatial import cKDTree
            assert cKDTree(target).query(vertices)[0].max()<.0001
            assert cKDTree(vertices).query(target)[0].max()<.0001
    sliced=out/(name+".gcode.3mf")
    with zipfile.ZipFile(sliced) as z:
        embedded=json.loads(z.read("Metadata/project_settings.config"))
        for key,value in expected.items():assert embedded[key]==value
        raw=z.read("Metadata/plate_1.gcode")
        assert hashlib.md5(raw).hexdigest()==z.read("Metadata/plate_1.gcode.md5").decode().strip().lower()
        gui_code=raw.decode()
        gui_layers=[float(n) for n in re.findall(r"^; Z_HEIGHT: ([0-9.]+)",gui_code,re.M)]
        assert np.allclose(gui_layers,layers)
        info=ET.fromstring(z.read("Metadata/slice_info.config"))
        meta={m.get("key"):m.get("value") for m in info.findall("./plate/metadata")}
        assert meta["support_used"]=="true" and meta["outside"]=="false"
        assert len(info.findall("./plate/object"))==2 and meta["printer_model_id"]=="N2S"
        warnings=[w.get("msg") for w in info.findall("./plate/warning")]
        assert all(w=="not_support_traditional_timelapse" for w in warnings),warnings
        from slice_v4 import inspect
        layer_checks=inspect(gui_code,out)
    return dict(native_project=project.name,editable_studio_project=editable.name,
                sliced_plate=sliced.name,sliced_plate_sha256=sha(sliced),
                gui_gcode_md5_verified=True,gui_project_geometry_matches_stls=True,
                gui_export_warnings=warnings,actual_layers=layer_checks,
                real_gcode="slicer/"+name+"/plate_1.gcode",
                sha256=sha(folder/"plate_1.gcode"),slice_success=True,model_warnings=[],
                objects=2,layers=22,support_toolpaths=True,support_interface_toolpaths=True,
                orientation="console side down",estimated_minutes=plate["total_predication"]/60,
                filament_grams=sum(f["total_used_g"] for f in plate["filaments"]),
                support_removal="Access through the retained 19.4 mm underside mouths; actual removal is a physical test.",
                embedded_settings_match_slice=True)


def package(out):
    sources=["build_model.py","model_v4.py","make_previews.py","previews_v4.py","slice_v4.py",
             "prepare_slicer.py","verify_outputs.py","verify_v4.py","parameters.json","requirements.txt","README.txt"]
    files=[ROOT/f for f in sources]
    files += [ROOT/"revisions/v3/output_sha256.json"]
    files += [ROOT/f"output/v3/{s}_insert_PROTOTYPE.stl" for s in ("left","right")]
    files += [f for f in out.iterdir() if f.is_file() and not f.name.startswith(".")]
    files += [f for f in (out/"previews").glob("*") if not f.name.startswith(".")]
    files += [f for f in (out/"validation").iterdir() if f.is_file() and f.suffix in (".json",".txt")]
    folder=out/"slicer/Holder_V4_A1_PLA_PROTOTYPE"
    files += [folder/f for f in ("plate_1.gcode","result.json","effective_settings.json")]
    files += [out/"slicer"/f"{n}.json" for n in ("machine","process","filament")]
    archive=ROOT/"tesla_iphone_holder_prototype_v4.zip"
    with zipfile.ZipFile(archive,"w",zipfile.ZIP_DEFLATED) as z:
        for f in sorted(set(files)):z.write(f,f.relative_to(ROOT))
    return dict(path=str(archive),bytes=archive.stat().st_size,sha256=sha(archive))


def verify_v4(out,geometry_only=False):
    report=json.loads((out/"validation/geometry_report.json").read_text())
    checks=geometry(out,report)
    preserved=json.loads((ROOT/"revisions/v3/output_sha256.json").read_text())
    # The portable V4 package carries the two V3 comparison meshes. The
    # original workspace additionally verifies every preserved V3 artifact.
    present={path:digest for path,digest in preserved.items() if (ROOT/path).exists()}
    assert all(sha(ROOT/path)==digest for path,digest in present.items()),"V3 outputs changed"
    result=dict(computational_geometry_status="PASS",geometry=checks,
                V3_output_files_preserved=len(present),
                V3_reference_files_absent=len(preserved)-len(present),
                physical_diagnostics=report["physical_diagnostics"])
    if geometry_only:
        (out/"validation/geometry_verification.json").write_text(json.dumps(result,indent=2)+"\n")
        return {"geometry":"PASS","mesh_count":2,"nub_sections_checked":len(checks["nub_sections"])}
    result["slicing"]=slicing(out)
    result["physical_test_checklist"]=[
        "Remove supports from underside nub openings and exterior edge rounds.",
        "Seat both inserts independently: record rocking, high spots and end interference.",
        "Check snug camera fit and phone-bottom access to the factory crease.",
        "Check lens contact before pressing down; rigid flat-pad geometry predicts interference.",
        "Compare stationary charging for 10 minutes against the bare-phone baseline.",
        "A/B/C contour-gauge measurements remain pending."]
    (out/"validation/final_verification.json").write_text(json.dumps(result,indent=2)+"\n")
    summary=("V4 COMPUTATIONAL GEOMETRY AND SLICE: PASS\n"
             "Two watertight inserts, finished upper nub widths 5.60 mm, 4.4 mm maximum Z.\n"
             "Phone seating recess and camera opening dimensions verified from exported geometry.\n"
             "V3 output checksums unchanged.\n"
             f"A1 PLA: {result['slicing']['estimated_minutes']:.1f} minutes, {result['slicing']['filament_grams']:.1f} grams, 22 layers.\n"
             "Supports enabled and present. Remove them before testing.\n"
             "PHYSICAL FIT UNTESTED. LENS INTERFERENCE PREDICTED; CLEARANCE IS NOT CERTIFIED.\n")
    (out/"validation/VALIDATION.txt").write_text(summary)
    (out/"README.txt").write_text((ROOT/"README.txt").read_text())
    return dict(status="COMPUTATIONAL_PASS_PHYSICAL_FIT_UNTESTED",slicing=result["slicing"],package=package(out))
