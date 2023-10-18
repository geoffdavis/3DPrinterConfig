<img align="left" width=100 src="../docs/images/mpmd-logo.png" />

# MPMD "Smurf"

Monoprice MiniDelta v1 2019-era with the higher resolution stepper motors.
Converted to an SKR Pico 1.0 with a RPi 3
<br />
<br />

## Modifications

* Binder Clip Bed Mod
* Wham-Bam Flex Build plate
* Crap catchers on towers
* Stiffer spring rate extruder - CR-10 clone
* Klipper Firmware
* E3D Revo hotend with custom effector based on [ksihota's MPMD E3D V6 Effector](https://www.thingiverse.com/thing:4855333), modified for Revo micro heatsing
* SKR Pico 1.0 Main board
* Waveshare 3.5 inch touchscreen for raspberry pi
* higher wattage power supply in raised base, [slobrohim's Monoprice Mini Delta Power Supply Base](https://www.thingiverse.com/thing:4786403). Had to attack it with some plastic cutters to get the raspberry pi to fit. Using the Meanwell LRS-150-12 instead of slobrohim's recommended LRS-150-24, as I didn't want to upgrade the heater pad on the bed to 24VDC. It's a small enough printer that I don't see the need to go 24V, and this way I can print off a car battery if I want later.
* BTT Smart Filament sensor
* [LED ring light at top of case.](https://www.thingiverse.com/thing:4284397) run off of the SKR Pico Neopixel bus.

## Notes

I could not get the stock optical end-stops to work at all. I may have nuked them by sending them 5V instead of 3.3 v. I tried another set from the MP Mini Delta V2 and had similar lack of luck.

Attemped using the TMC2209 virtual endstops with the printed endstop replacements from https://www.prusaprinters.org/prints/113166-mpmd-frame-mods

Found that it wasn't as reliable as I'd like - even with endstop phase turned on, tuning the virtual endstops was an exercise in frustration. Switched to Lerge optical endstops using custom parts found on the Facebook group for the MPMD:

* https://www.facebook.com/groups/mpminideltaowners/permalink/3501827253166069/
* https://www.facebook.com/groups/mpminideltaowners/permalink/3500216336660494/
* https://www.facebook.com/groups/mpminideltaowners/permalink/3487387884610006/