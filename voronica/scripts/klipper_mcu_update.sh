#!/bin/bash

KCONFIG_DIR="${HOME}/printer_data/config/klipper-build"

sudo service klipper stop

cd ~/klipper
git pull

# Build spider
FLASH_DEVICE="0483:df11"
_kc="${KCONFIG_DIR}/config.spider"
make clean KCONFIG_CONFIG="${_kc}"
make menuconfig KCONFIG_CONFIG="${_kc}"
make KCONFIG_CONFIG="${_kc}"
make flash FLASH_DEVICE="${FLASH_DEVICE}" KCONFIG_CONFIG="${_kc}"

# Repeat for Raspi
#_kc="${KCONFIG_DIR}/config.rpi"
#make menuconfig KCONFIG_CONFIG="$_kc"
#make flash KCONFIG_CONFIG="$kc"

# Repeat for SB2040
