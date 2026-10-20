TESLA MODEL Y / IPHONE 18 PRO HOLDER — PROTOTYPE V1
================================================

Start here
----------
1. View output/previews/assembly_top.png for the installed arrangement.
2. Open output/Fit_tests_A1_PLA.3mf in Bambu Studio. Print the fit gauges first.
3. Open output/Holder_A1_PLA_PROTOTYPE.3mf for the two full inserts.

Both projects contain separate editable mesh objects and embedded A1 / 0.4 mm
nozzle / Generic PLA / 0.20 mm layer settings. No supports or brim are enabled.
The projects assume a Textured PEI Plate; choose your actual plate before
printing. The CAD honeycomb is physical through-holes and does not depend on
the slicer's internal infill pattern. The preview colors identify the two
parts; this is a single-filament print. No job has been sent to the printer.

Files
-----
parameters.json                          Editable dimensions, mm, with provenance notes.
build_model.py                           Parametric CadQuery source + geometry checks.
make_previews.py                         Drawings rendered from exported STL geometry.
prepare_slicer.py                        Native Bambu project builder and CLI slice check.
verify_outputs.py                        Verify actual exports/toolpaths and create the ZIP.
requirements.txt                         Pinned Python dependencies.
output/left_insert_PROTOTYPE.stl          Left insert; wider lower wing.
output/right_insert_PROTOTYPE.stl         Right insert; long ridge collar.
output/*insert_PROTOTYPE.step             Individual editable CAD solids.
output/holder_assembled_PROTOTYPE.step    Colored two-solid assembly in installed coordinates.
output/holder_assembled_geometry.3mf       Geometry-only assembly; not a printer profile.
output/Holder_A1_PLA_PROTOTYPE.3mf         Two objects laid flat for the A1.
output/Fit_tests_A1_PLA.3mf                Nine labeled fit gauges on one plate.
output/fit_tests/*.stl                    Individual gauge meshes.
output/previews/                          Top, perspective, and gauge previews.
output/validation/                       Geometry report, slicing logs, and verification.
output/slicer/                           Resolved presets, slice results and diagnostic G-code.

The main STL/STEP files use the installed XY coordinates. The Bambu projects
translate each object to a separate print position, without changing scale or
orientation. Dimensions in the STL files are millimeters. Do not auto-rescale.

Fit sequence
------------
The embossed labels read L03, L05, L08; R03, R05, R08; C03, C05, C08.
03 = 0.3 mm clearance PER SIDE, 05 = 0.5 mm, 08 = 0.8 mm.

L: place the U gauge around a rounded end of the short left nub.
R: place the U gauge around a rounded end of the long center ridge.
The U opening lets the gauge test width/end radius without assuming the whole
nub length. Select a freely seated fit with little play, without compressing
or forcing the console fabric. These gauges do NOT check nub length or spacing.

C: place the thin ring around the camera housing on the bare phone. It should
clear the housing and all lenses, rather than press on them. This ring checks
the estimated 2D envelope only; it does not validate the bump's height or its
position relative to the phone. The ring is a test tool, not an installed part.

If all three gauges are obviously too large or too small, correct the base nub
or camera dimensions in parameters.json. Clearance variants cannot compensate
for a several-millimeter error in the estimated outline.

Once the gauges are useful, test the full inserts without the phone. Both must
sit flat around their nub, with their longest axes running up/down the pad.
Left = teal in the preview, short slot. Right = orange, long slot. The slots
pass completely through the inserts; the nubs do not need matching heights.

Rest the bare phone in portrait orientation, camera end upward, bottom against
the existing factory ledge. The camera should enter the recess freely and the
phone should lift out without snagging. Check that the camera housing actually
engages the recess walls at this thickness; the lens projection is unknown.
Do not force the phone into an interference fit.

Repeat placement several times. Compare at least ten minutes of stationary
charging with the same phone on the original pad in its known working position.
An open center removes plastic beneath the estimated charging region, but side
supports can still change the phone's standoff or tilt. Charging cannot be
established by the CAD or slicer checks. If charging worsens, check positioning
and reduce support thickness before printing another full pair.

The requested PLA setup is a fit prototype. Physical fit, charging retention,
and resistance to sustained cabin heat have not been tested. Test the final
material separately before treating a later revision as an installed accessory.

Starting dimensions and evidence
-------------------------------
Phone body: 71.9 wide x 150.0 long x 8.75 deep, from Apple's specifications:
https://www.apple.com/iphone-18-pro/specs/

Provisional console geometry, estimated using the tape in the supplied photos:
  Short nub: 8 wide x 42 long; center X=0, Y=122.5.
  Long ridge: 9 wide x 120 long; center X=83.5, Y=103.5.
  Centerline spacing: 83.5.
  The actual footprints may taper; the prototype uses rounded capsule slots.

Explicit camera assumptions, NOT manufacturer mechanical dimensions:
  Housing envelope: 65.5 wide x 35 long, 6 corner radius.
  Top of housing: 3 below the top edge of the phone.
  Centered laterally on the phone.
  No camera/lens projection is asserted by this model.

The replacement iPhone+18+Pro+i2.5+back+glass.STL spans approximately
63.86 x 96.42 x 0.50 model units and has only two Z levels. It does not contain
the complete phone or camera. It is preserved as supplied and is not used to
infer a precision camera cavity.

XY is the inclined pad surface. X=0 is the short nub's estimated centerline.
Y=0 is the factory lower phone ledge. Positive Y points toward the camera/top.
Z=0 is the pad surface, normal to it; there is no extra wedge or tilt built in.
Photo tape markings establish only an approximate scale: fabric boundaries,
occlusion and perspective can produce several millimeters of error.

Geometry defaults
-----------------
Thickness 2.4; nub/camera clearance 0.5 per side; hex openings 6 across flats;
minimum hex web 1.6 after chamfer; solid border at least 2.4 around honeycomb;
rim chamfers 0.2. Hex openings are 6.0 at their straight wall and 6.4 at the
chamfered entrance. Rounded outer corners and capsule slots use native CAD arcs.

The charging opening is a 57 mm-diameter plastic keep-out centered on an
estimated phone charging region. This is NOT a measurement of the Tesla coil.
No magnets, puck mount, adhesive, snap connection, or car modification is used.

Editing and rebuilding
----------------------
From this folder:

  uv venv --python 3.12 .venv
  uv pip install --python .venv/bin/python -r requirements.txt
  .venv/bin/python build_model.py
  .venv/bin/python make_previews.py
  .venv/bin/python prepare_slicer.py
  .venv/bin/python verify_outputs.py

The slicer command uses the local BambuStudio application and installed profiles.
It writes a portable native Bambu 3MF directly, then asks Bambu Studio to read
and slice that exact project using ONLY its embedded settings. This avoids
the application's thumbnail-export window-restoration dialog on this Mac.
The application, user's presets, and original inputs are not changed.

Typical adjustments in parameters.json:
  nub_clearance                     Global clearance per side for both slots.
  left/right_nub_width/length        Correct actual nub footprints.
  left/right_nub_x/y                 Correct console spacing and position.
  camera_width/length/corner_radius  Correct the camera housing shape.
  camera_top_offset                 Correct housing position from phone top.
  phone_center_x / phone_bottom_y    Shift camera relief and charging opening.
  thickness                         Change support height/contact engagement.
  charging_open_radius/offset_*      Adjust the central plastic keep-out.

Large changes can make an insert disconnected or too thin. The generator stops
if the CAD becomes invalid, a mesh is not one closed component, inserts collide,
or the honeycomb compromises the specified border/web. After changing a nub's
position substantially, its outer silhouette may also need adjustment.

Validation limits
-----------------
CAD validation, STL watertightness, winding, connected components, mesh/CAD
volume agreement, nominal nub/camera interference, honeycomb borders, build
plate placement, and Bambu slicing can be verified on this computer.
No software check substitutes for the physical fit and charging tests above.
