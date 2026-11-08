TESLA MODEL Y / TWO-PIECE PHONE HOLDER — V6 CONTOUR FIT PROTOTYPE
=============================================================

V6 uses normalized shapes from the November 3 contour-gauge photographs to
refine the V5 underside and nub interiors. The confirmed dimensions remain
fixed. This is a physical fit prototype; the photos are not a registered 3D
scan. V5 source and all 32 V5 output files are preserved. No print was sent.

Start here
----------
output/v6/Holder_V6_A1_PLA_PROTOTYPE_SLICED.3mf
    Editable project saved after slicing in Bambu Studio, ready to open there.
output/v6/Holder_V6_A1_PLA_PROTOTYPE.gcode.3mf
    Native sliced plate with embedded, checksum-verified G-code and previews.
    Both complete inserts; same validated A1 settings. Not dispatched.

output/v6/Holder_V6_A1_PLA_PROTOTYPE.3mf
    Native Bambu Studio project with both full inserts on one A1 plate.
    0.4 mm nozzle, Generic PLA, 0.20 mm layers, 3 walls, 20% gyroid.
    Console side down, automatic snug supports from the build plate only,
    textured PEI plate. Open this project and Slice plate in Studio.
    The editable project contains geometry and settings, not cached G-code.

output/v6/left_insert_PROTOTYPE.stl
output/v6/right_insert_PROTOTYPE.stl
    Individual full-part meshes, millimeters, in installed coordinates.
    Matching STEP files are supplied for editing.

output/v6/holder_assembled_PROTOTYPE.step
    Both inserts in their installed relative positions.
output/v6/holder_assembled_geometry.3mf
    Generic geometry-only assembly, not the arranged A1 print project.

output/v6/slicer/Holder_V6_A1_PLA_PROTOTYPE/plate_1.gcode
    Actual Bambu CLI slice from the native project and its embedded settings.
    22 layers, 64.14 minutes, 21.61 g PLA. Model and support paths verified.
    Re-slice the native project in Studio for its normal Send/Print workflow.

output/v6/previews/
    assembly_top.png/.svg — full assembly and retained dimensions
    assembly_3d.png       — actual mesh render
    contour_changes.png  — actual V5/V6 cross-section comparisons
    contour_mapping.png  — normalized shape mappings and bounded edge relief
    nub_sections.png     — actual exported opening cross-sections
    taper_section.png    — phone seating and retained lens diagnostic
    sliced_layers.png    — actual model/support extrusion at selected layers

output/v6/parameters.json
    Complete snapshot, including photo-derived normalized tables, source hash,
    mapping decisions, dimensional caps, and assumptions.
output/v6/validation/final_verification.json
    Detailed geometry, preservation, printer-setting and layer checks.
output/v6/validation/VALIDATION.txt
    Readable verification summary.

tesla_iphone_holder_prototype_v6.zip
    Models, A1 project, previews, validation, reproducible source and photo
    evidence. The original curve-review report and all 18 photos are included.

What changed
------------
1. The left console-facing edge now has a broader curved underside transition.
   Its envelope is set back up to 3 mm from the retained upper outline and
   blends back over the first 0.9 mm of height. P2 (IMG_0164/0165) supplies the
   normalized wall curve shape. At Z=0.1 / Y=75, the actual exported edge is
   about 1.18 mm farther inward than V5. Above this transition the prior
   2 mm inward shift and 0.5 mm wall clearance remain unchanged.

2. Both leading console-side edges use a curved transition inspired by P1
   (IMG_0162/0163), capped at 1.5 mm of inward run over 0.5 mm of height.
   These are bounded prototype dimensions, not recovered console dimensions.
   The 1 mm lower-edge outer envelope is retained. As with V5 edge rounds,
   the leading tip is locally thinner; both lower rails have real model
   extrusion at Z=0.2, 0.4, 0.6, 0.8 and 1.0 mm.

3. Nub sidewalls use the mean normalized flank progression from P5
   (IMG_0171/0172). Lower and upper end walls use separate normalized slopes
   from P3 (IMG_0167/0168). Each is blended 50% with V5's smoothstep, with
   smooth endpoint easing. Sampled interior widths change by up to 0.83 mm;
   the finished top and bottom opening dimensions do not change.

4. The upper lower-left plan corner remains R15. The underside corner blends
   into the new wall/front outlines. P9's diagonal section supports a compound
   transition but cannot establish an XY radius, so no new measured radius
   is claimed. Honeycomb decreases from 20 to 15 left openings to preserve
   a solid border beside the broader underside relief. The right has none.

Retained geometry
-----------------
Coordinates: XY follows the pad; Y=0 is the factory lower crease; +Y is toward
its upper/camera end. Z is perpendicular to the pad. All dimensions are mm.

Phone: 71.1 x 150, centered at X=46.5, bottom at Y=0.
Camera housing: centered 64.5 x 41.5, lower edge Y=105, upper edge Y=146.5.
Camera opening: 65.1 x 42.1, 0.3 per-side clearance, provisional R6.3 corners,
with no extra lower relief. Nub centerlines remain X=0 and X=93.

Finished nub mouths: 13.5 underside / 5.6 upper, including all clearance.
Left opening underside Y=88.2–153.1; upper Y=90.2–151.1.
Right opening underside Y=18.35–154.37; upper Y=24.35–149.37.
Right end reductions remain 6 lower / 5 upper relative to V3's finished rim.
Left end reductions remain 2 / 2 relative to its underside ends.

Outer plane: Z=1 at Y=0 to Z=4.4 at Y=160.17, below the 4.5 hard limit.
The shorter left piece reaches Z=4.373. Phone bearing plane passes through
Z=0 at the crease and Z=4.1841 at Y=150. The first 36 mm of the phone footprint
is clear, with 0.2 seating allowance. The central 57 mm opening remains.

Photo evidence and limits
-------------------------
Nine position/profile pairs were reviewed. The horizontal 100 mm grid bar was
confirmed with a ruler. Raised gauge edges and curved paper cause parallax;
P4's paper and molded ruler scales differ by about 11% in the photograph.
The molded ruler supplied the provisional image-plane scale used in review.

V6 uses NORMALIZED curve shapes constrained to the dimensions above. It does
not promote photographed grid coordinates into exact console positions.
Capture stations, gauge angles, pin contact bands and repeatability were not
recorded. The right nub borrows the left longitudinal end shapes provisionally.
P4/P8 are cross-checks. P6/P7 are not applied dimensionally because their
registration/features are unclear. P9 does not establish a plan-view radius.

The photos suggest some real nub widths may exceed the retained opening
settings. The explicit 13.5 and 5.6 mm requests control this revision;
physical clearance remains unverified. A fit test can distinguish opening
width issues from the changed underside and end contours.

The recorded 5 mm lens projection remains. The unchanged rigid-phone / ideal
flat-pad model predicts about 0.91–2.07 mm interference across the camera
housing's length. Actual lens locations and pad compression are unknown.
This is a nonblocking prototype diagnostic, not a clearance certification.

Fit test
--------
Remove support material through the wider underside mouths. Check both parts
separately for seating and rocking, then inspect left-wall, front-edge and nub
end contact. Check camera fit and that the phone bottom reaches the crease.
Check lens contact before pressing down. Compare stationary charging with the
bare-phone baseline at the same crease position, following the supplied
research. Record any contact locations for the next iteration.

Rebuild
-------
  uv venv --python 3.12 .venv
  uv pip install --python .venv/bin/python -r requirements.txt
  .venv/bin/python build_model.py
  .venv/bin/python make_previews.py
  .venv/bin/python prepare_slicer.py
  .venv/bin/python verify_outputs.py
  .venv/bin/python package_v6.py

The snapshot already embeds every normalized curve. To regenerate that
snapshot from the captured-photo review, run model_v6.py before the build.
Bambu slicing requires the locally installed Studio app and A1 presets.
No script dispatches a print. Archived V5 source is in revisions/v5/source/.
