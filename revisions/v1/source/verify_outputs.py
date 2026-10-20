#!/usr/bin/env python3
"""Verify the exported meshes, native projects and actual G-code; package outputs."""
from pathlib import Path
import hashlib
import json
import re
import zipfile
import xml.etree.ElementTree as ET
import numpy as np
import trimesh

ROOT=Path(__file__).resolve().parent
OUT=ROOT/"output"


def verify():
    geometry=json.loads((OUT/"validation/geometry_report.json").read_text())
    checks=[]
    for part in geometry["parts"]:
        path=ROOT/part["file"]
        mesh=trimesh.load_mesh(path,process=True)
        assert mesh.is_watertight and mesh.is_winding_consistent and len(mesh.split(only_watertight=False))==1,path
        delta=abs(mesh.volume-part["cad_volume_mm3"])/part["cad_volume_mm3"]
        assert delta<0.001,(path,delta)
        checks.append({"file":part["file"],"sha256":hashlib.sha256(path.read_bytes()).hexdigest(),
                       "watertight_single_solid":True,"cad_volume_difference_percent":round(delta*100,5)})
    projects=[]
    for name,nobjects in [("Holder_A1_PLA_PROTOTYPE",2),("Fit_tests_A1_PLA",9)]:
        folder=OUT/"slicer"/name
        result=json.loads((folder/"result.json").read_text())
        effective=json.loads((folder/"effective_settings.json").read_text())
        assert result["return_code"]==0 and len(result["sliced_plates"])==1
        plate=result["sliced_plates"][0]
        assert len(plate["objects"])==nobjects and not plate["warning_message"]
        assert effective["printer_model"]=="Bambu Lab A1" and effective["nozzle_diameter"]==["0.4"]
        assert effective["filament_type"]==["PLA"] and float(effective["layer_height"])==0.2
        assert str(effective["enable_support"])=="0"
        assert not any("support" in k.lower() for k in plate["feature_type_times"])
        for obj in plate["objects"]:
            b=obj["bbox"]
            assert b["x"]>=-.001 and b["y"]>=-.001 and b["x"]+b["width"]<=256.001 and b["y"]+b["depth"]<=256.001
            assert abs(b["z"])<.001
            path=OUT/("" if nobjects==2 else "fit_tests")/(obj["name"]+".stl")
            mesh=trimesh.load_mesh(path)
            assert np.allclose(mesh.extents,[b["width"],b["depth"],b["height"]],atol=.0001)
        gcode=(folder/"plate_1.gcode").read_text()
        layers=[float(z) for z in re.findall(r"^; Z_HEIGHT: ([0-9.]+)",gcode,re.M)]
        max_z=max(a["bbox"]["height"] for a in plate["objects"])
        assert abs(layers[-1]-max_z)<.001
        assert not re.search(r";(?:FEATURE|TYPE):\s*Support",gcode,re.I)
        label_counts=None
        if nobjects==9:
            label_counts={o["name"]:0 for o in plate["objects"]}
            x=y=layer=last_e=0.;relative=True
            number=r"[-+]?(?:\d+(?:\.\d*)?|\.\d+)"
            for line in gcode.splitlines():
                if line.startswith("; Z_HEIGHT:"):layer=float(line.split(":")[1])
                if line.startswith("M83"):relative=True
                if line.startswith("M82"):relative=False
                if line.startswith("G92 E"):last_e=float(line.split("E")[1].split()[0])
                if not re.match(r"^G[0123]\s",line):continue
                vals={k:float(v) for k,v in re.findall(r"([XYE])("+number+")",line)}
                nx,ny=vals.get("X",x),vals.get("Y",y)
                delta_e=vals.get("E",0.) if relative else vals.get("E",last_e)-last_e
                if "E" in vals:last_e=vals["E"]
                if layer>geometry["parameters"]["thickness"]+.05 and delta_e>0 and (nx!=x or ny!=y):
                    for obj in plate["objects"]:
                        b=obj["bbox"]
                        if b["x"]-.1<=nx<=b["x"]+b["width"]+.1 and b["y"]-.1<=ny<=b["y"]+b["depth"]+.1:
                            label_counts[obj["name"]]+=1
                x,y=nx,ny
            assert all(c>10 for c in label_counts.values()),label_counts
        with zipfile.ZipFile(OUT/(name+".3mf")) as z:
            model=ET.fromstring(z.read("3D/3dmodel.model"))
            ns={"m":"http://schemas.microsoft.com/3dmanufacturing/core/2015/02"}
            assert len(model.findall("m:build/m:item",ns))==nobjects and model.get("unit")=="millimeter"
            embedded=json.loads(z.read("Metadata/project_settings.config"))
            for k in ["printer_model","nozzle_diameter","filament_type","layer_height","enable_support","curr_bed_type"]:
                assert embedded[k]==effective[k],(k,embedded[k],effective[k])
        projects.append({"project":name+".3mf","objects":nobjects,"layers":len(layers),"slice_success":True,
                         "slicing_warnings":[],"support_toolpaths":False,
                         "estimated_minutes":round(plate["total_predication"]/60,1),
                         "estimated_grams":round(sum(a["total_used_g"] for a in plate["filaments"]),2),
                         "all_objects_on_bed_and_within_A1_plate":True,
                         "embedded_settings_verified_against_effective_slicer_settings":True,
                         "raised_label_extrusion_segments":label_counts,
                         "sha256":hashlib.sha256((OUT/(name+".3mf")).read_bytes()).hexdigest()})
    report={"status":"PASS","mesh_count":len(checks),"mesh_checks":checks,"projects":projects,
            "physical_checks_pending":["nub footprint and position","camera housing outline and vertical engagement",
                                       "repeatable phone placement","10-minute stationary charging comparison","cabin heat / final material"],
            "build_plate_assumption":"Textured PEI Plate; select the actual installed plate before printing."}
    (OUT/"validation/final_verification.json").write_text(json.dumps(report,indent=2)+"\n")
    summary=["VALIDATION: PASS","",f"{len(checks)} meshes: each one watertight solid, consistent winding, CAD/STL volume difference below 0.1%.",
             "Native Bambu projects were read and sliced using their embedded settings.",
             "No repair/slicing warnings or support toolpaths. No printer job was sent.",
             "Raised label extrusion is present on all nine fit gauges.",""]
    for p in projects:
        summary.append(f"{p['project']}: {p['objects']} objects, {p['layers']} layers, {p['estimated_minutes']} minutes, {p['estimated_grams']} g PLA.")
    summary += ["","Physical fit, camera engagement, charging, and cabin heat remain untested.",
                "Textured PEI Plate is the project default; select your installed plate before printing."]
    (OUT/"validation/VALIDATION.txt").write_text("\n".join(summary)+"\n")
    return report


def package():
    files=[ROOT/n for n in ["README.txt","parameters.json","build_model.py","make_previews.py","prepare_slicer.py","verify_outputs.py","requirements.txt"]]
    files+=list(OUT.glob("*.stl"))+list(OUT.glob("*.step"))+list(OUT.glob("*.3mf"))
    files+=list((OUT/"fit_tests").glob("*.stl"))+list((OUT/"previews").glob("*"))
    files += [OUT/"validation"/n for n in ["geometry_report.json","slicer_report.json","final_verification.json","VALIDATION.txt"]]
    archive=ROOT/"tesla_iphone_holder_prototype_v1.zip"
    with zipfile.ZipFile(archive,"w",zipfile.ZIP_DEFLATED) as z:
        for p in files:z.write(p,p.relative_to(ROOT))
    return {"file":str(archive),"files":len(files),"bytes":archive.stat().st_size}


if __name__=="__main__":
    result=verify()
    print(json.dumps({"status":result["status"],"projects":result["projects"],"package":package()},indent=2))
