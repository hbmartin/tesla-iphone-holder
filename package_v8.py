"""Archive checked V8 CAD, Studio exports, source and photo evidence."""
from pathlib import Path
import json
import hashlib
import zipfile
ROOT=Path(__file__).resolve().parent
OUT=ROOT/'output/v8'

def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()

def main():
    report=json.loads((OUT/'validation/final_verification.json').read_text())
    assert report['computational_geometry_status']=='PASS' and len(report['mesh_checks'])==5
    assert all(s['settings_verified'] and s['model_layers']==22 and not s['warnings'] for s in report['slicing'])
    for row in report['mesh_checks']:assert sha(OUT/row['file'])==row['sha256']
    ready=json.loads((OUT/'validation/gui_ready_verification.json').read_text())
    assert ready['status']=='PASS' and sorted(p['objects'] for p in ready['plates'])==[2,3]
    for plate in ready['plates']:
        assert plate['status']=='PASS' and plate['embedded_gcode_checksum_verified']
        assert sha(OUT/plate['editable_project'])==plate['editable_project_sha256']
        assert sha(OUT/plate['sliced_plate'])==plate['sliced_plate_sha256']
        for model in plate['geometry_checks']:
            path=OUT/('fit_tests' if plate['objects']==3 else '')/(model['name']+'.stl')
            assert sha(path)==model['stl_sha256']
    assert (ROOT/'parameters.json').read_bytes()==(OUT/'parameters.json').read_bytes()
    for version in ['v4','v5','v6','v7']:
        for name,digest in json.loads((ROOT/f'revisions/{version}/output_sha256.json').read_text()).items():
            if (ROOT/name).exists():assert sha(ROOT/name)==digest
    evidence=json.loads((OUT/'evidence/photo_estimates.json').read_text())
    for name,digest in evidence['source_sha256'].items():assert sha(ROOT/name)==digest
    sources=['README.txt','parameters.json','requirements.txt','build_model.py','model_v4.py','model_v6.py','model_v7.py','model_v8.py',
        'make_previews.py','previews_v5.py','previews_v8.py','prepare_slicer.py','prepare_v8.py','slice_v4.py',
        'verify_outputs.py','verify_v5.py','verify_v8.py','verify_v8_ready.py','estimate_v8.py','package_v8.py']
    files=[ROOT/n for n in sources]
    files += [ROOT/f'revisions/{v}/output_sha256.json' for v in ['v4','v5','v6','v7']]
    files += [ROOT/n for n in ['revisions/v6/source/parameters.json','output/v7/parameters.json','output/v7/left_insert_PROTOTYPE.stl',
        'output/curve-review/profiles.json','output/v7-fit-review/photo_registration.json',
        'iPhone 18 Pro on the 2021–2024 Model Y WC3 Pad_ Spacer or Crease_.md']]
    files += [p for p in OUT.rglob('*') if p.is_file() and 'isolated_config' not in p.parts and not p.name.startswith('.') and p.name!='package_manifest.json']
    files += [ROOT/n for n in evidence['source_sha256']]
    files=sorted(set(files));manifest={str(p.relative_to(ROOT)):sha(p) for p in files}
    (OUT/'package_manifest.json').write_text(json.dumps(manifest,indent=2)+'\n');files.append(OUT/'package_manifest.json')
    target=ROOT/'tesla_iphone_holder_prototype_v8.zip'
    with zipfile.ZipFile(target,'w',zipfile.ZIP_DEFLATED) as z:
        for p in files:z.write(p,p.relative_to(ROOT))
    with zipfile.ZipFile(target) as z:
        assert z.testzip() is None and len(z.namelist())==len(files)
        for name,digest in manifest.items():assert hashlib.sha256(z.read(name)).hexdigest()==digest,name
    target.with_suffix('.zip.sha256').write_text(sha(target)+'  '+target.name+'\n')
    print(json.dumps({'package':str(target),'files':len(files),'bytes':target.stat().st_size,'sha256':sha(target),'geometry':'PASS','slicing':'PASS','printer_dispatch':False},indent=2))

if __name__=='__main__':main()
