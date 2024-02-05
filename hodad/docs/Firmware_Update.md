# Hodad Klipper Firmware Update Procedures

## SKR Pico

This MCU is connected via UART, updates must be done over USB.

### Step 1: Get unit in DFU mode
Connect USB-A-M to USB-C-M cable between host and MCU
Install boot jumper, then press reset button. Boot jumper is in the middle of the board, to the right of the power LED as mounted in the printer (closer to the TMC driver heatsink with the bigtreetech logo)
Verify that the device shows up in lsusb:

```
pi@hodad:~/klipper $ lsusb | grep RP2
Bus 001 Device 015: ID 2e8a:0003 Raspberry Pi RP2 Boot
```

### Step 2: Build firmware

Per [https://github.com/bigtreetech/SKR-Pico/tree/master/Klipper] set:
* Enable extra low-level configuration options
* Micro-controller Architecture = `Raspberry Pi RP2040`
* Communication interface = `Serial (on UART0 GPIO1/GPIO0)`

Run `make clean`
Run `make -j3`

### Step 3: Flash firmware

*NOTE* this requires that the unit be placed in DFU mode per step 1, above.

Run `make flash FLASH_DEVICE=2e8a:0003`

### Step 4: Remove boot jumper

Remove the boot jumper to the right of the power LED. Optionally, press the reset button (white button towards the top of the board as mounted in the printer)

## v0 Display board

This unit is connected via USB.

Docs: [https://github.com/VoronDesign/Voron-Hardware/blob/master/V0_Display/Documentation/Setup_and_Flashing_Guide.md]

### Step 1 - DFU mode

Install the boot jumper and reset the board. This will put the board into DFU mode.

The boot jumper is located on the top rear of the v0 display PCB, and is a real pain to access.

1. Remove the bottom panel - 2mm hex driver, round or square
2. Remove the v0 display with a round head 2 mm hex driver
3. install the boot jumper
4. Press reset
5. Verify it shows up in `lsusb`
```
pi@hodad:~/klipper $ lsusb | grep DFU
Bus 001 Device 022: ID 0483:df11 STMicroelectronics STM Device in DFU Mode
```

### Step 2 - Build firmware

Firmware settings:

* Enable extra low-level configuration options
* Micro-controller Architecture: `STMicroelectronics STM32`
* Processor model: `STM32F042`
* Bootloader offset: `No bootloader`
* Clock reference: `internal clock`
* Communication interface `USB (on PA9/PA10)`
* Optional features:
  a. Check `Support GPIO "bit-banging" devices`
  b. Check `Support LCD devices`
  c. Check `Support external sensor devices`
  d. Uncheck `Support lis2dw 3-axis accelerometer`
  e. Uncheck `Suppert software based I2C "bit-banging"`
  f. Check `Support software based SPI "bit-banging"`

Run `make clean`

### Step 3 - flash firmware

Run `make flash FLASH_DEVICE=0483:df11`

### Step 4 - Remove boot jumper

Remove the boot jumper and press the reset button

Verify that you now see one or more stm32f042x6 devices in lsusb, and that `/dev/serial/by-id/usb-Klipper_stm32f042x6_05001A000643564E32313720-if00` appears in `/dev/serial/by-id`

h5. Re-install display and bottom cover

Curse at no-drop nuts that still drop anyway.

This is best done with the printer completely inverted so that the nuts in the extrusion don't keep sliding around.

## Klipper Expander

Very similar to the V0 Display, same controller. Same recommended firmware settings.

[https://github.com/VoronDesign/Voron-Hardware/blob/master/Klipper_Expander/Documentation/Setup_and_Flashing_Guide.md]

### Step one - DFU mode

1. Install the boot jumper. Boot jumper is between the USB port and the DC input terminals.
2. Press the reset button. The reset button is next to the "n" in the "Voron Design" silkscreen.
3. Verify it shows up in `lsusb`
```
pi@hodad:~/klipper $ lsusb | grep DFU
Bus 001 Device 022: ID 0483:df11 STMicroelectronics STM Device in DFU Mode
```

*NOTE* as this is the same chip as the V0 display, make sure you only have one device in DFU mode at a time.

### Step two - compile firmware

Firmware settings (identical to V0 Display):

* Enable extra low-level configuration options
* Micro-controller Architecture: `STMicroelectronics STM32`
* Processor model: `STM32F042`
* Bootloader offset: `No bootloader`
* Clock reference: `internal clock`
* Communication interface `USB (on PA9/PA10)`
* Optional features:
  a. Check `Support GPIO "bit-banging" devices`
  b. Check `Support LCD devices`
  c. Check `Support external sensor devices`
  d. Uncheck `Support lis2dw 3-axis accelerometer`
  e. Uncheck `Suppert software based I2C "bit-banging"`
  f. Check `Support software based SPI "bit-banging"`

### Step 3 - flash firmware

Run `make flash FLASH_DEVICE=0483:df11`

### Step 4 - remove jumper and reset board

Verify no devices in DFU mode show in the `lsusb` output

Verify that the MCU shows up as `/dev/serial/by-id/usb-Klipper_stm32f042x6_08002300134330534E373720-if00`

## EBB36 Can Toolhead board

This unit has [katapult](https://github.com/Arksine/katapult) (formerly "Can-boot") installed.

### Step 1 - Verify CAN is working

Press the reset button on the back of the EBB36 toolhead board.

Run the following:

```
~/CanBoot/scripts/flash_can.py -i can0 -q
```

You should see output similar to:

```
pi@hodad:~ $ ~/katapult/scripts/flash_can.py -i can0 -q
Resetting all bootloader node IDs...
Checking for Katapult nodes...
Detected UUID: 12676b53cab4, Application: Klipper
Query Complete
```

Step 2: Compile firmware

```
cd ~/klipper
make menuconfig
```

Firmware settings:

* `Enable extra low-level configuration options`
* Micro-controller Architecture `STMicroelectronics STM32`
* Processor model: `STM32G0B1`
* Bootloader: `8KiB bootloader`
* Clock Reference: `8 MHz crystal`
* Communication interface: `CAN bus (on PB0/PB1)`
* CAN bus speed: `1000000` -- note that this must match setting in `/etc/network/interfaces.d/can0`
* GPIO pins to set at micro-controller startup: none

```
make clean
make -j3
```

### Step 3: Flash firmware over canbus

The UUID of the board is 12676b53cab4

```
python3 ~/katapult/scripts/flash_can.py -i can0 -f ~/klipper/out/klipper.bin -u 12676b53cab4
```

If all goes well, it should look like this:

```
python3 ~/katapult/scripts/flash_can.py -i can0 -f ~/klipper/out/klipper.bin -u 12676b53cab4
Sending bootloader jump command...
Resetting all bootloader node IDs...
Attempting to connect to bootloader
Katapult Connected
Protocol Version: 1.0.0
Block Size: 64 bytes
Application Start: 0x8002000
MCU type: stm32g0b1xx
Verifying canbus connection
Flashing '/home/pi/klipper/out/klipper.bin'...

[##################################################]

Write complete: 14 pages
Verifying (block count = 427)...

[##################################################]

Verification Complete: SHA = F836B5FC5E1BD91779D80950095C73C06F06593C
Flash Success
```
