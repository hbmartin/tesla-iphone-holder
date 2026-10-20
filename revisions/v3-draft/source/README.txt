TESLA MODEL Y / TWO-PIECE PHONE HOLDER — V3 DRAFT
================================================

Status
------
V2 was physically printed and did not seat over the console nubs. V3 corrects
nub lengths, adds a width taper, extends the R part to the lower console ledge,
and adds the L wall-following edge. No V3 print has been sent.

The V3 assembly is a DRAFT until the distance from the lower ledge to the
bottom end of each nub is confirmed. Current Y centers are retained from V2
only as temporary placeholders. This does not invalidate the independent
full-length nub gauges, but it does prevent claiming the assembled fit.

Latest measurements (all CAD units are millimeters)
-------------------------------------------------
L nub base length: 2.5 in = 63.50 mm.
R nub base length: 5.3 in = 134.62 mm.
Both nub bases: approximately 18 mm wide.
Both nubs at the 5.4 mm support plane: 6 mm wide.
Clear gap between nub bases: 75 mm; center spacing: 93 mm.
Camera housing lower edge: 103.5 mm above the console lower ledge along pad.
L wall gap at lower nub end: 9 mm; at upper nub end: 14 mm.
The user confirmed these are clear gaps from the nearest nub base edge to the wall.

Phone measurements retained from the previous revision:
Width 72.1; main body thickness 8.8; body+housing 11.7;
body+housing+lenses 13.8. Phone length 150 mm remains scan-supported.
Housing projects 2.9 mm and lens tips project 5.0 mm from the main phone back.
Support thickness remains 5.4 mm (0.4 mm nominal lens/pad gap).

Coordinates and fit
-------------------
XY follows the sloped console surface, not the world-horizontal plane.
Y=0 is the lower console ledge. Positive Y points toward the camera end.
X=0 is the L nub centerline; the R centerline is X=93 mm.
Z=0 is the console surface; Z=5.4 mm is the phone support surface.

Draft-only Y positions: L center 122.5, R center 103.5.
Thus the temporary lower ends are L 90.75, R 36.19 mm above the ledge.
These values are NOT new measurements. Replace the centers with measured
nub-bottom distance + half of the corresponding base length.

The R outline extends to Y=0, making the ledge its lower stop. The L outer
edge follows a line through the two wall-gap references with 0.5 mm nominal
wall clearance. The unmeasured lower corner remains relieved. Wall curvature
and the nub side profile still require physical fit tests.

Slots use 0.5 mm clearance per side: nominal 19 mm base width and 7 mm upper
width. Rounded nub sides are approximated by a linear taper over 5.4 mm.
The top end lengths were not measured, so each slot retains the full base
length at the top. Independent end-inset parameters can adjust this later.
0.2 mm lead-ins increase the openings at the exposed faces slightly.

The camera housing lower edge has its own parameter, camera_bottom_y=103.5.
The nominal 44 mm housing length remains scan-estimated. A separately named
2 mm lower blending relief is retained to clear the low transition seen in
the scan; it does not change the measured housing reference. With 0.5 mm
clearance, the through opening spans Y=101 to 148 mm and is 66.5 mm wide.

The central charging opening remains unobstructed. The new shape must still
be checked for repeated phone placement and a 10-minute stationary charging
comparison against the bare-phone baseline. PLA is a fit prototype; sustained
cabin heat suitability has not been established.

Files
-----
parameters.json                 Editable measured and provisional parameters.
build_model.py                  Parametric CadQuery model and STL/STEP exports.
make_previews.py                 Renders actual exported parts and fit diagrams.
prepare_slicer.py                Builds native Bambu 3MF projects and slices them.
verify_outputs.py               Checks meshes, scan samples, settings and G-code.
analyze_scan.py                  Original phone scan calibration (V2 analysis).

output/v3/left_insert_PROTOTYPE.stl
output/v3/right_insert_PROTOTYPE.stl
output/v3/holder_assembled_PROTOTYPE.step
output/v3/Holder_V3_DRAFT_A1_PLA.3mf
output/v3/Fit_tests_V3_A1_PLA.3mf
output/v3/previews/assembly_top.png
output/v3/previews/assembly_3d.png
output/v3/previews/taper_section.png
output/v3/previews/fit_gauges.png
output/v3/validation/final_verification.json

STL and STEP inserts use their installed coordinates. The Bambu project
orients both inserts PHONE FACE DOWN: the narrow slot mouths touch the bed,
and the openings widen upward while printing. This avoids unsupported taper
ledges. Full-length nub gauges use the same orientation; their embossed
labels are placed on the pad side so the main face lies flat on the bed.
Camera rings print label-side up. Use the project to preserve these choices.

Fit gauges
----------
3L03 / 3L05 / 3L08: full 63.5 mm L nub length and full taper height.
3R03 / 3R05 / 3R08: full 134.62 mm R nub length and full taper height.
3C03 / 3C05 / 3C08: camera envelope only, 2.4 mm body thickness.
03 / 05 / 08 mean 0.3 / 0.5 / 0.8 mm clearance per side.
The nub STL names retain 'U_gauge' for compatibility but V3 parts are complete
full-length collars. They test both rounded ends and the entire tapered slot.

Printing and validation
-----------------------
Bambu A1, 0.4 mm nozzle, Generic PLA, 0.20 mm layers, 3 walls, 4 top/bottom
layers (top minimum thickness may add a layer), 20% gyroid, no supports/brim.
Textured PEI is the project default. No printer is contacted by build scripts.

Computational checks establish CAD validity, one watertight mesh per part,
CAD/STL volume agreement, no overlapping insert solids, nominal tapered nub
clearance, honeycomb borders/webs, scanned camera sample clearance, object
placement, embedded settings and real G-code without supports/repair warnings.
They do not validate the provisional nub Y positions or guarantee physical fit.

Rebuild
-------
.venv/bin/python build_model.py
.venv/bin/python make_previews.py
.venv/bin/python prepare_slicer.py
.venv/bin/python verify_outputs.py

V1 and V2 exports remain in output/ and output/v2/. V2 source is preserved in
revisions/v2/source/. The original scan and photographs are unchanged.
The aligned scan archive is reused for checks; rerunning analyze_scan.py is
not needed to rebuild the V3 holder. That script retains its V2 analysis path.
