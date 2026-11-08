# iPhone 18 Pro on the 2021–2024 Model Y WC3 Pad: Spacer or Crease?

**Don't add a spacer. Seat the iPhone 18 Pro fully in the bottom crease.** If it still won't charge reliably, rotate it 180° before trying anything that raises it. The best available numbers put the 18 Pro's coil at or slightly below the height that works for phones that charge well on this pad, and raising the phone moves its coil away from the WC3 coils. The only spacer that has fixed a large iPhone on this pad did the opposite: it lowered the ledge.\[1\] Confidence is moderate (about 60–65%). Nobody has published a measured WC3 coil position, so a five-minute shim test in your own car beats any calculation.

## TL;DR
- **Recommendation:** no spacer. Press the phone fully into the crease. If charging is flaky, try it upside-down (camera plateau at the bottom) next. A spacer only makes sense if the shim test below shows charging starting *only* when the phone is lifted, and then use exactly that lift, probably 1–3 mm.
- **Why:** Apple's iPhone 18 Pro dimensional drawing carries the same MagSafe-area dimensions as the 17 Pro. Read the most likely way, the coil centre sits about 72 mm above the bottom edge, about 2.7 mm below the middle of the 150.0 mm body. That is at or below the roughly 73–75 mm coil height of the 13 Pro and 14 Pro, which charge when pressed into the crease. Taller phones with higher coils needed the ledge *lowered*, not raised.
- **Real fix:** the WC3 is a non-magnetic Qi 1.2.4 pad that delivers about 5–7.5W. Your 18 Pro supports 25W over MagSafe and Qi2, so a MagSafe/Qi2 drop-in (TWRAPS dual pad for the 2021–2025 Model Y) or a screen-mounted Qi2 charger fixes both alignment and speed.

## Key Findings

### 1. iPhone 18 Pro geometry (verified unless marked)
| Item | Value | Status |
|---|---|---|
| Height × width × depth | 150.0 × 71.9 × 8.75 mm, 211 g | **Verified**: Apple tech specs |
| Wireless charging | "MagSafe wireless charging up to 25W", "Qi2 wireless charging up to 25W", magnet array, alignment magnet | **Verified**: Apple tech specs\[2\]\[3\] |
| Body vs 17 Pro | Same outline. MacRumors: "Apple didn't change the size of the iPhone 18 Pro models" | **Verified** |
| MagSafe-area dimensions on Apple's drawing | Page 4 of the 18 Pro drawing repeats the 17 Pro values (77.74, 20.11, 57.50, R49.39) | **Verified**: both Apple PDFs. The coil position carried over unchanged\[4\]\[5\] |
| Coil centre from bottom edge | **~72.3 mm** (150.0 − 77.74), i.e. ~2.7 mm below geometric centre | **Inferred**. The PDF text doesn't label which line 77.74 dimensions, or whether it is measured from the top. If measured from the bottom, the coil would sit ~77.7 mm up (2.7 mm *above* centre). Treat it as 72–78 mm, most likely ~72 |
| Total thickness at camera plateau | ~13.49 mm | **Unverified**: Smartish, a case-seller blog, citing unnamed "lab measurements". For scale, Apple's 16 Pro drawing gives back glass to plateau 2.05 mm and back glass to camera glass 4.28 mm\[6\]\[7\] |
| Back-glass access | iFixit: "no serviceable parts inside aside from the wireless charging coil embedded in the panel itself" | **Verified**. The coil sits in the glass window below the plateau, same architecture as the 17 Pro\[8\] |

The 16 Pro drawing labels its equivalent point "PRODUCT CENTER 75.05" on a 149.61 mm body, about 74.6 mm from the bottom.\[6\] If the 77.74 reading is right, the 17/18 Pro coil moved down about 2.3 mm. That fits the pre-launch leaks of a lower logo and MagSafe array.\[9\]\[10\] It also suggests the move was small, not a wholesale relocation.

### 2. The iPhone 17 Pro relocation: what's actually confirmed
- **Confirmed by post-launch sources:** the 17 Pro uses an aluminium unibody with a separate glass window below the camera plateau for charging. iFixit found only the charging coil behind the back glass.\[11\]\[12\] A Pro Max teardown using magnet paper found the MagSafe ring "has two openings instead of one", so the ring really is broken on Pro models.\[13\]
- **Not confirmed by any teardown measurement:** the claim that the coil moved materially lower. Pre-launch reports (Majin Bu, Sonny Dickson) said the logo and coil moved down.\[10\] AppleInsider's July 2025 renders showed the ring "seemingly a little lower".\[14\] Commenters at the time argued the ring "looks centered".\[15\] Apple's drawings, read as above, suggest a shift of only about 2–3 mm.
- **18 Pro:** carries the same back-side MagSafe dimensions as the 17 Pro. Real-world 17 Pro reports on this pad therefore apply directly to you.

### 3. Owner reports, iPhone 17-generation on the 2021–2024 Model Y (no 18 Pro reports found yet)
| Phone / car | Case | Outcome |
|---|---|---|
| 17 Pro Max, 2021 MY | Wireless-compatible case | Won't charge in case; "sometimes" without\[16\] |
| 17 Pro Max, 2023 MY | Apple case | "no amount of shifting it around… would help"; **"The only thing that allowed it to charge was turning the phone upside down"**\[16\] |
| 17 Pro Max, 2024 MY | Not stated | Won't charge "unless I rotate the iPhone 180 degrees". The same owner's 14 Pro "worked fine"\[16\] |
| 17 Pro Max, wife's car (2022 MY or 2025 M3) | Apple case | Charges\[17\] |
| 17 Pro, Juniper (2025+, not WC3) | Spigen Nano Pop | Fine, no overheating. Not your hardware\[17\] |
| 13 Pro, 2021 MY (historical) | Case | Stopped dropping out once "GENTLY persuade[d]… into the bottom crease"\[18\] |

The pattern: the 17 Pro Max (163.4 mm, coil ~79–82 mm up) mostly fails seated normally and works when flipped. No report covers the 6.3-inch 17 Pro or 18 Pro on a WC3 car. Every report of failure or overheating involves Pro Max-size phones or thick cases. The general overheating complaint on this pad goes back to the 12–14 Pro Max: one owner blamed "the ginormous camera bump combined with the charging rings being a bit too low".\[19\]

### 4. WC3 coil data (what exists)
- **Verified (ChargerLAB, "Teardown of Tesla Model Y 15W Wireless Charging Module"):** "Model is WC3", 13.5V 4A input, 15W max, Qi. "Each wireless charging area has two coils. The wireless charging coil is soldered to the PCBA module." Two DIODES switching MOSFETs "used to switch between two coils". NXP MWCT1213AVLH master controller supporting "Qi 1.2.4", plus an NXP TJA1021 LIN transceiver, DIODES DGD05473 half-bridge drivers, eight DIODES DMT47M2SFVWQ MOSFETs and an MPS MPQ4231 buck-boost. Large passive heat sink. Measured "charging power is between 5-7.5W".
- **Verified (FCC 2AEIM-WC3):** granted 2020-08-11 and 2021-03-10, operating at 127.72 kHz. Internal-photo exhibits exist (09_WC3 IntPho) but carry no published dimensions.\[20\]\[21\]\[22\]
- **Not found anywhere:** coil diameter, whether the two coils stack up the incline or sit side by side, and any ledge-to-coil measurement. One aftermarket blog claims "two charging zones… approximately 70mm x 140mm". Disregard it: the same page invents a "Tesla Scanner" app and nonexistent menus.\[23\]
- **Indirect constraint (inferred):** phones with coils at roughly 73–75 mm above the ledge (13 Pro, 14 Pro, iPhone 13 in ChargerLAB's demo) charge on both bays. Phones with coils at roughly 80 mm or more (12 Pro Max, 15/17 Pro Max) need the ledge lowered (Gizmotoy's 3.25 mm drop) or the phone flipped.\[1\]\[24\] The effective sweet spot is therefore at or below about 75 mm above the ledge.

### 5. Geometric estimate (inference)
- **Coil height above the ledge** = coil-from-bottom (~72.3 mm, range 72–78) + case bottom lip (1–2 mm) ≈ **73–74 mm** under the likely reading, 79–80 mm worst case.
- **Compared with the inferred WC3 sweet spot (~73–75 mm):** under the likely reading the 18 Pro lands right on it when seated in the crease. Every millimetre of spacer moves it up and away. Under the worst-case reading it lands where the Pro Max phones do, and a spacer makes that worse too. **A spacer that raises the phone has no favourable scenario in this data.** It only helps if your WC3 coils sit higher than everyone's evidence implies.
- **Tilt is the other variable.** On a plain Qi pad, a large plateau pivots the phone so the coil gap grows. TMC owners repeatedly blame the bump.\[16\]\[25\] Seating the bottom fully in the crease minimises the gap at the coil, which matches the 13 Pro fix. Flipping the phone puts the plateau down by the ledge, where the bay geometry may hide it, and moves the coil 5.4 mm (2 × 2.7). That likely explains why flipping rescues the 17 Pro Max.

### 6. Accessories and the better fix
- **Spacers:** the only iPhone-specific Model Y spacer (Gizmotoy, 2020 MY, Thingiverse/Printables) lowers the ledge 3.25 mm, adds width, and recommends PETG.\[1\]\[26\] Raise-type spacers exist only for Flip phones and 13 mini, whose coils are too low.\[27\]\[28\] I found no spacer designed for the 17/18 Pro.
- **MagSafe drop-ins:** TWRAPS makes a dual MagSafe-compatible pad for "2021-2023 Tesla Model 3 and the 2021-2025 (Pre-Juniper) Model Y". It is two-level to clear the camera bump, ships a 12V adapter, and requires a MagSafe case. TWRAPS's product page now lists a "2x25W" version at $119.95 ("Each puck delivers up to 25W power") and a "2x10W" version at $99.95. The original version was rated 20W total ("15W per puck or 20W total (if both engaged)", per TWRAPS on TMC). Reviews report a 16 Pro Max charging "even in case", with complaints about fit. Etsy sellers offer similar Qi2 pads.\[29\]
- **Screen mounts:** Qi2 25W chargers with fans (Esoulk at Best Buy; Evolved Chargers lists iPhone 18 Pro)\[30\]\[31\] or MagBak, which TMC owners call "by far the best solution".\[19\]\[32\]
- **Verdict:** if you want more than slow top-up charging, replace rather than shim. MagSafe/Qi2 solves alignment magnetically and delivers 15–25W instead of 5–7.5W, with less heat.\[33\]

## Recommendations
1. Use the pad with no spacer, phone pressed fully into the crease, in a thin case. Apple's Accessory Design Guidelines say MagSafe cases "must enclose the device, have a maximum thickness of 2.1mm", recommend 2.0 mm, and require MagSafe accessories to self-align "within a 1.55mm radial maximum".
2. If it drops out, rotate the phone 180°. That is what worked for every 17 Pro Max owner who got the WC3 working.\[16\]
3. Run the shim test before printing anything.
4. If you want fast or reliable charging, fit a MagSafe/Qi2 replacement. Don't chase millimetres on a 7.5W pad.

## Empirical test (10 minutes, parked, HVAC on)
1. **Logging:** in Shortcuts, create Personal Automations for "Charger is Connected" and "Charger is Disconnected", each appending a timestamp to a Note. Or just watch for the charging chime and haptic.
2. **Baseline:** phone in its case, pressed into the crease, left bay then right bay, 5 minutes each. Record connects and drops.
3. **Raise in steps:** slide credit cards under the bottom edge. ISO/IEC 7810 ID-1 cards are "0.76 mm (±0.08 mm)" thick, so 1, 2, 4, then 6 cards give 0.76, 1.52, 3.04 and 4.56 mm nominal. Note where charging starts, where it is steadiest, and where it stops.
4. **Lower (simulated):** remove the case. The bottom lip drops ~1–2 mm, though the back gap also changes, so this test is confounded.
5. **Flip test:** rotate 180°, seated in the crease.
6. **Decide:** if the steadiest point is 0 cards, no spacer. If it's consistently N cards on both bays, print a PETG/ASA strip of that thickness. If only the flipped orientation works, the coil is too high, so use flipped orientation or lower the ledge, never raise it. Also check phone temperature by hand: a phone that charges but gets hot is misaligned.\[34\]

## Caveats
- The 72.3 mm coil figure is my reading of unlabelled numbers in Apple's PDF drawings. The direction (from the top or the bottom) changes the answer by ~5.5 mm. Apple's Accessory Design Guidelines (MagSafe magnet array, §39) likely state it exactly, but I couldn't access the file.
- The WC3 sweet spot is inferred from which phones work, not measured. Unit-to-unit variation is plausible (one owner reported one bay working and the other not).\[35\]\[36\]
- No iPhone 18 Pro + WC3 reports exist yet. The 17 Pro data is mostly Pro Max.
- Even perfectly aligned, the WC3 delivers ~5–7.5W and runs warm.\[37\] Expect slow charging and possible thermal pauses with navigation running.\[18\]\[24\]

## Sources

1. [2020 Model Y wireless charging phone spacer by Gizmotoy - Thingiverse](https://www.thingiverse.com/thing:4692186)
2. [iPhone 18 Pro - Tech Specs](https://support.apple.com/en-au/148590)
3. [What Does MagSafe Mean? How MagSafe Works on iPhone, Explained Simply](https://www.griplux.com/blogs/griplux-blog/what-does-magsafe-mean)
4. <https://developer.apple.com/download/files/accessories/dimensional-drawings/iphone-17-pro.pdf>
5. <https://developer.apple.com/download/files/accessories/dimensional-drawings/iphone-18-pro.pdf>
6. [iPhone 16 Pro Dimensional Drawings](https://developer.apple.com/download/files/accessories/dimensional-drawings/iphone-16-pro.pdf)
7. [iPhone 18 Pro Size and Dimensions: Real Measurements, Weight & Hand-Fe](https://smartish.com/blogs/news/iphone-18-pro-size-and-dimensions-real-measurements-weight-hand-feel-guide)
8. [Inside the Tiny Unfixable Eye: iPhone 18 Pro and Pro Max Teardown - iFixit](https://www.ifixit.com/News/119329/inside-the-tiny-unfixable-eye-iphone-18-pro-and-pro-max-teardown)
9. [iPhone 17 Pro's New MagSafe Design Revealed in Leaked Photo - MacRumors](https://www.macrumors.com/2025/07/02/iphone-17-pro-new-magsafe-design/)
10. [iPhone 17 Pro series to get repositioned Apple logo](https://m.gsmarena.com/iphone_17_pro_series_to_get_repositioned_apple_logo-news-68446.php)
11. [The Science Behind Scratchgate and What It Means for Repairing the iPhone 17 Pro - iFixit](https://www.ifixit.com/News/113388/iphone-17-pro-teardown)
12. [iFixit takes the iPhone 17 Pro apart: the new design presents new challenges for repairs - GSMArena.com news](https://www.gsmarena.com/ifixit_takes_the_iphone_17_pro_apart_the_new_design_presents_new_challenges_for_repairs-news-69647.php)
13. [iPhone 17 Pro Max Teardown: Apple’s Boldest Redesign Yet — Phone Repair Guru](https://www.phonerepairguru.com/news/idwjhb1v5svawj58ox695a6uqywbvv)
14. [iPhone 17 Pro render shows shifted MagSafe, lower Apple logo](https://appleinsider.com/articles/25/07/07/what-the-iphone-17-pro-looks-like-with-moved-magsafe-apple-logo)
15. [New iPhone 17 Pro MagSafe redesign shown in leaked image - Future Apple Hardware Discussions on AppleInsider Forums](https://forums.appleinsider.com/discussion/241175/new-iphone-17-pro-magsafe-redesign-shown-in-leaked-image)
16. [iPhone 17 Pro Max too big for wireless charging with a case?](https://teslamotorsclub.com/tmc/threads/iphone-17-pro-max-too-big-for-wireless-charging-with-a-case.349291/)
17. [iPhone 17 wireless charging (and case?)](https://teslamotorsclub.com/tmc/threads/iphone-17-wireless-charging-and-case.349945/)
18. [2021 Model Y a Wireless charger problem](https://teslamotorsclub.com/tmc/threads/2021-model-y-a-wireless-charger-problem.244850/)
19. [iPhones overheat when using console wireless charger on my Model Y](https://teslamotorsclub.com/tmc/threads/iphones-overheat-when-using-console-wireless-charger-on-my-model-y.284396/)
20. [WC3 Wireless Phone Charger Label Diagram - FCC ID 2AEIM-WC3](https://fccid.io/2AEIM-WC3/Label/06-WC3-LabelSmpl-US-4851077)
21. [Model Y Owner's Manual](https://www.tesla.com/ownersmanual/modely/en_il/GUID-1F854D6E-67FA-4262-BB76-904C71FAC59F.html)
22. [2AEIM-WC3 - FCC ID](https://fcc.report/FCC-ID/2AEIM-WC3)
23. [Tesla Phone Charger Not Working? Complete Troubleshooting Guide That Actually Works - Vehiclers](https://www.vehiclers.com/tesla/tesla-phone-charger-not-working/)
24. [Teardown of Tesla Model Y 15W Wireless Charging Module - ChargerLAB - Chargers, Batteries, Cells, Power Banks, Gadget News and Reviews](https://www.chargerlab.com/teardown-of-tesla-model-y-15w-wireless-charging-module-2)
25. [2021 Model Y a Wireless charger problem](https://teslamotorsclub.com/tmc/threads/2021-model-y-a-wireless-charger-problem.244850/page-2)
26. [Wireless charging phone spacer for 2020 Tesla Model Y by Gizmotoy](https://www.printables.com/model/140893-wireless-charging-phone-spacer-for-2020-tesla-mode)
27. [Tesla Charger Spacer - iPhone 13 and Samsung Flip by Kelley Lewis](https://www.printables.com/model/1414467-tesla-charger-spacer-iphone-13-and-samsung-flip)
28. [Flip phone spacer for Tesla Model Y cordless charger by DP design](https://www.printables.com/model/523839-flip-phone-spacer-for-tesla-model-y-cordless-charg/related)
29. [Tesla Magsafe Wireless Charging Pad](https://www.etsy.com/listing/1827451383/tesla-magsafe-wireless-charging-pad)
30. [Esoulk 25W iPhone Duo iPhone 18 17 Pro Max Magnetic Wireless Charger for Tesla Screen with Cooling Fan Black - Best Buy](https://www.bestbuy.com/product/esoulk-iphone-17-pro-max-magnetic-wireless-charger-for-tesla-touch-screen-mount-25w-qi2-fast-charging-magsafe-compatible-black/J3GWYVJLRS)
31. [Tesla MagSafe Car Mount Qi2 Charger for iPhone & Wireless Charging](https://evolvedchargers.com/products/tesla-magnetic-car-charger)
32. [Phone Holder Recommendations for Model Y](https://teslamotorsclub.com/tmc/threads/phone-holder-recommendations-for-model-y.295791/)
33. [Wireless Chargers: Qi2 25W, MagSafe & Magnetic](https://www.belkin.com/products/wireless-chargers/)
34. [Is there any solution to the poor inductive phone charger behavior in Model Y?](https://teslamotorsclub.com/tmc/threads/is-there-any-solution-to-the-poor-inductive-phone-charger-behavior-in-model-y.306297/)
35. [iPhone not charging on wireless charger](https://teslamotorsclub.com/tmc/threads/iphone-not-charging-on-wireless-charger.231394/)
36. [2020-23 Tesla Model Y & 2021-23 Model 3 Wireless Charger: Overheating and Charging Fixes](https://www.go-parts.com/garage/wireless-phone-charger-pad-module-tesla-y-tesla-3-2020-2023)
37. [How to Charge Phone in Tesla Model Y](https://www.tesery.com/blogs/tesla-tips/how-to-charge-phone-in-tesla-model-y)
