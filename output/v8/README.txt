TESLA IPHONE HOLDER — V8 FIT PROTOTYPE
Prepared 2026-11-04 from the existing gauge photos and installed V7 photos.

V8 reduces the oversized intermediate nub relief, follows the photographed
lower-left console turn, and rounds off the thin pointed tip. Both full inserts
and three matching fit samples are included. No printer job has been sent.
Physical fit remains untested.

PRINT-READY BAMBU A1 PLATES
Full pair: output/v8/Holder_V8_A1_PLA_PROTOTYPE.gcode.3mf
  Studio estimate: 60 min 56 sec; 20.46 g PLA.
Three samples: output/v8/Fit_tests_V8_A1_PLA.gcode.3mf
  Studio estimate: 33 min 20 sec; 10.42 g PLA.

Editable Studio-saved copies have the same names ending _SLICED.3mf.
Original native projects have the same names ending .3mf.
Use the .gcode.3mf files for the already checked sliced plates.

A1 / 0.4 mm nozzle / Generic PLA / textured PEI / 0.20 mm layers /
three walls / 20% gyroid / console side down / no brim.
Automatic normal snug supports, build plate only, 45 degree threshold,
0.20 mm top separation, 0.35 mm XY separation.
The 45 degree threshold gives the newly reduced inward overhangs support;
the old default of 30 degrees did not generate any for this profile.
Disable timelapse at dispatch. Enable bed leveling and flow calibration.
Nozzle, bed and filament must match these presets.

MODELS AND PREVIEWS
output/v8/left_insert_PROTOTYPE.stl and .step
output/v8/right_insert_PROTOTYPE.stl and .step
output/v8/holder_assembled_PROTOTYPE.step
output/v8/holder_assembled_geometry.3mf (installed assembly, not a print layout)
output/v8/fit_tests/ contains L8, R8 and C8 as individual STL and STEP files.
output/v8/previews/ contains dimensioned assembly, cross-sections, V7/V8 corner
comparison, actual sliced layers, plate thumbnails and fit-sample previews.

PHOTO ESTIMATES USED — NOT NEW DIRECT MEASUREMENTS
1. Nub width at 2 mm above the flat pad: approximately 12 mm, for both nubs.
   P5, IMG_0172, gives approximately 11.67 and 11.69 mm after local baseline
   correction. Consistent front-tip traces in N1, IMG_0183, normalized against
   the confirmed base/top widths, give approximately 11.88 and 11.33 mm.
   The rounded 12 mm estimate preserves a little allowance for image error.
   The other transverse view near the nub ends has insufficient height to
   represent the 4.4 mm middle-section measurement.
2. Left nub wide-base lower end to bottom crease: approximately 95 mm.
   IMG_0196 is registered using 16 printed honeycomb centers. Its visible lower
   console transition lies approximately 6.1 mm below the old V7 origin.
   Retaining the V7 nub footprint therefore gives 88.9 + 6.1 = 95.0 mm.
   The right lower base becomes 25.15 mm in that same new coordinate frame.
   This is a photo-based datum correction, not a fresh direct base measurement.

Photo-plane projection, raised gauge pins, fabric shading and unknown contact
heights prevent a calibrated accuracy claim. The hidden broad-base ends cannot
be located precisely from the visible crowns. The 10.3 / 14.7 mm measurements
remain SIDEWAYS wall gaps and have not been used as longitudinal crease gaps.
Evidence, traces, source hashes and limitations: evidence/photo_estimates.json.

NUB OPENINGS
Physical width anchors: 17.0 mm at Z=0 (direct), 12.0 mm at Z=2 (estimated),
7.5 mm at Z=4.4 (direct, measured above the flat pad, not the crown).
Monotone PCHIP joins these anchors. V7's much broader ellipse is replaced.
Clearance is reduced from 0.5 to 0.3 mm per side because V7 lay flat with play.
Opening widths are 17.6 / 12.6 / 8.1 mm at those three absolute pad heights.
The sloped upper rim has different widths along its length: 8.1 mm is the
4.4 mm reference width, not a constant width along the whole opening.
93 mm center spacing and the existing nub lengths are retained.
Rounded ends retain 0.7 mm axial allowance and a 2.5 mm end-cap run.
Earlier 5.6 / 13.5 mm targets are superseded by the later direct nub widths.

CONSOLE CONTOUR
A complete cubic curve follows the visible lower-left transition in IMG_0196,
with a horizontal bottom tangent. A 0.5 mm normal allowance is applied.
The old incomplete gauge trace is supporting evidence rather than an assumed
crease endpoint. The left base-to-wall gaps remain 10.3 and 14.7 mm, with the
requested 2 mm inset plus 0.5 mm wall allowance at their own stations.
The lower wall blends independently into the photographed corner.
A 1.2 mm plan round removes the pointed termination where the console turn
meets the open phone footprint. The left insert consequently terminates a
little above the crease; the phone itself can still reach Y=0.
Underside edge relief remains bounded: 3 mm side run over 0.9 mm height and
1.5 mm front run over 0.5 mm height. Console contours remain provisional.

PHONE AND CAMERA
Phone: 71.1 x 150 mm, bottom at Y=0.
Camera housing: 64.5 x 41.5 mm, centered across the phone, Y=105 to 146.5.
Camera opening: 65.1 x 42.1 mm, provisional housing radius 6 mm plus clearance.
No extra 2 mm lower camera relief. First 36 mm of phone footprint stays open.
Above that, the contact surface follows a plane from the seated phone bottom
to its upper support. The outer envelope is 1 mm at the crease to 4.4 mm at
the assembly upper edge; the hard thickness limit remains 4.5 mm.
The central opening and qualifying honeycomb are retained; lower rails solid.

Lens projection remains recorded as 5 mm. The rigid flat-pad model predicts
approximately 1.03 to 2.15 mm of interference across the camera's vertical
span. Actual lens positions and fabric compression are unmeasured. This is a
prototype diagnostic; camera housing fit is not proof of lens clearance.

VALIDATION
Five valid CAD solids and five single-component watertight meshes.
47 actual exported-mesh nub-width sections; independent end-position, wall-gap,
camera-placement, thickness, taper, overlap and phone-keepout checks.
CAD/STL volumes compared using converged CAD integration.
The corner sample is a subset of the full left insert, apart from its engraving.
The tip round leaves about 0.0046 cubic mm of disconnected numerical crumbs;
these are explicitly discarded with strict size/location guards, not exported.
Both plates have 22 model layers at 0.20 mm spacing. Supports occupy layers
0.20 through 2.40 mm and remain accessible through the wider underside mouths.
Lower-edge model extrusion is present on each layer from 0.20 through 1.00 mm.
Studio exports verified against source STL vertices, embedded settings,
G-code checksums, model paths, support bounds, object counts and plate limits.
Only Studio's traditional-timelapse warning remains; disable timelapse.
V4/V5/V6/V7 output hashes remain unchanged (36/32/35/60 files).
Original photos are unchanged; 18 source hashes are checked.

Validation reports: output/v8/validation/geometry_verification.json,
final_verification.json and gui_ready_verification.json.

PHYSICAL CHECK
L8 and R8 reproduce the full nub openings at their actual installed heights.
C8 reproduces the lower 40 mm of the left insert independently of the nub.
For the shorter test, print the three-sample plate and remove all supports.
Try each nub sample separately; check full seating, side play and removal.
Then place C8 at the lower-left corner and check gaps, contact and rocking.
The full-pair plate is also ready if a complete trial is preferred.

For the full pair, verify both parts rest flat, camera housing entry, lens
contact and that the phone bottom reaches the crease without force.
The supplied charging research favors seating at the crease, so V8 adds no
bottom spacer. Compare stationary charging with the bare-phone baseline in
the same bay, recording charging starts, drops and heat over five minutes.
If charging is unreliable, the supplied research suggests a separate bare-phone
180-degree orientation trial before adding a lift. Fit and charging are separate
results; neither is certified by this CAD validation.

REBUILD
Use the repository virtual environment with requirements.txt installed:
.venv/bin/python build_model.py
.venv/bin/python verify_outputs.py --geometry-only
.venv/bin/python make_previews.py
.venv/bin/python prepare_slicer.py

Defaults now use output/v8 and the editable root parameters.json snapshot.
model_v8.py regenerates its initial inputs from V7 plus the recorded estimates.
estimate_v8.py reproduces the photo estimates from saved traces/registration.
Export the two sliced projects through Bambu Studio after a rebuild, then run:
.venv/bin/python verify_v8_ready.py
.venv/bin/python package_v8.py

Older revisions and the V7 archive are preserved. V7 source is saved under
revisions/v7/source. The ZIP contains source, evidence, models and print files.
