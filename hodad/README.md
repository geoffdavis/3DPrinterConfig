# Voron v0.2r1 "Hodad"

## Overview

* Formbot Voron v0.2R1 kit.
* Minor mods installed for lighting.
* Running a Revo Voron hotend
* CAN Toolhead
* BTT Pi from kit died, running Raspberry Pi 4.

## Modifications

* EBB36 CAN toolhead
* Daylight on a matchstick, using Pico hotend heater port
* Revo VORON with higher watt heater
* full-width [DIN rail mount][DIN-mount] for Raspberry Pi, SKR Pico, and Mellow Fly UTOC
* DS18B20 one-wire thermistor hooked up to BTT Pi to work around lack of extra Analog thermistor ports on the SKR Pico (no longer necessary with EBB36 but it's already installed.)
* Mapleleafmaker's [Stealth handles][stealth-handles] on the sides
* loicloic's [Voron V0/V0.1/V0.2 Compact Handles][compact-handles] - single one only, on front of tophat to help open it.
* Mapleleafmaker's Daylight on a [Matchstick diffusers][matchstick-diffusers]
* Mapleleafmaker's [Upper Rear Bowden Inlet for BTT SFS 2.0](https://www.printables.com/model/408745-v0-upper-rear-bowden-inlet-urbi)
* MandicReally's [Voron Hex Mid panel][mr-hex-mid-panel]
* LDO Orbiter 2.0 extruder with ministealthorbiter toolhead
* Raspberry Pi 4 instead of BTT Pi

## Notes

I nuked the Neopixel on the SKR Pico, but the digital IO pin still works and external neopixels connected to the 3-pin connector seem to work fine.

The magnets that ship with the Formbot kit are not strong enough to hold the door closed through all of the foam and plastic between them. I had some stronger ones that _just_ barely hold the door closed now.

The BTTPi died - several USB ports are fried, the mini CAN bridge seems to have flaked out. Using a RPi4 now. See also my old [notes for working with the BTT Pi.](docs/BTT_Pi.md)

## Links

* [Ballistic Tech's very helpful docs](https://github.com/SrgntBallistic/Formbot-V0)
* [Helpful build log](https://www.teamfdm.com/forums/topic/2178-my-first-voron-v02r1-formbot-kit/)

## Procedures

### Auto-hotspot

For taking the printer for a walk.

Source: [Raspberry Pi Auto-hotspot script](https://www.raspberryconnect.com/projects/65-raspberrypi-hotspot-accesspoints/183-raspberry-pi-automatic-hotspot-and-static-hotspot-installer)

Credentials are here: https://start.1password.com/open/i?a=UTBHSLJPSZG3RFNHMSM7R33M5Q&v=bc7wt4pxbum4bnpctn4qy644kq&i=yu47wnudfyvpvn2owx57nrqn54&h=camiandgeoff.1password.com

### Firmware Updates

See [Firmware Update](docs/Firmware_Update.md) docs for instructions on how to update Klipper on this thing.

[DIN-mount]: https://www.printables.com/model/381062-voron-v01-v02-din-rail-board-mounting-system
[stealth-handles]: https://www.printables.com/model/481575-v0-stealth-handles
[compact-handles]: https://www.printables.com/model/108428-voron-v0v01v02-compact-handles
[matchstick-diffusers]: https://www.printables.com/model/408214-matchstick-diffusers
[mr-hex-mid-panel]: https://thangs.com/designer/MandicReally/3d-model/Voron%20Hex%20Mid%20Panel%20-%20Accent%20your%200.2%21-960156?userName=model&modelIdentifier=960156

### Bed leveling

The front-panel menu has a bed-leveling routine on it. It's a manual `bed_screws_adjust` process.

### Bed Z offset

```gcode
G28
G1 X55 Y55 F6000
Z_ENDSTOP_CALIBRATE
```
