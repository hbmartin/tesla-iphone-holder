"""Package and slice separate A1 plates for full V8 inserts and fit samples.

Uses an isolated slicer configuration. Never sends a printer job.
"""
from pathlib import Path
import json
import re
import zipfile
import xml.etree.ElementTree as ET
import numpy as np
import trimesh
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection
from prepare_slicer import ROOT,presets,run_project
from slice_v4 import paths
from verify_v8 import geometry


def validate_slice(out,entry,count,full):
    folder=out/'slicer'/Path(entry['project']).stem
    result=json.loads((folder/'result.json').read_text());settings=json.loads((folder/'effective_settings.json').read_text())
    assert result['return_code']==0 and len(result['sliced_plates'])==1
    plate=result['sliced_plates'][0];assert len(plate['objects'])==count
    assert not plate['warning_message'],plate['warning_message']
    expected={'printer_model':'Bambu Lab A1','nozzle_diameter':['0.4'],'filament_type':['PLA'],
        'layer_height':'0.2','wall_loops':'3','sparse_infill_density':'20%',
        'sparse_infill_pattern':'gyroid','enable_support':'1','support_type':'normal(auto)',
        'support_on_build_plate_only':'1','support_threshold_angle':'45'}
    for key,value in expected.items():assert settings[key]==value,(key,settings[key])
    with zipfile.ZipFile(out/entry['project']) as z:
        embedded=json.loads(z.read('Metadata/project_settings.config'))
        assert all(embedded[k]==v for k,v in expected.items())
        model=ET.fromstring(z.read('3D/3dmodel.model'));ns={'m':'http://schemas.microsoft.com/3dmanufacturing/core/2015/02'}
        assert model.get('unit')=='millimeter' and len(model.findall('m:build/m:item',ns))==count
    for obj in plate['objects']:
        b=obj['bbox'];assert b['x']>=0 and b['y']>=0 and b['x']+b['width']<=256 and b['y']+b['depth']<=256 and abs(b['z'])<1e-6
        path=(out if full else out/'fit_tests')/(obj['name']+'.stl')
        m=trimesh.load_mesh(path);assert np.allclose(m.extents,[b['width'],b['depth'],b['height']],atol=.0002)
    code=(folder/'plate_1.gcode').read_text();layers=[float(v) for v in re.findall(r'^; Z_HEIGHT: ([0-9.]+)',code,re.M)]
    data=paths(code);support_layers=sorted({z for z,f,_ in data if f.startswith('Support')})
    model_layers=sorted({z for z,f,_ in data if not f.startswith('Support')})
    # Automatic supports use their own layer heights between the model's
    # regular 0.20 mm planes. Count positive model extrusion separately.
    assert len(model_layers)==22 and np.allclose(model_layers,np.arange(1,23)*.2)
    assert support_layers and support_layers[0]==.2
    assert re.search(r'^; FEATURE: Support interface$',code,re.M)
    rail_counts={}
    if full:
        for layer in [.2,.4,.6,.8,1.]:
            counts=[]
            for obj in plate['objects']:
                b=obj['bbox']
                n=sum(len(v) for z,f,v in data if z==layer and not f.startswith('Support')
                    and np.any((v[:,0]>b['x']-.1)&(v[:,0]<b['x']+b['width']+.1)&(v[:,1]<b['y']+3)))
                assert n>0,(obj['name'],layer,'Missing lower-edge model extrusion');counts.append(n)
            rail_counts[str(layer)]=counts
    fig,axs=plt.subplots(1,4,figsize=(14,7),facecolor='#f5f6f3')
    bs=[o['bbox'] for o in plate['objects']]
    xmax=max(b['x']+b['width'] for b in bs)+5;ymax=max(b['y']+b['depth'] for b in bs)+5
    xmin=min(b['x'] for b in bs)-5;ymin=min(b['y'] for b in bs)-5
    for ax,z in zip(axs,[.2,1.,2.6,4.2]):
        for support,color in [(False,'#158b8b'),(True,'#b250b8')]:
            ax.add_collection(LineCollection([v for layer,f,v in data if layer==z and f.startswith('Support')==support],colors=color,linewidths=.4))
        ax.set(xlim=(xmin,xmax),ylim=(ymin,ymax),title=f'Z = {z:.1f} mm',xlabel='Plate X (mm)');ax.set_aspect('equal');ax.spines[['top','right']].set_visible(False)
    axs[0].set_ylabel('Plate Y (mm)')
    fig.suptitle('V8 / Actual sliced '+('full inserts' if full else 'fit samples'),fontsize=20)
    fig.text(.04,.035,'Teal = model · purple = removable supports · console side down · 0.20 mm layers',fontsize=10)
    fig.tight_layout(rect=(.01,.08,.99,.92));preview='sliced_full_parts.png' if full else 'sliced_fit_samples.png';fig.savefig(out/'previews'/preview,dpi=170);plt.close(fig)
    return dict(project=entry['project'],gcode=entry['gcode'],objects=count,model_layers=22,total_z_events=len(layers),
        estimated_minutes=plate['total_predication']/60,filament_grams=sum(f['total_used_g'] for f in plate['filaments']),
        settings_verified=True,warnings=plate['warning_message'],support_layers_mm=support_layers,
        lower_edge_model_extrusion_points=rail_counts,preview='previews/'+preview,
        editable_project_contains_cached_gcode=False,printer_dispatch=False)


def main(out=ROOT/'output/v8'):
    out=Path(out)
    g=json.loads((out/'validation/geometry_verification.json').read_text());assert g['computational_geometry_status']=='PASS'
    presets(out/'slicer',v4=True)
    path=out/'slicer/process.json';d=json.loads(path.read_text())
    for key in ['name','print_settings_id']:d[key]=d[key].replace('V4','V8')
    # The photo-corrected wall is less extreme than V7. Select a 45-degree
    # threshold so the lower inward overhang receives build-plate support.
    d['support_threshold_angle']='45'
    path.write_text(json.dumps(d,indent=2)+'\n')
    entries=[]
    entries.append(run_project(out,'Holder_V8_A1_PLA_PROTOTYPE',[out/f'{s}_insert_PROTOTYPE.stl' for s in ['left','right']],v4=True))
    samples=[out/'fit_tests'/f'{s}_nub_fit_V8.stl' for s in ['right','left']]+[out/'fit_tests/lower_left_corner_C8.stl']
    entries.append(run_project(out,'Fit_tests_V8_A1_PLA',samples,margin=12,v4=True))
    (out/'validation/slicer_report.json').write_text(json.dumps(entries,indent=2)+'\n')
    reports=[validate_slice(out,e,2 if i==0 else 3,i==0) for i,e in enumerate(entries)]
    g.update(slicing=reports,printer_dispatch=False)
    (out/'validation/final_verification.json').write_text(json.dumps(g,indent=2)+'\n')
    print(json.dumps({'geometry':'PASS','slice':'PASS','plates':reports},indent=2),flush=True)


if __name__=='__main__':main()
