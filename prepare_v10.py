"""Package and slice one A1 plate for the single-piece V10 holder.

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
import math
import hashlib
from verify_v10 import geometry


def validate_slice(out,entry,count=1,full=True,orientation_label='outward face down, taper plane flat'):
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
        path=(out/'print')/(obj['name']+'.stl')
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
    structural=check_structural_paths(out,plate,data)
    fig,axs=plt.subplots(1,4,figsize=(14,7),facecolor='#f5f6f3')
    bs=[o['bbox'] for o in plate['objects']]
    xmax=max(b['x']+b['width'] for b in bs)+5;ymax=max(b['y']+b['depth'] for b in bs)+5
    xmin=min(b['x'] for b in bs)-5;ymin=min(b['y'] for b in bs)-5
    for ax,z in zip(axs,[.2,1.,2.6,4.2]):
        for support,color in [(False,'#158b8b'),(True,'#b250b8')]:
            ax.add_collection(LineCollection([v for layer,f,v in data if layer==z and f.startswith('Support')==support],colors=color,linewidths=.4))
        ax.set(xlim=(xmin,xmax),ylim=(ymin,ymax),title=f'Z = {z:.1f} mm',xlabel='Plate X (mm)');ax.set_aspect('equal');ax.spines[['top','right']].set_visible(False)
    axs[0].set_ylabel('Plate Y (mm)')
    fig.suptitle('V10 / Actual sliced single-piece holder',fontsize=20)
    fig.text(.04,.035,f'Teal = model · purple = removable supports · {orientation_label} · 0.20 mm layers',fontsize=10)
    fig.tight_layout(rect=(.01,.08,.99,.92));preview='sliced_full_parts.png' if full else 'sliced_fit_samples.png';fig.savefig(out/'previews'/preview,dpi=170);plt.close(fig)
    return dict(project=entry['project'],gcode=entry['gcode'],objects=count,model_layers=22,total_z_events=len(layers),
        estimated_minutes=plate['total_predication']/60,filament_grams=sum(f['total_used_g'] for f in plate['filaments']),
        settings_verified=True,warnings=plate['warning_message'],support_layers_mm=support_layers,
        print_leading_edge_extrusion_points=rail_counts,structural_path_checks=structural,preview='previews/'+preview,
        editable_project_contains_cached_gcode=False,printer_dispatch=False)


NAME='Holder_V10_A1_PLA_OUTWARD_FACE_DOWN'


def check_structural_paths(out,plate,data):
    # A rigid X rotation reverses Y. Installed lower edges are at the
    # PRINT trailing end; measure each leg separately at its actual end.
    mesh=trimesh.load_mesh(out/'print/holder_single_PROTOTYPE.stl')
    orient=json.loads((out/'validation/orientation.json').read_text())
    transform=np.array(orient['parts'][0]['rigid_transform'])
    b=plate['objects'][0]['bbox'];split=46.5+transform[0,3]
    rows={}
    for side,mask in [('left',mesh.vertices[:,0]<split),('right',mesh.vertices[:,0]>split)]:
        ymax=float(mesh.vertices[mask,1].max())+b['y']
        rows[side]={}
        for height in [.2,.4,.6,.8,1.]:
            count=0
            for z,feature,line in data:
                if z!=height or feature.startswith('Support'):continue
                mx=line[:,0]<b['x']+split if side=='left' else line[:,0]>b['x']+split
                count+=int(np.sum(mx & (line[:,1]>ymax-3)))
            assert count>0,(side,height,'missing thin lower edge')
            rows[side][str(height)]=count
    # First layer contains bridge ribs joining the two legs. Count real
    # horizontal extrusion crossings at five central bridge stations.
    bridge={}
    for worldx in [20,30,46.5,65,73]:
        platex=worldx+transform[0,3]+b['x'];n=0
        for z,feature,line in data:
            if z!=.2 or feature.startswith('Support'):continue
            for a,c in zip(line[:-1],line[1:]):
                if min(a[0],c[0])<=platex<max(a[0],c[0]) and max(a[1],c[1])<b['y']+20:n+=1
        assert n>=2,(worldx,n,'bridge first-layer continuity')
        bridge[str(worldx)]=n
    return dict(installed_lower_edges=rows,bridge_first_layer_crossings=bridge)


def main(out=ROOT/'output/v10',presets_only=False):
    out=Path(out);base=ROOT/'output/v9/outward_face_down'
    p=json.loads((out/'parameters.json').read_text())
    for folder in [out/'print',out/'slicer',out/'validation',out/'previews']:folder.mkdir(parents=True,exist_ok=True)
    for name in ['machine','process','filament']:
        settings=json.loads((base/f'slicer/{name}.json').read_text())
        if name=='process':
            for k in ['name','print_settings_id']:settings[k]=settings[k].replace('V9','V10')
        (out/f'slicer/{name}.json').write_text(json.dumps(settings,indent=2)+'\n')
    if presets_only:return
    g=json.loads((out/'validation/geometry_verification.json').read_text())
    assert g['computational_geometry_status']=='PASS'
    angle=math.pi-math.atan(p['outer_top_slope'])
    rotation=trimesh.transformations.rotation_matrix(angle,[1,0,0])
    assert np.isclose(np.linalg.det(rotation[:3,:3]),1)
    normal=np.array([0,-p['outer_top_slope'],1]);normal/=np.linalg.norm(normal)
    assert np.allclose(rotation[:3,:3]@normal,[0,0,-1])
    original=out/'holder_single_PROTOTYPE.stl';m=trimesh.load_mesh(original);oldvolume=m.volume
    m.apply_transform(rotation);translation=-m.bounds[0];m.apply_translation(translation)
    transform=rotation.copy();transform[:3,3]+=translation
    target=out/'print'/original.name;m.export(target);exported=trimesh.load_mesh(target)
    assert exported.is_watertight and len(exported.split())==1
    assert abs(exported.volume-oldvolume)/oldvolume<1e-5
    contact=np.max(exported.triangles[:,:,2],axis=1)<.002
    area=float(exported.area_faces[contact].sum());assert area>6000
    cv=exported.triangles[contact].reshape(-1,3)
    assert np.ptp(cv[:,1])>.9*exported.extents[1] and np.ptp(cv[:,0])>.9*exported.extents[0]
    sha=lambda path:hashlib.sha256(path.read_bytes()).hexdigest()
    row=dict(part='single_piece_holder',source=original.name,source_sha256=sha(original),
        print_mesh='print/'+target.name,print_mesh_sha256=sha(target),rigid_transform=transform.tolist(),
        outward_plane_normal_after_rotation=(rotation[:3,:3]@normal).tolist(),
        bed_contact_area_mm2=area,print_bounds_mm=exported.bounds.tolist(),
        volume_change_percent=float((exported.volume-oldvolume)/oldvolume*100))
    orientation=dict(status='PASS',orientation='Outward/phone-facing taper plane down, laid flat on the plate',
        rotation_x_degrees=math.degrees(angle),source_geometry_unchanged=True,parts=[row],printer_dispatch=False)
    (out/'validation/orientation.json').write_text(json.dumps(orientation,indent=2)+'\n')
    entry=run_project(out,NAME,[target],v4=True)
    for place in entry['placements']:place['print_orientation']=orientation['orientation']
    (out/'validation/slicer_report.json').write_text(json.dumps([entry],indent=2)+'\n')
    sliced=validate_slice(out,entry)
    (out/'validation/slice_verification.json').write_text(json.dumps(sliced,indent=2)+'\n')
    g.update(slicing=[sliced],printer_dispatch=False)
    (out/'validation/final_verification.json').write_text(json.dumps(g,indent=2)+'\n')
    print(json.dumps(dict(geometry='PASS',slice='PASS',orientation=orientation['orientation'],
        angle=math.degrees(angle),contact_area_mm2=area,minutes=sliced['estimated_minutes'],grams=sliced['filament_grams']),indent=2))


if __name__=='__main__':main()
