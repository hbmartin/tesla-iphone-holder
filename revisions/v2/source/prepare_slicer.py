#!/usr/bin/env python3
"""Resolve local Bambu presets and build/slice portable project copies.

Never changes user slicer settings and never connects to a printer. All CLI
settings, logs, and 3MF output go under output/. Manufacturer start/end G-code
is copied unchanged from the locally installed A1 preset.
"""
from __future__ import annotations
import argparse
import json
from pathlib import Path
import subprocess
import zipfile
import xml.etree.ElementTree as ET

ROOT=Path(__file__).resolve().parent
BBL=Path.home()/"Library/Application Support/BambuStudio/system/BBL"
EXE=Path("/Applications/BambuStudio.app/Contents/MacOS/BambuStudio")


def resolve(typ,name,stack=()):
    if name in stack: raise ValueError("Preset inheritance cycle")
    path=BBL/typ/(name+".json")
    data=json.loads(path.read_text())
    result=resolve(typ,data["inherits"],stack+(name,)) if data.get("inherits") else {}
    for include in data.get("include",[]):
        result.update(resolve(typ,include,stack+(name,)))
    result.update({k:v for k,v in data.items() if k not in ("inherits","include")})
    return result


def presets(out):
    machine=resolve("machine","Bambu Lab A1 0.4 nozzle")
    process=resolve("process","0.20mm Standard @BBL A1")
    filament=resolve("filament","Generic PLA @BBL A1")
    process.update({"name":"Tesla holder PROTOTYPE - A1 0.20mm",
                    "print_settings_id":"Tesla holder PROTOTYPE - A1 0.20mm",
                    "layer_height":"0.2","initial_layer_print_height":"0.2",
                    "wall_loops":"3","top_shell_layers":"4","bottom_shell_layers":"4",
                    "sparse_infill_density":"20%","sparse_infill_pattern":"gyroid",
                    "enable_support":"0","brim_type":"no_brim","brim_width":"0",
                    "print_sequence":"by layer"})
    machine["printer_settings_id"]="Bambu Lab A1 0.4 nozzle"
    filament["filament_settings_id"]=["Generic PLA @BBL A1"]
    filament["filament_colour"]=["#00AE42"]
    # Explicit plate choice for a portable project. The existing printer/nozzle,
    # Generic PLA and 0.20 mm profile are retained; the bed is not discoverable.
    process["curr_bed_type"]="Textured PEI Plate"
    for name,data in [("machine",machine),("process",process),("filament",filament)]:
        (out/f"{name}.json").write_text(json.dumps(data,indent=2)+"\n")


def create_geometry_3mf(paths,target,settings=None):
    """Build a deterministic multi-object print layout, at Z=0, without nesting.

    3MF has explicit millimeter units. Separate objects retain useful names.
    With settings supplied, this writes a native Bambu project, including its
    model/plate metadata and embedded printer/process/filament presets. Bambu's
    CLI subsequently reads and slices this exact file without settings overrides.
    """
    import trimesh
    ns="http://schemas.microsoft.com/3dmanufacturing/core/2015/02"
    ET.register_namespace("",ns)
    tag=lambda x:f"{{{ns}}}{x}"
    model=ET.Element(tag("model"),unit="millimeter",attrib={"xml:lang":"en-US"})
    ET.SubElement(model,tag("metadata"),name="Title").text=target.stem
    # Bambu's importer recognizes native project settings only when Application
    # begins with BambuStudio-. This is a compatibility marker; preserve the
    # actual generator separately in Description.
    ET.SubElement(model,tag("metadata"),name="Application").text="BambuStudio-02.08.02.61" if settings is not None else "CadQuery 2.8.0"
    ET.SubElement(model,tag("metadata"),name="Description").text="Parametric CadQuery prototype; native project packaged by prepare_slicer.py, then verified in Bambu Studio."
    if settings is not None:
        ET.SubElement(model,tag("metadata"),name="BambuStudio:3mfVersion").text="1"
    config=ET.Element("config")
    resources=ET.SubElement(model,tag("resources"));build=ET.SubElement(model,tag("build"))
    x,y,row_h=25.,25.,0.
    placements=[]
    for i,path in enumerate(paths,1):
        mesh=trimesh.load_mesh(path,process=True)
        mesh.apply_translation(-mesh.bounds[0])
        w,h,_=mesh.extents
        if x+w>232:
            x=25.;y+=row_h+10;row_h=0.
        if y+h>235: raise ValueError(f"Objects exceed plate: {path.name}")
        mesh.apply_translation([x,y,0])
        mesh_id,object_id=2*i-1,2*i
        obj=ET.SubElement(resources,tag("object"),id=str(mesh_id),type="model",name=path.stem)
        mx=ET.SubElement(obj,tag("mesh"));vs=ET.SubElement(mx,tag("vertices"));ts=ET.SubElement(mx,tag("triangles"))
        for v in mesh.vertices:
            ET.SubElement(vs,tag("vertex"),**dict(zip("xyz",(f"{a:.6f}" for a in v))))
        for f in mesh.faces:
            ET.SubElement(ts,tag("triangle"),**{f"v{k+1}":str(int(v)) for k,v in enumerate(f)})
        alias=ET.SubElement(resources,tag("object"),id=str(object_id),type="model",name=path.stem)
        comps=ET.SubElement(alias,tag("components"))
        ET.SubElement(comps,tag("component"),objectid=str(mesh_id),transform="1 0 0 0 1 0 0 0 1 0 0 0")
        ET.SubElement(build,tag("item"),objectid=str(object_id),printable="1")
        ob=ET.SubElement(config,"object",id=str(object_id))
        ET.SubElement(ob,"metadata",key="name",value=path.stem)
        ET.SubElement(ob,"metadata",key="extruder",value="1")
        part=ET.SubElement(ob,"part",id=str(mesh_id),subtype="normal_part")
        ET.SubElement(part,"metadata",key="name",value=path.stem)
        ET.SubElement(part,"metadata",key="matrix",value="1 0 0 0 0 1 0 0 0 0 1 0 0 0 0 1")
        ET.SubElement(part,"mesh_stat",edges_fixed="0",degenerate_facets="0",facets_removed="0",facets_reversed="0",backwards_edges="0")
        placements.append({"name":path.stem,"bounds_mm":mesh.bounds.round(4).tolist()})
        x+=w+10;row_h=max(row_h,h)
    plate=ET.SubElement(config,"plate")
    ET.SubElement(plate,"metadata",key="plater_id",value="1")
    ET.SubElement(plate,"metadata",key="plater_name",value=target.stem)
    ET.SubElement(plate,"metadata",key="locked",value="false")
    for i in range(1,len(paths)+1):
        inst=ET.SubElement(plate,"model_instance")
        ET.SubElement(inst,"metadata",key="object_id",value=str(2*i))
        ET.SubElement(inst,"metadata",key="instance_id",value="0")
        ET.SubElement(inst,"metadata",key="identify_id",value=str(i))
    with zipfile.ZipFile(target,"w",zipfile.ZIP_DEFLATED) as z:
        z.writestr("[Content_Types].xml",'<?xml version="1.0" encoding="UTF-8"?><Types xmlns="http://schemas.openxmlformats.org/package/2006/content-types"><Default Extension="rels" ContentType="application/vnd.openxmlformats-package.relationships+xml"/><Default Extension="model" ContentType="application/vnd.ms-package.3dmanufacturing-3dmodel+xml"/></Types>')
        z.writestr("_rels/.rels",'<?xml version="1.0" encoding="UTF-8"?><Relationships xmlns="http://schemas.openxmlformats.org/package/2006/relationships"><Relationship Target="/3D/3dmodel.model" Id="rel0" Type="http://schemas.microsoft.com/3dmanufacturing/2013/01/3dmodel"/></Relationships>')
        z.writestr("3D/3dmodel.model",ET.tostring(model,encoding="utf-8",xml_declaration=True))
        if settings is not None:
            z.writestr("Metadata/model_settings.config",ET.tostring(config,encoding="utf-8",xml_declaration=True))
            z.writestr("Metadata/project_settings.config",json.dumps(settings,indent=2))
            for typ in ("machine","process","filament"):
                preset_file=target.parent/"slicer"/(typ+".json")
                z.writestr(f"Metadata/{typ}_settings_1.config",preset_file.read_text())
    return placements


def run_project(out,name,paths):
    folder=out/"slicer"/name;folder.mkdir(exist_ok=True)
    project=out/(name+".3mf")
    settings={}
    ignored={"type","name","from","setting_id","instantiation","description","compatible_printers","compatible_printers_condition"}
    for key in ("machine","process","filament"):
        settings.update({k:v for k,v in json.loads((out/"slicer"/(key+".json")).read_text()).items() if k not in ignored})
    settings["version"]="02.08.02.61"
    placements=create_geometry_3mf(paths,project,settings=settings)
    cmd=[str(EXE),"--debug","2","--datadir",str(out/"slicer"/"isolated_config"),
         "--arrange","0","--orient","0","--ensure-on-bed",
         "--slice","0","--export-settings",str(folder/"effective_settings.json"),
         "--outputdir",str(folder),str(project)]
    print("Slicing",name,flush=True)
    log=out/"validation"/(name+"_slice.log")
    with log.open("w") as stream:
        result=subprocess.run(cmd,stdout=stream,stderr=subprocess.STDOUT,text=True,timeout=180)
    if result.returncode or not (folder/"plate_1.gcode").exists():
        print(log.read_text()[-8000:])
        raise RuntimeError(f"Bambu slice failed ({result.returncode})")
    return {"project":project.name,"slice_return_code":result.returncode,"placements":placements,
            "log":f"validation/{name}_slice.log","validated_by":"Bambu Studio read and sliced this exact native project with embedded settings; no CLI settings overrides"}


def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument("--output",type=Path,default=ROOT/"output/v2")
    ap.add_argument("--presets-only",action="store_true")
    args=ap.parse_args();out=args.output.resolve()
    (out/"slicer").mkdir(exist_ok=True)
    presets(out/"slicer")
    if args.presets_only: return
    reports=[]
    reports.append(run_project(out,"Holder_V2_A1_PLA_PROTOTYPE",[out/f"{s}_insert_PROTOTYPE.stl" for s in ("left","right")]))
    # Three full camera rings plus six end gauges comfortably fit one A1 plate
    # when the camera rings are placed first in a row.
    coupons=sorted((out/"fit_tests").glob("camera*.stl"))+sorted((out/"fit_tests").glob("*nub*.stl"))
    reports.append(run_project(out,"Fit_tests_V2_A1_PLA",coupons))
    (out/"validation"/"slicer_report.json").write_text(json.dumps(reports,indent=2)+"\n")
    print("Both Bambu projects exported and sliced.",flush=True)


if __name__=="__main__":main()
