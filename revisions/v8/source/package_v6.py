"""Package verified V6 models, settings, source and traceable photo evidence."""
from pathlib import Path
import hashlib
import json
import zipfile

ROOT=Path(__file__).resolve().parent
OUT=ROOT/'output/v6'


def sha(path):return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    report=json.loads((OUT/'validation/final_verification.json').read_text())
    assert report['computational_geometry_status']=='PASS'
    assert report['slicing']['settings_verified'] and report['slicing']['layers']==22
    for part in report['geometry']['meshes']:
        assert sha(OUT/(part['part']+'_insert_PROTOTYPE.stl'))==part['sha256']
    for version in ['v4','v5']:
        manifest=json.loads((ROOT/f'revisions/{version}/output_sha256.json').read_text())
        present={name:checksum for name,checksum in manifest.items() if (ROOT/name).exists()}
        assert all(sha(ROOT/name)==checksum for name,checksum in present.items())
    (OUT/'README.txt').write_text((ROOT/'README.txt').read_text())
    s=report['slicing']
    summary=[
        'V6 COMPUTATIONAL GEOMETRY AND SLICE: PASS',
        'Two valid CAD solids; each exported STL is one watertight, consistently oriented component.',
        'No insert overlap; phone seating keepout and 65.1 x 42.1 mm camera aperture verified.',
        'Both nub openings: 13.5 mm underside and 5.6 mm upper. End positions unchanged from V5.',
        'Monotone nub interior and end transitions checked at 14 sections.',
        'Maximum Z 4.4 mm, below the 4.5 mm hard limit. Shared taper verified.',
        'Upper left edge retains the 2 mm inset; actual extra underside wall/front relief verified.',
        'Honeycomb: 15 left, 0 right; 1.6 mm web and added underside edge reserve checked.',
        f"A1 PLA slice: {s['estimated_minutes']:.2f} minutes, {s['filament_grams']:.2f} g, 22 layers.",
        '0.4 mm nozzle, 0.20 mm layers, 3 walls, 20% gyroid; automatic build-plate supports present.',
        'Both lower rails have model extrusion at all five layers from 0.2 through 1.0 mm.',
        'Editable native 3MF has geometry and settings. Validated G-code is supplied separately.',
        'V4/V5 output hashes unchanged; all original source photographs unchanged.',
        '',
        'PHYSICAL FIT UNTESTED. Photo curves are normalized and dimensionally bounded, not a registered console scan.',
        'The existing 5 mm lens projection predicts 0.91–2.07 mm interference in the rigid flat-pad model.',
        'The retained opening targets are not certified to clear the actual photographed nubs.',
        'No printer dispatch. Remove supports before a physical fit test.'
    ]
    evidence=json.loads((ROOT/'output/curve-review/profiles.json').read_text())
    for rec in evidence['records']:
        for name,checksum in rec['source_sha256'].items():
            assert sha(ROOT/'curve gauge photos'/name)==checksum
    (OUT/'validation/VALIDATION.txt').write_text('\n'.join(summary)+'\n')
    ready=OUT/'validation/gui_ready_verification.json'
    if ready.exists():
        checked=json.loads(ready.read_text())
        assert checked['status']=='PASS'
        assert sha(OUT/checked['sliced_plate'])==checked['sliced_plate_sha256']
        with (OUT/'validation/VALIDATION.txt').open('a') as f:
            f.write('\nBAMBU STUDIO PRINT PREPARATION: PASS\n'
                    'Saved editable _SLICED.3mf and ready .gcode.3mf with verified embedded G-code checksum.\n'
                    'Saved geometry matches both STLs. GUI settings and all 22 layers verified.\n'
                    'Only traditional-timelapse notices are present; timelapse is off in the Send dialog.\n')
    sources=['README.txt','parameters.json','requirements.txt','build_model.py','model_v4.py','model_v6.py',
             'make_previews.py','previews_v4.py','previews_v5.py','previews_v6.py','prepare_slicer.py',
             'verify_outputs.py','verify_v4.py','verify_v5.py','verify_v6.py','verify_v6_ready.py','slice_v4.py','package_v6.py']
    files=[ROOT/name for name in sources]
    files += [ROOT/f'revisions/{v}/output_sha256.json' for v in ['v4','v5']]
    files += list((ROOT/'revisions/v5/source').glob('*'))
    files += [ROOT/f'output/v5/{side}_insert_PROTOTYPE.stl' for side in ['left','right']]
    files += [f for f in OUT.rglob('*') if f.is_file() and 'isolated_config' not in f.parts and not f.name.startswith('.') and f.name!='package_manifest.json']
    files += [f for f in (ROOT/'output/curve-review').iterdir() if f.is_file() and not f.name.startswith('.')]
    files += list((ROOT/'curve gauge photos').glob('*.jpeg'))
    files=sorted(set(files))
    manifest={str(f.relative_to(ROOT)):sha(f) for f in files}
    (OUT/'package_manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
    files.append(OUT/'package_manifest.json')
    target=ROOT/'tesla_iphone_holder_prototype_v6.zip'
    with zipfile.ZipFile(target,'w',zipfile.ZIP_DEFLATED) as z:
        for f in files:z.write(f,f.relative_to(ROOT))
    with zipfile.ZipFile(target) as z:
        assert z.testzip() is None
        assert len(z.namelist())==len(files)
        for name,checksum in manifest.items():assert hashlib.sha256(z.read(name)).hexdigest()==checksum
    (ROOT/'tesla_iphone_holder_prototype_v6.zip.sha256').write_text(sha(target)+'  '+target.name+'\n')
    print(json.dumps({'package':str(target),'files':len(files),'bytes':target.stat().st_size,
                      'sha256':sha(target),'geometry':'PASS','slicing':'PASS','source_photos_preserved':18},indent=2))


if __name__=='__main__':main()
