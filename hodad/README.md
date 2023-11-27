# Voron v0.2r1 "Hodad"

Formbot Voron v0.2R1 kit.
Minor mods installed for lighting.
Running a Revo Voron hotend

## Modifications

* Daylight on a matchstick
* Revo VORON left over from my 2.4
* MOSFET board hooked up to BTT Pi to power lighting
* DS18B20 one-wire thermistor hooked up to BTT Pi to work around lack of extra Analog thermistor ports on the SKR Pico
* Mapleleafmaker's handles
* Mapleleafmaker's Daylight on a Matchstick diffusers
* MandicReally's Hex Back panel
* Attempt at lighting Kirigami bed gone horribly wrong.

## Notes

I nuked the Neopixel on the SKR Pico. I have a klipper expander on order to fix this, though it's unnecessary bling solely to light up the bed Neopixel. The Voron V0Display has one Neopixel for status built in, and I'm running Matchsticks not Discosticks for case lighting and thus don't have too many neopixels in this thing.

The magnets that ship with the Formbot kit are not strong enough to hold the door closed through all of the foam and plastic between them. I had some stronger ones that _just_ barely hold the door closed now.

## Links

* Very helpful docs: https://github.com/SrgntBallistic/Formbot-V0
* Very helpful build log: FIXME
* DIS18B20 on BigTreeTech Pi: https://gist.github.com/mdvorak/2fccca3fa9f76f5a2e11e567797c76d6
* One-wire kernel module compilation instructions: https://github.com/pstolarz/w1-gpio-cl#readme
