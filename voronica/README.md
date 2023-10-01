<img align="left" width=100 src="../docs/images/FYSETC-VORON-2-4-V2-4-350x350x350mm-CoreXY-High-Quality-3D-Printer-Kit.jpg" />

# voronica

FYSETC Voron 2.4 Kit with 2.4R2 mods applied. Slice Mosquito Magnum hotend, option to switch to Revo. SB2040 CAN bus toolhead

## Modifications

Slice Mosquito Magnum. E3D Revo V6 option. RP2040 CAN bus toolhead. FYSETC CAN-bus adapter for Spider.

## Notes

Parts all printed on Pruscilla.

* [Klipper Spider Config](https://github.com/VoronDesign/Voron-2/blob/Voron2.4/firmware/klipper_configurations/Spider/Voron2_Spider_Config.cfg)
* [Klipper Install and Update Helper](https://github.com/th33xitus/kiauh)
* [FYSETC Voron 2 Repo](https://github.com/FYSETC/FYSETC-Voron-2)
* [FYSETC Kit BOM](https://github.com/FYSETC/FYSETC-Voron-2/blob/main/BOM.md)
* [FYSETC Spider Pinout](https://github.com/FYSETC/FYSETC-SPIDER/blob/main/Spider_V2.2_Pinout.pdf)
* [Voron Sourcing Guide](https://vorondesign.com/sourcing_guide?model=V2.4)
# [Mellow SB2040 install](https://www.teamfdm.com/forums/topic/851-install-canboot-on-sb2040/#comment-5785)

## Mainboard

![FYSETC Spider 2.2 Mainboard Rear](spider2.2-board-rear.jpeg)

## Operations

### Klipper firmware updates

One of the annoying things about Klipper is that updating the MCUs isn't an easy task. Each MCU has to be compiled individually, and this can clobber your firmware configuration files if you're not careful.

In the klipper-build directory, I keep some of the menuconfig output for the various MCUs.

#### Spider

Board must be in DFU in order to flash.

0. `sudo service klipper stop`
1. Install jumper between BT0 and 3.3V
2. Press reset button on right hand side by Pi
3. Verify the spider shows up in `lsusb` output. Should be something like: 
```
~/klipper  ‹master*› $ lsusb | grep DFU
Bus 001 Device 005: ID 0483:df11 STMicroelectronics STM Device in DFU Mode
```
4. Perform the build and flash.
```
cd ~/klipper
FLASH_DEVICE="0483:df11"
KCONFIG_DIR="${HOME}/printer_data/config/klipper-build"
_kc="${KCONFIG_DIR}/config.spider"
make clean KCONFIG_CONFIG="${_kc}"
make menuconfig KCONFIG_CONFIG="${_kc}"
make KCONFIG_CONFIG="${_kc}"
make flash FLASH_DEVICE="${FLASH_DEVICE}" KCONFIG_CONFIG="${_kc}"
```
5. Remove jumper
6. Press reset button
7. Verify board shows up in `lsusb` output again
```
~/klipper  ‹master*› $ lsusb | grep CAN
Bus 001 Device 008: ID 1d50:606f OpenMoko, Inc. Geschwister Schneider CAN adapter
```
8. Start klipper