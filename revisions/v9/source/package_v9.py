"""Package checked V9 outputs, reproducible source and preserved V8 baseline."""
from pathlib import Path
import hashlib
import json
import zipfile

ROOT=Path(__file__).resolve().parent
OUT=ROOT/'output/v9'


def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()


def main():
    report=json.loads((OUT/'validation/final_verification.json').read_text())
    assert report['computational_geometry_status']=='PASS' and len(report['mesh_checks'])==2
    assert len(report['slicing'])==1 and all(s['settings_verified'] and s['model_layers']==22 and not s['warnings'] for s in report['slicing'])
    for row in report['mesh_checks']:assert sha(OUT/row['file'])==row['sha256']
    ready=json.loads((OUT/'validation/gui_ready_verification.json').read_text())
    assert ready['status']=='PASS' and len(ready['plates'])==1
    for plate in ready['plates']:
        assert plate['status']=='PASS' and plate['objects']==2 and plate['embedded_gcode_checksum_verified']
        assert sha(OUT/plate['editable_project'])==plate['editable_project_sha256']
        assert sha(OUT/plate['sliced_plate'])==plate['sliced_plate_sha256']
        for model in plate['geometry_checks']:
            assert sha(OUT/(model['name']+'.stl'))==model['stl_sha256']
    assert (ROOT/'parameters.json').read_bytes()==(OUT/'parameters.json').read_bytes()
    assert (ROOT/'README.txt').read_bytes()==(OUT/'README.txt').read_bytes()
    preserved=[]
    for version in ['v4','v5','v6','v7','v8']:
        m=ROOT/f'revisions/{version}/output_sha256.json'
        for name,digest in json.loads(m.read_text()).items():
            path=ROOT/name
            if version=='v8':assert path.exists(),name
            if path.exists():assert sha(path)==digest,(version,name)
            if version=='v8':preserved.append(path)
    p=json.loads((OUT/'parameters.json').read_text())
    for name,digest in p['v9_evidence']['photos'].items():assert sha(ROOT/name)==digest
    files=list(ROOT.glob('*.py'))+[ROOT/n for n in ['parameters.json','README.txt','requirements.txt','IMG_0201.jpeg','IMG_0202.jpeg',
        'revisions/v6/source/parameters.json','iPhone 18 Pro on the 2021–2024 Model Y WC3 Pad_ Spacer or Crease_.md']]
    files += [ROOT/f'revisions/{v}/output_sha256.json' for v in ['v4','v5','v6','v7','v8']]
    files += list((ROOT/'revisions/v8/source').glob('*'))+preserved
    files += [f for f in OUT.rglob('*') if f.is_file() and 'isolated_config' not in f.parts
              and not f.name.startswith('.') and f.name!='package_manifest.json'
              and not f.name.endswith(('.zip','.zip.sha256'))]
    files=sorted(set(files));manifest={str(f.relative_to(ROOT)):sha(f) for f in files}
    m=OUT/'package_manifest.json';m.write_text(json.dumps(manifest,indent=2)+'\n');files.append(m)
    target=OUT/'tesla_iphone_holder_prototype_v9.zip'
    with zipfile.ZipFile(target,'w',zipfile.ZIP_DEFLATED) as z:
        for f in files:z.write(f,f.relative_to(ROOT))
    with zipfile.ZipFile(target) as z:
        assert z.testzip() is None and len(z.namelist())==len(files)
        for name,digest in manifest.items():assert hashlib.sha256(z.read(name)).hexdigest()==digest,name
    target.with_suffix('.zip.sha256').write_text(sha(target)+'  '+target.name+'\n')
    print(json.dumps(dict(package=str(target),files=len(files),bytes=target.stat().st_size,
                         sha256=sha(target),geometry='PASS',slicing='PASS',printer_dispatch=False),indent=2))


if __name__=='__main__':main()
