TESLA IPHONE HOLDER — V7 FIT PROTOTYPE
4 November 2026

Complete inserts and independent fit samples are ready. V6 is preserved.
The new models use the user-confirmed 17 mm nub base and 7.5 mm width at
4.4 mm above the flat pad. This is not a measurement at the nub crown.

FILES TO OPEN
output/v7/Holder_V7_A1_PLA_PROTOTYPE.gcode.3mf
    Two complete inserts on one Bambu A1 plate.
    Estimated 50.5 minutes / 17.08 g PLA.
output/v7/Fit_tests_V7_A1_PLA.gcode.3mf
    All six nub clearance collars and the independent corner sample.
    Estimated 56.9 minutes / 21.59 g PLA.

Both are print-ready sliced plates exported from Bambu Studio 2.8.2.61.
Editable copies are Holder_V7_A1_PLA_PROTOTYPE_SLICED.3mf and
Fit_tests_V7_A1_PLA_SLICED.3mf in output/v7. The original .3mf projects remain.
The fit-test project is currently open in Studio's Preview with Print Plate
available. No printer job was dispatched.

Print the fit samples first. In Print Plate, select the A1 and the loaded
PLA spool; enable bed leveling and flow calibration, and leave timelapse
OFF. Studio reports only a traditional-timelapse compatibility notice.
Once the plate has cooled, remove all supports and test L5, R5 and C7
separately. Use L3/R3 or L7/R7 to compare tighter/looser clearances.

Individual full models:
output/v7/left_insert_PROTOTYPE.stl / .step
output/v7/right_insert_PROTOTYPE.stl / .step
output/v7/holder_assembled_PROTOTYPE.step
output/v7/holder_assembled_geometry.3mf  (geometry-only assembly)

Individual fit samples: output/v7/fit_tests/ (STL and STEP for all seven).
Dimensioned previews: output/v7/previews/.
Complete measured inputs and assumptions: output/v7/parameters.json.
Geometry and slice checks: output/v7/validation/final_verification.json.
Studio export checks: output/v7/validation/gui_ready_verification.json.
New paired photo review: output/new-curve-review/review.html.

WHAT CHANGED
1. Nub width follows actual height Z above the pad, not a fraction of the
   local tapered insert thickness. Selected clearance is 0.5 mm per side:
   18.0 mm opening at Z=0; 8.5 mm at Z=4.4. Lower parts of the sloping rim
   remain wider. At Y=120 the outer rim is about 3.55 mm
   above the pad, and the opening there is about 12.74 mm wide.

   The two measured anchors define a rounded elliptical transverse envelope.
   Intermediate widths are an interpolation, not additional measurements.
   This envelope is wider than a straight-line interpolation between anchors.
   Printed fit determines whether this interpolation and clearance are suitable.

2. Both opening ends are rounded elliptic caps. The full established base
   length plus 0.7 mm at each end stays clear through the entire height.
   The old 2/2 mm left and 6/5 mm right end reductions are removed. This gives
   deliberate end relief while resolving the confirmed side binding. Separate
   longitudinal captures are preserved; neither is copied onto the other nub
   or promoted to an exact end position without a marked baseline.

3. The measured left wall gaps are 10.3 mm at the lower short-nub station and
   14.7 mm at its upper station, from the wide base flank to the inside wall.
   With a symmetric 17 mm nub at X=0 these correspond to X=-18.8 and -23.2.
   The requested 2 mm inward inset and 0.5 mm wall allowance remain.
   Centerlines remain X=0 and X=93. No new center-spacing measurement was
   supplied; the side gaps do not change the nub's Y positions. Derived clear
   gap between the two 17 mm bases is 76 mm.

4. The lower-left outline uses N4 (IMG_0188/0189), replacing the guessed R15.
   It has approximately 31.8 mm of corner run
   and 21.2 mm inward turn.
   A smooth convex fit removes the gauge-pin steps without rescaling those
   extents. Its RMS residual to the traced photo is
   0.33 mm; this is not a
   calibrated physical accuracy claim. The largest checked inward correction
   relative to V6 is 9.65 mm.

   The lowest captured corner point is provisionally aligned to Y=0. The
   capture does not independently establish its exact installed origin or
   contact height. Bounded rounded underside relief remains: up to 3 mm
   side setback over 0.9 mm height, and 1.5 mm front setback over 0.5 mm.
   N5's uncertain section and border step are retained as evidence rather
   than treated as an exact 3D underside. Test C7 independently.

RETAINED CONSTRAINTS
Phone 71.1 x 150 mm, bottom at the console crease. First 36 mm of its
footprint clear of print; bearing plane rises from the seated bottom.
Camera housing centered, 64.5 x 41.5 mm, Y=105 to146.5.
Camera opening 65.1 x42.1 mm, with 0.3 mm per-side allowance and no extra
lower relief. Provisional housing corner radius remains 6 mm.
Outer thickness envelope: 1 mm at lower edge to 4.4 mm at upper assembly edge.
Hard maximum 4.5 mm. Rounded tips are locally thinner than the 1 mm envelope.
Separate pieces, central opening, solid lower 36 mm, safe honeycomb retained.

FIT SAMPLE LABELS AND USE
L3 / R3: 0.3 mm clearance per side; base opening 17.6; at Z=4.4 opening 8.1.
L5 / R5: 0.5 mm per side; base 18.0; at Z=4.4 opening 8.5. Matches full parts.
L7 / R7: 0.7 mm per side; base 18.4; at Z=4.4 opening 8.9.
C7: the actual lower 40 mm of the left insert, separated from the nub.
Labels are recessed near the upper bridge. L=short left; R=long right.
The collars reproduce each nub's installed slope and height; do not reverse
which end is toward the crease. The wider/thinner end goes toward the crease.

Remove supports and loose residue before testing. Start with L5 and R5
separately, then compare 3/7 if needed. Record whether each seats freely,
rocks, or has lateral play, and which part first contacts. Test C7 at the
lower-left corner without either nub constraining it. Its lower end aligns
with the crease; the cut upper edge is at Y=40. The historical short-nub
base lower end is at Y=88.9 and long-nub lower end at Y=19.05.

These samples distinguish nub binding from corner interference. A successful
sample fit should precede the complete holder test. The full holder files are
also supplied, using the 0.5 mm clearance choice.

PRINT SETTINGS AND VALIDATION
Bambu A1, 0.4 nozzle, Generic PLA, 0.20 mm model layers, three walls,
20% gyroid, textured PEI, console side down, automatic snug supports from
build plate only. Support interfaces have 0.2 mm Z and 0.35 mm XY separation.
CLI slicing returned no warnings. GUI exports report only the traditional
timelapse compatibility notice; disable timelapse at dispatch.
There are 22 model layers and
32 Z events because automatic supports use additional intermediate heights.
Support material can be accessed from the 18 mm underside openings and
open central slot. Remove it before evaluating the fit.

Nine CAD/STL models are each one valid, watertight, consistently oriented
solid. Adaptive CAD-volume integration and fine tessellation agree within
0.0017%.
Fifty actual mesh section widths, wall positions, camera opening, phone
keepout, absence of overlap, taper and maximum thickness were verified.
Both full-part lower edges contain model extrusion through all five layers
from Z=0.2 through 1.0 mm. All 14 new source photographs retain their hashes.
V4/V5/V6 output hashes remain unchanged (36/32/35 files respectively).

The saved Studio projects match all nine source STL meshes within 0.0001 mm
at their plate placements, with no mesh repairs. Embedded settings and
exported G-code checksums pass. Positive-extrusion model paths match the
CLI baseline within the 0.1 mm sampling allowance on every model layer;
support bounds match within 0.01 mm per object and height. Support infill
traversal can differ between GUI and CLI slicing. The thin lower edges
were checked again in the GUI-exported G-code through Z=1.0 mm.

REMAINING PHYSICAL CHECKS
Physical console fit is untested. Width interpolation, corner registration,
end shape, fabric compression and printer dimensional error remain fit-test
variables. Exact nub center spacing has not been remeasured.
The existing 5 mm lens projection predicts approximately 0.91–2.07 mm
interference in the rigid-phone / flat-pad model. Lens clearance is not
certified and was not changed by the console-fit correction. Check seating,
rocking, camera fit, lens contact and crease reach before a stationary
charging comparison against the bare-phone baseline.

REBUILD
.venv/bin/python build_model.py
.venv/bin/python verify_outputs.py --geometry-only
.venv/bin/python make_previews.py
.venv/bin/python prepare_slicer.py
.venv/bin/python verify_v7_ready.py
.venv/bin/python package_v7.py

After rebuilding or changing a model, re-slice and export both projects in
Studio before running verify_v7_ready.py. It verifies existing GUI exports.

The default output directory is now output/v7. parameters.json is the editable
V7 parameter snapshot. model_v7.py can regenerate its initial inputs from the
confirmed measurements. V6 source is archived in revisions/v6/source.
