TESLA IPHONE HOLDER — V10 SINGLE-PIECE FIT PROTOTYPE
Prepared 2026-11-05 from IMG_0203/0204 and the confirmed additional 0.5 mm shift.

V10 moves the complete left nub cutout another 0.5 mm toward the console wall
and joins both inserts with a hex-perforated bridge above the camera opening.
It is now one continuous, watertight solid. The right opening is unchanged.
Physical simultaneous engagement on both nubs remains untested.
No V10 printer job has been sent.

PRINT-READY BAMBU A1 PLATE
output/v10/Holder_V10_A1_PLA_OUTWARD_FACE_DOWN.gcode.3mf
Editable Studio copy: Holder_V10_A1_PLA_OUTWARD_FACE_DOWN_SLICED.3mf.
Original native project: Holder_V10_A1_PLA_OUTWARD_FACE_DOWN.3mf.
Studio estimate: 1 hr 3 min 5 sec; 22.84 g PLA, including supports.
One full holder on one plate. Studio 02.09.01.70.

The outward/phone-facing main taper plane prints FACE DOWN, leveled against
textured PEI by a rigid 178.82854 degree X rotation, with no mirroring.
The console side and wider underside nub openings face upward.
The installed-coordinate STL/STEP are separate from the oriented print mesh
in print/holder_single_PROTOTYPE.stl. Use the Bambu project to retain placement.

A1 / 0.4 mm nozzle / Generic PLA / 0.20 mm layers / three walls / 20% gyroid.
Normal automatic snug supports, build plate only, 45 degree threshold,
0.20 mm top separation, 0.35 mm XY separation, no brim.
Supports occur at print Z=0.2, 0.4 and 0.6 mm under recessed contact regions;
they are accessible from the open center. Nub walls open upward in this
orientation and the added bridge itself starts directly on the plate.
Disable timelapse at dispatch. Enable bed leveling and flow calibration.

GEOMETRY CHANGES (installed coordinates, mm)
Left opening center X: V8 0.0 -> V9 -0.5 -> V10 -1.0.
The additional 0.5 mm is a user-confirmed fit-test correction, not a precise
measurement inferred from the photograph. The full cutout moves through its
thickness; widths, length and rounded ends remain unchanged.

                             V10 left      V10 right
Opening center X                -1.0           93.0
Side clearance                   0.3            0.2
Lower-end clearance              0.7            0.7
Upper-end clearance              0.7            0.3
Opening lower Y                 94.3          24.45
Opening upper Y                159.2         160.07
Overall opening length          64.9         135.62
Widths at Z=0 / 2 / 4.4    17.6/12.6/8.1    17.4/12.4/7.9

The curved width profile uses the existing 17 mm and 7.5 mm nub measurements
at Z=0 and Z=4.4, with the photo-estimated 12 mm intermediate width at Z=2.
Rounded ends retain their 2.5 mm axial run. Reference section widths at Z=4.4
are not a claim of constant width along the sloped top rim.

The bridge's construction region spans X=10..83, Y=140.5..165, clipped by the
existing camera clearance. Its central band is 18.2 mm high above Y=146.8.
Nine full through-hexagons, 6 mm flat-to-flat, use the existing 1.6 mm web.
Centers span X=16.1..76.9 at Y=155.9, on 7.6 mm pitch. Minimum border within
the bridge construction profile is 3.1 mm. Solid end attachments merge into
both inserts. The bridge follows the existing thickness taper and camera
corner radius. It does not extend the previous overall assembly envelope.

RETAINED FIT
Right cutout, exterior contours, lower-left corner, original honeycomb,
phone seating and camera keepout are retained. Thickness stays at or below
4.4 mm, under the 4.5 mm hard limit, on the existing 1-to-4.4 mm taper.
Phone: 71.1 x 150 mm, bottom at the crease. Camera housing: 64.5 x 41.5 mm,
centered across the phone, lower edge at Y=105 and upper edge at Y=146.5.
Camera clearance: 65.1 x 42.1 mm, 0.3 mm per side, rounded radius 6.3 mm.
The phone footprint is clear for its first 36 mm above the crease; the
existing tilted contact relief above that is preserved, including on the bridge.

The corrected opening centers are now 94.0 mm apart. Joining the inserts
fixes their relative positions; both openings must seat at once in the car.
The photographed console contours and intermediate nub section remain
provisional. V10 is a fit prototype, not a verified final fit.
Lens projection remains 5 mm. The rigid flat-pad diagnostic still predicts
1.03 to 2.15 mm lens/pad interference. Exact lens positions and fabric
compression are unmeasured; physical lens clearance remains unverified.

DELIVERABLES IN output/v10
holder_single_PROTOTYPE.stl and .step — one holder, installed coordinates.
holder_single_geometry.3mf — geometry only, not a print-plate layout.
print/holder_single_PROTOTYPE.stl — rigidly oriented for outward-face-down print.
Holder_V10_A1_PLA_OUTWARD_FACE_DOWN*.3mf — editable and sliced Bambu projects.
previews/ — dimensioned assembly, bridge/shift comparison, actual 3D mesh,
sliced layer previews and Studio plate thumbnail.
parameters.json — complete parameter snapshot.
evidence/fit_adjustments.json — accepted correction and source-photo hashes.
validation/ — CAD/mesh, measured sections, orientation, slicing and export checks.
validation/bridge_region.step is a diagnostic construction solid; do not print it.
tesla_iphone_holder_prototype_v10.zip — complete package, source and V9 baseline.

VERIFICATION
One valid CAD solid, one watertight connected STL, converged CAD/STL volume
comparison, maximum installed height 4.4 mm, and unchanged total bounds.
79 exported opening width/center checks and 34 endpoint checks.
All nine bridge hexagons measured from exported mesh. Attachment cross-sections
verified at both ends. Minimum sampled nub-side rail is 2.051 mm.
Whole-solid Boolean differences are confined to the left cutout and bridge.
Camera and phone-seating keepout intersections are empty.
22 actual model layers from Z=0.2 to4.4 mm. Both thin lower edges contain
model extrusion through Z=1.0. Bridge ribs cross five sampled stations on
layer one. Bed contact area is approximately 6941 mm2.
Studio editable geometry matches the oriented STL; no mesh repairs reported.
Exported G-code checksum, printer/settings, model path coverage, supports,
bed limits, thin edges and bridge paths passed independent checks.
The only Studio warning concerns traditional timelapse; disable it for printing.
V9 source is archived at revisions/v9/source. All 57 recorded V9 outputs and
available earlier revision outputs retain their recorded SHA-256 hashes.

PHYSICAL FIT CHECK
Remove all supports. Seat both nub openings together without forcing.
Check flat seating, left alignment at the wall, sideways/end play and easy
removal. Check the bridge above the camera housing, phone-bottom seating at
the crease, rocking and lens contact. Then compare stationary charging with
the bare-phone baseline in the same bay, following the supplied positioning
research. Physical fit, lens clearance and charging remain separate checks.

REBUILD
.venv/bin/python build_model.py
.venv/bin/python verify_outputs.py --geometry-only
.venv/bin/python make_previews.py
.venv/bin/python prepare_slicer.py
Open Holder_V10_A1_PLA_OUTWARD_FACE_DOWN.3mf in Bambu Studio, slice,
save the _SLICED.3mf copy, then export the plate as .gcode.3mf.
.venv/bin/python verify_v10_ready.py
.venv/bin/python package_v10.py

Defaults use output/v10 and the root parameters.json. model_v10.py can generate
initial V10 parameters from the preserved V9 snapshot. Changing measurements
requires updating corresponding acceptance expectations in verify_v10.py.
The package includes the V9 comparison baseline and prior hash manifests.
