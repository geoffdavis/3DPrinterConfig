# Voron v0.2r1 "Hodad"

## Overview

* Formbot Voron v0.2R1 kit.
* Minor mods installed for lighting.
* Running a Revo Voron hotend
* CAN Toolhead
* BTT Pi from kit died, running Raspberry Pi 4.

## Modifications

* Daylight on a matchstick
* Revo VORON left over from my 2.4
* full-width [DIN rail mount][DIN-mount] for BTT Pi, SKR Pico, and MOSFET board
* MOSFET board hooked up to BTT Pi to power lighting, bodged in place with a single screw to a low-profile DIN clip from the [DIN rail mount][DIN-mount] that I used.
* DS18B20 one-wire thermistor hooked up to BTT Pi to work around lack of extra Analog thermistor ports on the SKR Pico
* Mapleleafmaker's [Stealth handles][stealth-handles] on the sides
* loicloic's [Voron V0/V0.1/V0.2 Compact Handles][compact-handles] - single one only, on front of tophat to help open it.
* Mapleleafmaker's Daylight on a [Matchstick diffusers][matchstick-diffusers]
* Mapleleafmaker's [Upper Rear Bowden Inlet for BTT SFS 2.0])https://www.printables.com/model/408745-v0-upper-rear-bowden-inlet-urbi)
* MandicReally's [Voron Hex Mid panel][mr-hex-mid-panel]
* Attempt at lighting Kirigami bed gone horribly wrong.
* EBB36 CAN toolhead
* LDO Orbiter 2.0 extruder with ministealthorbiter toolhead
* Raspberry Pi 4 instead of BTT Pi

## Notes

I nuked the Neopixel on the SKR Pico. I have a klipper expander on order to fix this, though it's unnecessary bling solely to light up the bed Neopixel. The Voron V0Display has one Neopixel for status built in, and I'm running Matchsticks not Discosticks for case lighting and thus don't have too many neopixels in this thing.

The magnets that ship with the Formbot kit are not strong enough to hold the door closed through all of the foam and plastic between them. I had some stronger ones that _just_ barely hold the door closed now.

See also my old [notes for working with the BTT Pi.](docs/BTT_Pi.md)

## Links

* [Ballistic Tech's very helpful docs](https://github.com/SrgntBallistic/Formbot-V0)
* [Helpful build log](https://www.teamfdm.com/forums/topic/2178-my-first-voron-v02r1-formbot-kit/)

## Procedures

### Firmware Updates

See [Firmware Update](docs/Firmware_Update.md) docs for instructions on how to update Klipper on this thing.

[DIN-mount]: https://www.printables.com/model/381062-voron-v01-v02-din-rail-board-mounting-system
[stealth-handles]: https://www.printables.com/model/481575-v0-stealth-handles
[compact-handles]: https://www.printables.com/model/108428-voron-v0v01v02-compact-handles
[matchstick-diffusers]: https://www.printables.com/model/408214-matchstick-diffusers
[mr-hex-mid-panel]: https://thangs.com/designer/MandicReally/3d-model/Voron%20Hex%20Mid%20Panel%20-%20Accent%20your%200.2%21-960156?userName=model&modelIdentifier=960156