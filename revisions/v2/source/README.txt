TESLA MODEL Y / IPHONE HOLDER — PROTOTYPE V2
==========================================

Current files live under output/v2/. Earlier output/ files and the v1 ZIP are
preserved as the version printed in the first fit test. V1 editable sources
are preserved in revisions/v1/source/. Do not mix V1 and V2 fit results.

What changed after the physical test
------------------------------------
User measurements:
  Phone width                         72.1 mm
  Main body thickness                  8.8 mm
  Body + camera housing               11.7 mm
  Body + housing + lens tips          13.8 mm
  Both gently rounded nub bases       approximately 18 mm wide
  Clear gap between nub base edges    75 mm (confirmed edge-to-edge)

Derived dimensions:
  Nub center spacing                  9 + 75 + 9 = 93 mm
  Housing projection from phone back  11.7 - 8.8 = 2.9 mm
  Lens-tip projection from phone back  13.8 - 8.8 = 5.0 mm
  Support thickness                   5.4 mm, leaving 0.4 mm lens-to-flat-pad gap

Camera correction:
  V1 C05 was about the right width but too short.
  Keep the nominal 65.5 mm width; the 0.5 mm-per-side opening is 66.5 mm wide.
  The tabletop scan, scaled by measured phone width, gives a phone length of
  150.10 mm. Keep the original nominal 150.0 mm phone length.
  The raised camera region is approximately 44 mm long. Include an additional
  2 mm at its lower blended transition: the new conservative relief envelope
  is 46 mm long, with a provisional 3 mm top setback and 6 mm corner radius.
  The new 2C05 ring opening is 66.5 x 47.0 mm at its straight walls.
  Camera LENGTH is a scan estimate, not one of the caliper THICKNESS values.
  This cutout covers all 461 sampled camera-region scan vertices more than
  1 mm above the fitted back plane. It is not a precision surface-fit proof.

The left insert retains visible 6 mm hex openings. The 18 mm center-ridge
base leaves the right insert's rails too narrow for 6 mm holes plus the
specified borders, so the right insert is solid. Both parts remain independent
and use open-through nub slots. Nub heights and fabric compression are not
assumed. Gentle rounding is represented by adjustable capsule footprints;
base lengths and fore-aft positions still need physical checking.

Print next
----------
1. Open output/v2/Fit_tests_V2_A1_PLA.3mf in Bambu Studio.
2. Print the new fit gauges before the full pair. No V2 print has been sent.
3. Start with 2L05, 2R05 and 2C05. Try 08 if snug or 03 if loose.
4. Choose the smallest clearance that rests freely and lifts away easily.
5. Report the successful labels, any rocking/gaps, and whether the camera ring
   rests around the whole housing without contacting or snagging the lenses.

Every new label begins with 2: 2L03, 2L05, 2L08; 2R03, 2R05, 2R08;
2C03, 2C05, 2C08. The final two digits mean 0.3 / 0.5 / 0.8 mm PER SIDE.
The leading 2 identifies the revision, not the clearance.

L / R U gauges fit around ONE rounded end of the short left nub / long center
ridge. They check width and end shape, not full nub length or spacing.
C rings fit around the camera housing on the bare phone with its back facing
up. Keep the open center clear of all lenses. Camera rings remain 2.4 mm thick
with 0.6 mm raised labels; they test the planar outline, not phone support
height, lens projection, or charging. Do not force any fit.

After the gauges fit
--------------------
Use output/v2/Holder_V2_A1_PLA_PROTOTYPE.3mf for the two full 5.4 mm inserts.
First seat them without the phone. Both should lie flat around the nub bases.
The left part has the wider lower wing; the right part surrounds the long
center ridge. Check nub length and position at this stage.

Place the bare phone in portrait orientation with its camera end upward and
its bottom against the existing factory ledge. Confirm the housing enters the
relief, the body rests on the support surfaces, and the lenses do not touch
the pad. Check that the factory ledge still retains the phone at this height.
The phone should lift straight out without snagging. Repeat placement.

Compare at least ten minutes of stationary charging with the same bare phone
on the original pad in its known working position. The open middle avoids
plastic under the charging region, but the supported phone back is now
5.4 mm above the pad. Charging performance is not established by the open
center or software checks. Do not assume it will charge at this spacing.
If charging fails, revisit height/pose and any actual pad recess before a
further print; simply lowering the support can make the lenses touch.

Generic PLA is the fit-prototype material. Cabin-heat suitability and final
material selection still require separate validation.

Deliverables
------------
parameters.json                 Editable dimensions and provenance notes, mm.
build_model.py                  CadQuery source and geometry validation.
analyze_scan.py                 Width calibration and scan analysis.
make_previews.py                Mesh-based previews and dimension comparison.
prepare_slicer.py               Native Bambu project builder and slice check.
verify_outputs.py               Mesh, scan-sample, slicer and G-code validation.
requirements.txt                Python dependency versions.

output/v2/left_insert_PROTOTYPE.stl
output/v2/right_insert_PROTOTYPE.stl
output/v2/*insert_PROTOTYPE.step
output/v2/holder_assembled_PROTOTYPE.step
output/v2/holder_assembled_geometry.3mf   Geometry only; not a printer project.
output/v2/Fit_tests_V2_A1_PLA.3mf
output/v2/Holder_V2_A1_PLA_PROTOTYPE.3mf
output/v2/fit_tests/*.stl
output/v2/previews/assembly_top.png
output/v2/previews/assembly_3d.png
output/v2/previews/fit_gauges.png
output/v2/scan/revision_comparison.png
output/v2/scan/scan_calibration.json
output/v2/validation/VALIDATION.txt
output/v2/validation/final_verification.json

tesla_iphone_holder_prototype_v2.zip contains current sources, printable files,
STEP models, previews and validation, including the aligned scan data used
for the sampled clearance check. The original scan remains unchanged.

Printer setup
-------------
Bambu A1 / 0.4 mm nozzle / Generic PLA / 0.20 mm layers / Textured PEI Plate.
3 walls, 4 top and bottom shell layers, 20% gyroid internal infill.
No supports and no brim. The visible hexes are modeled through-holes.
Both projects have embedded settings and separate editable mesh objects.
The preview colors identify pieces; the projects use one filament.

Editing / rebuilding
--------------------
  .venv/bin/python analyze_scan.py
  .venv/bin/python build_model.py
  .venv/bin/python make_previews.py
  .venv/bin/python prepare_slicer.py
  .venv/bin/python verify_outputs.py

To set up the environment, use Python 3.12 and requirements.txt. Scan analysis
requires the supplied iphone table scan.glb alongside analyze_scan.py; ordinary
rebuilds can use the packaged aligned_scan.npz without rerunning analysis.
Slicing uses the locally installed Bambu Studio app and A1 presets. It does
not change user presets, connect to the printer or send a print.

XY follows the sloped charging pad; Z is perpendicular to that surface.
Y=0 is the factory lower ledge; +Y points toward the phone's camera end.
X=0 is the short nub centerline; the center ridge is at X=93 and phone at 46.5.
The scan's initial height is detrended against the flat back glass. Width is
uniformly scaled to 72.1 mm; caliper heights govern the actual CAD Z dimensions.

Adjust nub widths/lengths/positions, camera width/length/radius/setback, phone
position, clearances and thickness independently in parameters.json. If nub
width or spacing changes, keep nub_base_gap consistent with slot positions.
The generator rejects a support thinner than the measured lens projection
plus lens_to_pad_clearance. Revisit physical pad geometry if a thinner support
is required; do not silently assume compression or an unseen recess.

Validation limits
-----------------
Each STL is checked for one watertight component, consistent winding, valid
CAD, and less than 0.1% CAD/mesh volume disagreement. Honeycomb margins and
insert/nub/camera clearances are checked. Bambu reads and slices the exact
native projects using their embedded settings. Validation confirms all objects
are on the A1 plate, no repair/slicing warnings or support toolpaths, and actual
extrusion of every raised gauge label.

The scan check covers sampled vertices above a 1 mm threshold, with 0.18 mm
RMS residual on the scanned back plane. It does not bound all scan errors,
measure the housing to caliper precision, or prove continuous-surface fit.
Physical fit, lens clearance, ledge retention, charging and cabin heat remain
pending for V2. The failed V1 camera result is preserved as revision evidence.
