TESLA IPHONE HOLDER — V9 FIT PROTOTYPE
Prepared 2026-11-05 from the user-approved V9 adjustments and IMG_0201/0202.

V9 shifts only the left nub opening 0.5 mm toward the console wall. The right
opening is 0.2 mm narrower and 0.4 mm shorter, with ALL shortening at the upper
end. Its lower endpoint stays fixed. V8 exterior contours are preserved.
Physical fit remains untested. No printer job has been sent.

PRINT-READY BAMBU A1 PLATE
output/v9/Holder_V9_A1_PLA_PROTOTYPE.gcode.3mf — both full inserts.
Editable Studio copy: Holder_V9_A1_PLA_PROTOTYPE_SLICED.3mf.
Original native project: Holder_V9_A1_PLA_PROTOTYPE.3mf.
Use the .gcode.3mf for the verified sliced plate.
Studio estimate: 61 min 6 sec; 20.55 g PLA.
Details: validation/gui_ready_verification.json.

A1 / 0.4 mm nozzle / Generic PLA / textured PEI / 0.20 mm layers /
three walls / 20% gyroid / console side down / no brim.
Normal automatic snug supports, build plate only, 45 degree threshold,
0.20 mm top separation, 0.35 mm XY separation.
Disable timelapse at dispatch. Enable bed leveling and flow calibration.

GEOMETRY CHANGES (installed coordinates, mm)
                          V8 left   V9 left   V8 right   V9 right
Opening center X             0.0      -0.5       93.0       93.0
Side clearance               0.3       0.3        0.3        0.2
Lower-end clearance          0.7       0.7        0.7        0.7
Upper-end clearance          0.7       0.7        0.7        0.3
Opening lower Y             94.3      94.3      24.45      24.45
Opening upper Y            159.2     159.2     160.47     160.07
Overall opening length      64.9      64.9     136.02     135.62

Changes apply throughout the complete cutout thickness. Rounded ends retain
the 2.5 mm axial run. The right opening remains horizontally centered; its
longitudinal midpoint moves down 0.2 mm because the lower endpoint is fixed.

Widths at absolute heights above the flat pad:
Z = 0 / 2 / 4.4 mm: left 17.6 / 12.6 / 8.1; right 17.4 / 12.4 / 7.9 mm.
The actual sloped top rim has different widths along its length. The 8.1/7.9 mm
values describe the 4.4 mm reference section, not the whole top opening.

The new independent controls are left/right_opening_x_offset,
left/right_opening_side_clearance, left/right_opening_lower_clearance and
left/right_opening_upper_clearance. They do not move the exterior datums.
Legacy nub_fit_clearance/nub_end_clearance remain only for V8 baseline geometry;
the V9 cutouts use the independent per-piece fields. The older nub_clearance
field controls exterior/collar construction and is not a V9 fit adjustment.

RETAINED GEOMETRY AND EVIDENCE
The entire V8 exterior, lower-left corner, underside relief, camera aperture,
phone seating and honeycomb locations are retained. The reference nub-center
pitch stays 93 mm; the corrected opening-center spacing becomes 93.5 mm.
Thickness tapers from 1 mm at the lower crease to 4.4 mm at the upper assembly
edge. The hard limit is 4.5 mm. Phone: 71.1 x 150 mm, seated at the crease.
Camera housing: 64.5 x 41.5 mm centered across the phone, Y=105 to146.5.
Camera aperture: 65.1 x 42.1 mm, provisional 6 mm housing corner radius plus
0.3 mm allowance. The first 36 mm of the phone footprint stays clear.

The physical nub profile remains 17 mm at Z=0 and 7.5 mm at Z=4.4 (direct
measurements), with a 12 mm photo estimate at Z=2, joined by monotone PCHIP.
The V8 crease/corner estimates and their limitations remain in the parameter
snapshot. Current photographs corroborate the direction of adjustment; the
0.5 / 0.2 / 0.4 mm corrections are approved trial values, not photo measurements.

Lens projection remains recorded as 5 mm. The rigid flat-pad diagnostic still
predicts approximately 1.03 to 2.15 mm of lens/pad interference. Lens positions
and fabric compression are unmeasured; physical lens clearance is unverified.

FILES
Complete package: output/v9/tesla_iphone_holder_prototype_v9.zip.
Individual left_insert_PROTOTYPE and right_insert_PROTOTYPE: STL and STEP.
holder_assembled_PROTOTYPE.step: installed assembly.
holder_assembled_geometry.3mf: installed geometry, NOT a print-plate layout.
previews/: assembly, 3D view, dimensioned V8/V9 cutout comparison, actual
cross-sections, sliced layers and the ready-plate thumbnail.
evidence/fit_adjustments.json: accepted corrections and source-photo hashes.
parameters.json: complete editable snapshot.
validation/: geometry, slicing, Studio-export checks and settings.

VALIDATION
Two valid CAD solids and two single-component watertight meshes.
79 actual exported-mesh width/center checks and 34 endpoint checks.
The lower right endpoint is unchanged and the upper endpoint moves down 0.4 mm.
Whole-solid Boolean comparison confines every change to the old/new cutout
regions, preserving exterior, camera, honeycomb and phone seating geometry.
Minimum sampled nub-side rail: 2.051 mm; honeycomb webs and borders retain
1.6 / 2.4 mm requirements. No overlap; maximum installed height remains 4.4 mm.
CAD/STL volumes are compared using converged mass integration. The existing
V8 corner-round cleanup discards only guarded micron-scale disconnected tips.
The complete slice and Studio export passed: 22 model layers, supports at
0.20–2.40 mm, and lower-edge extrusion on every layer through 1.00 mm.
The slice and Studio export checks cover object geometry,
settings, G-code checksum, layer coverage, supports, lower edges and bed limits.
V8 source is archived under revisions/v8/source. V8 output and ZIP hashes,
plus earlier available revision outputs, are preserved and checked.

PHYSICAL FIT CHECK
Remove all supports. Test both full inserts; the full left part is necessary
to judge opening alignment relative to the console wall. Check flat seating,
sideways play, end play and easy removal without forcing. Check the phone can
reach the crease, camera housing fit and lens contact before assessing charging.
Follow the supplied research: keep the phone seated in the crease, then compare
stationary charging with the bare-phone baseline in the same bay. Physical fit,
lens clearance and charging remain separate checks.

REBUILD
.venv/bin/python build_model.py
.venv/bin/python verify_outputs.py --geometry-only
.venv/bin/python make_previews.py
.venv/bin/python prepare_slicer.py
Open the native V9 project in Bambu Studio, slice, save as the _SLICED.3mf copy,
then export the sliced plate as .gcode.3mf. Finish with:
.venv/bin/python verify_v9_ready.py
.venv/bin/python package_v9.py

Defaults use output/v9 and the root parameters.json. model_v9.py can regenerate
initial V9 parameters from the preserved V8 snapshot. Printing is a separate
action and has not been dispatched by this build.
