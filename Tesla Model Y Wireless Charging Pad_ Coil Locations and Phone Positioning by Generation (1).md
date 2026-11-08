# Where the Wireless Charging Coils Sit in the Tesla Model Y Console Pad, and How to Position Your Phone

Nobody has published a millimetre-accurate position for the coils in any Model Y charger generation. What is verified is the layout: since the 2021 console refresh, each of the two phone bays has its own coil pair (two coils per side).\[1\] The pair is centred left-to-right in the bay and sits in the lower-to-middle part of the inclined pad. So the best starting position is phone seated fully against the bottom ledge, centred in its bay. From there, adjust height (flip the phone, or add a spacer) depending on where your phone's coil sits.

## TL;DR
- **The coil layout is verified, the coil position is not.** Teardowns of the 2021–2024 module (WC3) and the 2025+ Juniper module (WC5) both show two coils per charging side: the WC3 switches between them, and the WC5 has them "stacked together to increase the charging area".\[2\] I found no FCC photo, service document, teardown or forum post that gives a mm distance from the ledge to the coil centre for either module.
- **Start here:** push the phone all the way down into the bottom crease, centre it in its bay, and remove thick or metal cases and any NFC cards. Community evidence points to the pad's sweet spot sitting near the centre of a normal-height phone resting on the ledge. Very short phones (Galaxy Z Flip) need to be raised about 16–26 mm. Tall, thick phones (Pro Max in a case) sometimes need to sit lower or deeper.
- **Which generation you have matters.** Cars built from about February 2021 to early 2025 have the matte console and microfiber pad (WC3, 15W per side, passive cooling). Juniper cars from 2025 on have the WC5 (15W, two stacked coils per side, NFC card reader in the pad). The fan-cooled WC8 is rated "50W + 30W dual-zone" per ChargerLAB's teardown and ships in the China Model Y L. Michał Gapiński retrofitted it to a Juniper Model Y Premium, but Tesla Toolbox "wouldn't let him code the part replacement" (Not a Tesla App), and the retrofit does not work on the Standard trim. The cooled pad makes alignment matter less, not more.

## Key Findings

### Generation comparison

| Generation | Build period | Module / part | Rated power | Coils per side | Coil location vs. pad landmarks | Cooling |
|---|---|---|---|---|---|---|
| Original (piano-black console) | 2020 – early 2021 | Rubberized pad plugged into a console USB-C port (Cars.com) | Teslarati, citing the manual: "up to 15W" shared across two phones. Tesla's own Model 3 accessory dock: 5W per dock | **Unverified.** The Tesla WC1 charger accessory has "two wireless charging coils … placed overlapping" and a raised "bump [that] indicates the location of the coil" (ChargerLAB). Whether the early Model Y pad is the same unit is not confirmed | No measurement. A 2020 Model Y spacer that lowered the phone ledge 3.25 mm fixed misalignment for an iPhone 12 Pro Max | Passive\[3\]\[4\]\[5\]\[6\] |
| Refreshed console (matte, microfiber pad) | ~Feb 2021 – early 2025 | WC3 (FCC ID 2AEIM-WC3; part 1755100-00-A/-D). Clip-mounted dock before Mar 3, 2024, screw-mounted after | 15W max per module label (13.5V 4A input). ChargerLAB measured 5–7.5W in practice, and Not a Tesla App says the 2025+ pad likewise "usually sits in the ballpark of 5W of actual charging speed" | **2, switched by MOSFETs** ("Each wireless charging area has two coils") | Each pair is centred in its bay. One TMC owner, citing a teardown video, describes the two coils as "low and center" on each side. No mm figure exists | Passive: large rear metal heat sink, copper grid over the coil area\[2\] |
| Juniper refresh (also Model 3 Highland) | 2025+ | WC5 (FCC ID 2AEIM-WC5; part 1761810-00-C/-D) | Up to 15W (owner's manual) | **2, "stacked together to increase the charging area"** | Left and right bays separated by a raised "bump used to locate the phone". An NFC key-card coil sits over the charging area. No mm figure; the module is ~300 mm wide × 233 mm tall | Passive: aluminium alloy shell\[1\]\[7\] |
| Model Y L fan-cooled pad | 2025+ (China Model Y L); retrofit to Juniper | WC8 (FCC ID 2AEIM-WC8) | 50W driver / 30W passenger (ChargerLAB WC8 teardown: "50W + 30W dual-zone power" with "active turbine cooling") | Not published | Not published. Same outline as the Juniper pad | Active: one fan per charging position, vents blowing across the back and sides of the phone\[8\] |

### What is verified, and what is anecdote

**Verified (teardowns, FCC filings, official documents):**
- **WC3:** ChargerLAB's teardown of the "Tesla Model Y 15W Wireless Charging Module" (label: WC3, 13.5V 4A input, 15W max) shows "a wireless charging coil on the top and a metal plate covering the PCB below". It reports "Each wireless charging area has two coils", with dedicated "switching MOSFETs … used to switch between two coils". The controller is NXP's MWCT1213AVLH, a Qi 1.2.4 automotive multi-coil transmitter.\[2\] Because the coils are switched rather than both driven at once, the charger picks whichever coil couples better. That gives some tolerance for placement, but not much.
- **WC5:** ChargerLAB's WC5 teardown found "two wireless charging coils on the left and right" and "Each charging position has two coils stacked together to increase the charging area".\[1\] It also found an NFC coil "in the area corresponding to the wireless charging", which is why Tesla's manual says to tap the key card on the charger.\[1\]
- **FCC:** Tesla's WC3 filing (2AEIM-WC3, granted Aug 2020, Class II change Mar 2021, 127.72–132.72 kHz) includes internal photos. But the schematics, block diagram and operational description are held confidential, and the public text gives no coil dimensions.\[9\]\[10\] The WC5 filing lists internal photos that public mirrors do not host.\[11\]
- **Tesla Owner's Manual (Model Y):** up to 15W. "The phone must be in direct contact with the wireless charger". It "may not work if your phone case is too thick or is made of metal". Remove NFC cards, and pads can be turned off under Controls > Charging > Wireless Phone Charging Pads.\[12\]\[13\]\[14\]
- **Tesla Service Manual:** wireless charger modules in cars built after March 3, 2024 sit on a screw-secured dock; earlier ones use a clip-secured dock.\[15\]

**Forum anecdote and accessory-maker claims (directional only):**
- One TMC owner says the coils are "low and center" on each side, citing a teardown video.\[16\]
- Another TMC owner thinks the "charging rings [are] a bit too low" for big-camera-bump iPhones.\[16\] That is an opinion, not a measurement.
- A third TMC owner fixed an iPhone 13 Pro in a case by gently pressing it "into the bottom crease of the charger shelf".\[17\] A thick phone-plus-case can rest on top of the ledge lip instead of seating fully.
- Galaxy Z Flip spacers (Thingiverse, Etsy) say the Flip's coil is "positioned too low to charge in the Tesla Model 3/Y (2021 refresh)". The Etsy spacer raises the phone 16 mm, with a 26 mm option recommended for the Flip7.\[18\]\[19\]\[20\]
- **Treat with suspicion:** one troubleshooting site (Vehiclers) claims each charging zone is "approximately 70mm x 140mm", that the coil sits "30mm from the phone's bottom edge on iPhones", and lists on-screen error codes like "WCH_001".\[21\] None of this matches teardown evidence or Apple's design, and I found no corroboration.

## Details

### How to tell which generation you have
- **Piano-black console with flip-up lids, rubberized pad with a cable running into console storage:** original 2020–early 2021 car.\[6\]
- **Matte console with sliding cover, stitched sides, microfiber (alcantara-like) pad:** WC3 era, built from roughly February 2021 to early 2025. Cars.com confirms the change happened mid-model-year 2021. A 2021 model-year car can therefore have either console.\[6\]
- **Juniper (2025+ refresh, new light bar and interior):** WC5 pad, with a raised divider "bump" between the two bays and the key-card reader built in.\[1\]\[22\]
- **Fan-cooled pad (visible vents, fans audible at high load):** WC8 from the Model Y L. Per Not a Tesla App (June 5, 2026), Michał Gapiński fitted it to a Juniper Model Y Premium and reported: "The retrofit worked, no issues… does not boil the phone even when it is 30 degrees outside." However, Tesla Toolbox "wouldn't let him code the part replacement", the part costs under US$200 in China, and the retrofit does not work on the Standard trim. In a July 30, 2026 exclusive citing "a trusted source", Not a Tesla App reported that "Tesla will add its actively cooled wireless phone charger, originally introduced in the Model Y L, to the rest of its vehicle lineup" (without Qi2). Teslascope and Sawyer Merritt said on July 31, 2026 that it "will not be coming to the United States at this time." Tesla's June 2 US announcement listed "Upgraded 50W wireless charging pads w/ active cooling". Even so, autoevolution (Aug 4, 2026) reports that "The US-made Model Y L doesn't have the cooled inductive charging pads that Chinese customers enjoy," and Teslarati's launch-event coverage says "Tesla confirmed that it does not come with the cooled pads as the Y L in China does."

### Where the coil sits in your phone
- **iPhone 8 through 16 series:** the receiving coil is in the middle of the back. On iPhone 11 and later it is centred behind the Apple logo, and on MagSafe models (12+) it is ringed by the MagSafe magnets. For reference, Apple's own MagSafe charger coil has an outer diameter of ≈39.3 mm (Apple design spec in an FCC filing).\[23\]\[24\]
- **iPhone 17 Pro:** before launch, leakers Majin Bu and Sonny Dickson reported (MacRumors, June 30, 2025) that "Apple's shifting the logo lower on the iPhone 17, most likely to align it with the MagSafe charging coil". Leaked cases showed a MagSafe ring with a break in it on the Pro models only, and the base iPhone 17 and Air were reported as unchanged. Check your own phone's MagSafe ring position.
- **Samsung Galaxy S and Google Pixel:** the coil is roughly central on the back. For Samsung it is often slightly above centre, near the Samsung wordmark (forum-level evidence; check your exact model).\[25\]\[26\]
- **Galaxy Z Flip (folded):** the coil sits low in the folded body, which is why it misses the Tesla pad without a spacer.\[18\]\[20\]
- **Why phone size matters:** with the phone resting on the ledge, a centred coil sits about half the phone's height above the ledge. That is roughly 73–74 mm for a ~147 mm "standard" iPhone and roughly 80 mm for a ~160 mm Pro Max. A case adds 1–2 mm. So a Pro Max's coil sits about 6 mm higher on the pad than a standard model's. This fits the 2020 Model Y spacer that lowered the ledge 3.25 mm to fix an iPhone 12 Pro Max.\[3\] Short phones (Mini, folded Flip) put the coil too low, and tall phones can put it too high.
- **Flipping the phone upside down** only changes the coil height if the coil is off-centre vertically (common on some Android phones and on big-camera-bump designs, where the bump also tilts the phone). That is why "flip it 180°" fixes some phones and does nothing for others.\[27\]\[28\] TMC owners report both outcomes.\[16\]\[29\]

### Practical positioning procedure
1. **Clear the interface.** Remove cards (especially NFC cards, which Tesla warns can be damaged), metal plates, pop-grips and very thick cases. Thin silicone, leather or MagSafe cases are generally fine. Cars.com's WC3-era car charged an iPhone 12 Pro even in an OtterBox Defender.\[6\]\[14\]
2. **Seat it fully.** Push the phone down until its bottom edge is in the crease of the ledge, not perched on the lip. If phone plus case is thick, check it isn't riding up.\[17\]
3. **Centre it in the bay**, left to right. On WC5 pads, use the raised divider bump as the reference.\[1\]
4. **Confirm charging on the phone itself.** Look for the iOS charging bolt or the Android wireless-charging indicator, then watch the battery percentage rise over 5–10 minutes. Intermittent connect/disconnect chimes mean misalignment.
5. **If it fails or cycles, change the height, not the sideways position.** Try the phone upside down. For short phones (Mini, Z Flip), raise the phone with a spacer; the commercial Z Flip spacer uses 16 mm or 26 mm.\[18\] For tall, thick phones, use a spacer that deepens or lowers the ledge (the 2020 Model Y design lowers it 3.25 mm and adds 6 mm of depth).\[3\]\[18\]
6. **Manage heat.** If the phone gets hot and pauses (TMC owners report iPhones pausing after 20–30 minutes), misalignment is the usual cause.\[16\] Tesla's position is that warmth is normal.\[30\] Use USB-C for fast charging, or disable the pads under Controls > Charging.\[13\]\[14\]\[31\]

## Recommendations
- **Standard-size iPhone, Galaxy S or Pixel:** seat the phone fully down and centred. That is the configuration the pad is evidently designed around, and the dual coils give a few millimetres of tolerance.
- **Pro Max, Ultra, or any phone in a thick case:** make sure it seats fully in the crease. If charging is flaky, try flipping it, then consider a ledge-lowering spacer.
- **Mini, Z Flip or other short phones:** expect to need a 16–26 mm spacer to lift the coil into the pad's zone.\[18\]
- **For sustained fast charging with an iPhone:** the factory Qi pads (WC3/WC5, and even the WC8) lack MagSafe/Qi2 magnetic alignment.\[32\] A MagSafe/Qi2 overlay or replacement (for example the TWRAPS dual MagSafe charger for 2021–2024 consoles, or a 3D-printed Qi2 mat from MakerWorld) fixes alignment completely, at the cost of extra cables.\[31\]\[33\]\[34\] On a Juniper Premium/Performance, the WC8 retrofit fixes heat but not alignment, and it needs coding that Tesla service may not do.\[32\]\[35\]
- **To get a real coil measurement for your own car:** slide a thin phone up the pad in 5 mm steps using a paper shim stack under its bottom edge, and note where charging starts and stops. The midpoint of that window is your pad's coil centre for your phone.

## Caveats
- No source I could access gives a ledge-to-coil distance or coil diameter for any Model Y pad. The height figures above are inferred from phone dimensions and spacer specs, not measured on the pad.
- The early 2020 pad's coil count and wattage are not confirmed by a teardown. Sources conflict between Tesla's own 5W-per-dock accessory spec and a reported 15W shared rating.\[4\]\[5\]
- Whether the two coils per side are arranged up the incline or side by side is not stated in teardown text. The photos exist but I could not verify them.
- Parts-site guides (go-parts) list part 1755100-00-x as fitting "2020–2023" Model Y. That conflicts with Cars.com's report that the refreshed console only arrived in early 2021.\[6\]\[27\] Confirm by VIN or EPC before buying a replacement module.
- ChargerLAB's WC8 teardown confirms "50W + 30W dual-zone power". Basenor notes that the 50W figure relies on proprietary fast-charging standards used by Huawei and Xiaomi phones, so iPhones and most other phones will not see it. Tesla's plans to bring the pad to more vehicles rest on Not a Tesla App's sourced exclusive, which Teslascope says excludes the US for now. They are not a Tesla specification for US cars.

## Sources

1. [Teardown of Tesla Wireless Phone Charger (WC5) - ChargerLAB - Chargers, Batteries, Cells, Power Banks, Gadget News and Reviews](https://www.chargerlab.com/teardown-of-tesla-wireless-phone-charger-wc5/)
2. [Teardown of Tesla Model Y 15W Wireless Charging Module - ChargerLAB - Chargers, Batteries, Cells, Power Banks, Gadget News and Reviews](https://www.chargerlab.com/teardown-of-tesla-model-y-15w-wireless-charging-module-2)
3. [Wireless charging phone spacer for 2020 Tesla Model Y by Gizmotoy](https://www.printables.com/model/140893-wireless-charging-phone-spacer-for-2020-tesla-mode)
4. [Model 3 Wireless Phone Charger](https://www.tesla.com/support/shop/model-3-wireless-phone-charger)
5. [Tesla Model Y includes a wireless phone charger as standard feature](https://www.teslarati.com/tesla-model-y-wireless-phone-charger/)
6. [The Tesla Model Y’s Wireless Phone Charger Works Well Now, But It Hasn’t Always | Cars.com](https://www.cars.com/articles/the-tesla-model-ys-wireless-phone-charger-works-well-now-but-it-hasnt-always-446463/)
7. [2024-2026 Tesla Model 3 & Model Y Wireless Charger USB Port Guide](https://www.go-parts.com/garage/usb-port-tesla-3-tesla-y-2024-2026)
8. [A Look at Tesla's Fan-Cooled Wireless Phone Charger and DIY Retrofit](https://teslahubs.com/blogs/tips/a-look-at-teslas-fan-cooled-wireless-phone-charger-and-diy-retrofit)
9. [FCC ID 2AEIM-WC3 - Wireless Phone Charger](https://fccid.io/2AEIM-WC3)
10. [2AEIM-WC3 - FCC ID](https://fcc.report/FCC-ID/2AEIM-WC3)
11. <https://fcc.report/FCC-ID/2AEIM-WC5>
12. [Interior Electronics](https://tesla.com/ownersmanual/2020_2024_modely/en_my/GUID-7F07443D-5107-4A5A-A9F1-E02FF14E4A9A.html)
13. [MODEL Y 2025+ OWNER'S MANUAL Software version: 2026.32 Qatar](https://www.tesla.com/ownersmanual/modely/en_qa/Owners_Manual.pdf)
14. [Model Y Owner's Manual](https://www.tesla.com/ownersmanual/modely/en_eu/GUID-A1DF67DE-94B4-4859-98B4-B0A5D342FAB3.html)
15. [Wireless Charger Module - Center Console (Remove and Replace)](https://service.tesla.com/docs/Model3/ServiceManual/2024/en-us/GUID-77C9EA81-8A06-435A-B3D7-A6133F5FD063.html)
16. [iPhones overheat when using console wireless charger on my Model Y](https://teslamotorsclub.com/tmc/threads/iphones-overheat-when-using-console-wireless-charger-on-my-model-y.284396/)
17. [2021 Model Y a Wireless charger problem](https://teslamotorsclub.com/tmc/threads/2021-model-y-a-wireless-charger-problem.244850/)
18. [Tesla Model 3, Model Y, Model X Charging Spacer for Samsung Galaxy Z Flip3, Flip4, Flip5, Flip7 - Etsy](https://www.etsy.com/listing/1504240868/tesla-model-3-model-y-model-x-charging)
19. [Tesla Model 3 Y charging spacer for Samsung Galaxy Z Flip3 Flip4 by osunick - Thingiverse](https://www.thingiverse.com/thing:4978402)
20. [🚗 Tesla Model 3 Y charging spacer for Samsung Galaxy Z Flip3 Flip4・Free 3D File for ・Cults](https://cults3d.com/en/3d-model/game/tesla-model-3-y-charging-spacer-for-samsung-galaxy-z-flip3-flip4)
21. [Tesla Phone Charger Not Working? Complete Troubleshooting Guide That Actually Works - Vehiclers](https://www.vehiclers.com/tesla/tesla-phone-charger-not-working/)
22. [MODEL Y 2025+ OWNER'S MANUAL Software version: 2026.32 North America](https://www.tesla.com/ownersmanual/modely/en_us/Owners_Manual.pdf)
23. [70\. Apple MagSafe Charger Module](https://fcc.report/FCC-ID/2AN72-A669/6396709.pdf)
24. [Qi and Magsafe - Everything an iPhone user needs to know about wireless charging](https://appleinsider.com/articles/21/01/01/qi-and-magsafe---everything-an-iphone-user-needs-to-know-about-wireless-charging)
25. [Wireless Charger Not Charging Your Phone? 7 Quick Fixes That Actually Work](https://www.s3semi.com/wireless-charger-not-charging-your-phone-quick-fixes/)
26. [Where is the wireless charging coil?](https://forums.androidcentral.com/threads/where-is-the-wireless-charging-coil.988830/)
27. [2020-23 Tesla Model Y & 2021-23 Model 3 Wireless Charger: Overheating and Charging Fixes](https://www.go-parts.com/garage/wireless-phone-charger-pad-module-tesla-y-tesla-3-2020-2023)
28. [How to Charge Phone in Tesla Model Y](https://www.tesery.com/blogs/tesla-tips/how-to-charge-phone-in-tesla-model-y)
29. [Is there any solution to the poor inductive phone charger behavior in Model Y?](https://teslamotorsclub.com/tmc/threads/is-there-any-solution-to-the-poor-inductive-phone-charger-behavior-in-model-y.306297/)
30. [Tesla Model Y Cooled Wireless Charger Retrofit Guide](https://www.erawish.com/blogs/tesla/tesla-model-y-l-cooled-wireless-charger-retrofit)
31. [Tesla’s Wireless Phone Chargers: A Hardware and Software Wishlist - Not a Tesla App](https://www.notateslaapp.com/news/3382/teslas-wireless-phone-chargers-a-hardware-and-software-wishlist)
32. [A Look at Tesla's Fan-Cooled Wireless Phone Charger and DIY Retrofit - Not a Tesla App](https://www.notateslaapp.com/news/4253/a-look-at-teslas-fan-cooled-wireless-phone-charger-and-diy-retrofit)
33. [Tesla QI2/Magsafe Charger Mat - Free 3D Print Model - MakerWorld](https://makerworld.com/en/models/636229-tesla-qi2-magsafe-charger-mat)
34. [MagSafe Compatible Dual Wireless Charger](https://twraps.com/products/2021-2023-tesla-model-3-y-magsafe-compatible-dual-wireless-charger)
35. [The Tesla Newswire on X: "The ventilated wireless charger from the Tesla Model Y L is fully compatible with the Model Y! ✅ Same size and form factor ✅ Requires parameter (not safety) to be activated ✅ Suggests Tesla could offer this charger in future Model Y Premium and Performance trims" / X](https://x.com/TeslaNewswire/status/2061843241532531171?lang=en)
