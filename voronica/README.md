# voronica v2.4659

<img align="left" width=100 src="../docs/images/FYSETC-VORON-2-4-V2-4-350x350x350mm-CoreXY-High-Quality-3D-Printer-Kit.jpg" />

FYSETC Voron 2.4 Kit with 2.4R2 mods applied. Slice Mosquito Magnum hotend, option to switch to Revo. SB2040 CAN bus toolhead

## Modifications

* Slice Mosquito Magnum with Bondtech CHT nozzles
* Alternate - E3D Revo V6 option
* [Mellow RP2040 CAN bus toolhead](CANBUS/SB2040/)
* [FYSETC CAN-bus Expander for Spider](https://www.fysetc.com/products/fysetc-canbus-expander-module-for-spider-board)
* Finger ducting in wiring bay [similar to LDO kit](https://docs.ldomotors.com/en/voron/voron2/wiring_guide_rev_c)
* Parts-binned filtered AC inlet - Interpower 83510031. I designed a [custom skirt to hold it](STL/Voron%20Power%20Inlet%20-%20Interpower%20Filtered/README.md).

## Notes

Parts all printed on Pruscilla.

* [Klipper Spider Config](https://github.com/VoronDesign/Voron-2/blob/Voron2.4/firmware/klipper_configurations/Spider/Voron2_Spider_Config.cfg)
* [Klipper Install and Update Helper](https://github.com/th33xitus/kiauh)
* [FYSETC Voron 2 Repo](https://github.com/FYSETC/FYSETC-Voron-2)
* [FYSETC Kit BOM](https://github.com/FYSETC/FYSETC-Voron-2/blob/main/BOM.md)
* [FYSETC Spider Pinout](https://github.com/FYSETC/FYSETC-SPIDER/blob/main/Spider_V2.2_Pinout.pdf)
* [Voron Sourcing Guide](https://vorondesign.com/sourcing_guide?model=V2.4)
* [Mellow SB2040 install](https://www.teamfdm.com/forums/topic/851-install-canboot-on-sb2040/#comment-5785)

## Electronics Bay

Here's the electronics bay as of October of 2023.

![Bottom Electronics Bay with finger ducting](electronics_bay_duct.jpeg)

### Mainboard

FYSETC Spider 2.2

Rear view of the Spider board showing the pin mapping to the MCU:

![FYSETC Spider 2.2 Mainboard Rear](spider2.2-board-rear.jpeg)

There's a [mapping file of pins to symbolic names](klipper/spider_aliases.cfg) in the klipper configuration.

## Operations

### Toolhead changes

When replacing the hotend, the effective difference between the nozzle probe point and the TAP sensor can change. This was noted when replacing the Printables version of the Mosquito hotend holder with the Bondtech one that Slice recommended.

Do this with the `PROBE_CALIBRATE` command.

### Gantry maintenance

During initial assembly, plain old loctite Blue thread locker was used, but somewhat inconsistently. Several bolts worked their way loose as a result and the gantry got racked a bit, and the Z axis bearings came loose.

The bolts were replaced and VC3 thread-locker (as recommended by Annex Engineering) was applied to all of the bolts in the gantry.

#### De-racking and squaring

Following the procedures detailed in the Voron [V2 Gantry Squaring](https://docs.vorondesign.com/build/mechanical/v2_gantry_squaring.html) documentsion, I worked through reassembling the frame.

One problem noted was that the front idler bolts holding the pulleys were a bit loose, and this was adding mechanical noise. This is the big vertical bolt in the idler. The A side in particular was very loose.

#### Belt tensioning

Fiddling with belt tension is best done with a relative tension gauge, followed by `BELTS_SHAPER_CALIBRATION`

Per notes above, the idler pulley bolts in the front adjustable idlers need to be snug. Otherwise, weird vibrations result that can't be backed out with belt tension.

### Klipper firmware updates

See [Firmware Update](docs/Firmware_Update.md) docs for instructions on how to update Klipper on this thing.