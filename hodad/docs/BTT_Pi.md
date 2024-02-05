# BigTreeTech Pi Notes

## Dallas 1-wire

* DS18B20 on BigTreeTech Pi: https://gist.github.com/mdvorak/2fccca3fa9f76f5a2e11e567797c76d6
* One-wire kernel module compilation instructions: https://github.com/pstolarz/w1-gpio-cl#readme

## BTT Pi Pins

Overflow sensors are hooked into the BTT Pi 24-pin header

| Pin # | Pin Name | Description |
| ----- | -------- | ----------- |
| 1 | 3.3V | DS18B20 VCC |
| 3 | PC3 | N/C (reserved for ADXL Header) |
| 5 | PC0 | N/C (reserved for ADXL Header) |
| 7 | PC7 (GPIO71) | DS18B20 One-wire data |
| 9 | GND | DS18B20 Ground |
| 11 | PC14 | NC |
| 13 | PC12 | NC |
| 15 | PC10 | NC |
| 17 | 3.3V | BTT SFS2.0 VCC |
| 19 | PH7 (GPIO231) | BTT SFS2.0 Switch Sensor |
| 21 | PH8 (GPIO232) | BTT SFS2.0 Motion Sensor |
| 23 | PH6 (GPIO23) | NC |
| 25 | GND | BTT SFS2.2 GND |
| 27 | PC2 (GPIO66) | N/C (reserved for ADXL Header) |
| 29 | PC4 (GPIO68) | N/C (reserved for ADXL Header) |
| 31 | PI5 (GPIO261) | MOSFET 4 |
| 33 | PI14 (GPIO270) | MOSFET 3 |
| 35 | PC6 (GPIO70) | MOSFET 2 |
| 37 | PC15 (GPIO79) | MOSFET 1 |
| 39 | GND | MOSFET Input Ground |
| 2 | 5V | From SKR Pico 5V |
| 4 | 5V | From SKR Pico 5V |
| 6 | GND | From SKR Pico GND |
| 8 | TX | To SKR Pico RX |
| 10 | RX | To SKR Pico TX |
| 12 | PC13 | NC |
| 14 | GND | NC |
| 16 | PC11 | NC |
| 18 | PC9 | NC |
| 20 | GND | NC |
| 22 | PG13 | NC |
| 24 | PG12 | NC |
| 26 | PI9 | NC |
| 28 | PI10 (Blue, EEPROM?) | NC |
| 30 | GND | NC |
| 32 | PI6 | NC |
| 34 | GND | NC |
| 36 | PG11 | NC |
| 38 | PH4 | NC |
| 40 | PC8 | NC |

###
```none
biqu@hodad:~/3DPrinterConfig$ sudo cat /sys/kernel/debug/pinctrl/300b000.pinctrl/pinmux-pins
Pinmux settings per pin
Format: pin (name): mux_owner|gpio_owner (strict) hog?
pin 0 (PA0): device 5030000.ethernet function emac1 group PA0
pin 1 (PA1): device 5030000.ethernet function emac1 group PA1
pin 2 (PA2): device 5030000.ethernet function emac1 group PA2
pin 3 (PA3): device 5030000.ethernet function emac1 group PA3
pin 4 (PA4): device 5030000.ethernet function emac1 group PA4
pin 5 (PA5): device 5030000.ethernet function emac1 group PA5
pin 6 (PA6): device 5030000.ethernet function emac1 group PA6
pin 7 (PA7): device 5030000.ethernet function emac1 group PA7
pin 8 (PA8): device 5030000.ethernet function emac1 group PA8
pin 9 (PA9): device 5030000.ethernet function emac1 group PA9
pin 10 (PA10): device 5002c00.i2c function twi3 group PA10
pin 11 (PA11): device 5002c00.i2c function twi3 group PA11
pin 12 (PA12): device soc:pwm5@0300a000 function pwm5 group PA12
pin 64 (PC0): UNCLAIMED
pin 65 (PC1): UNCLAIMED
pin 66 (PC2): UNCLAIMED
pin 67 (PC3): UNCLAIMED
pin 68 (PC4): UNCLAIMED
pin 69 (PC5): UNCLAIMED
pin 70 (PC6): UNCLAIMED
pin 71 (PC7): GPIO 300b000.pinctrl:71
pin 72 (PC8): UNCLAIMED
pin 73 (PC9): UNCLAIMED
pin 74 (PC10): UNCLAIMED
pin 75 (PC11): UNCLAIMED
pin 76 (PC12): UNCLAIMED
pin 77 (PC13): UNCLAIMED
pin 78 (PC14): UNCLAIMED
pin 79 (PC15): GPIO 300b000.pinctrl:79
pin 80 (PC16): UNCLAIMED
pin 160 (PF0): device 4020000.mmc function mmc0 group PF0
pin 161 (PF1): device 4020000.mmc function mmc0 group PF1
pin 162 (PF2): device 4020000.mmc function mmc0 group PF2
pin 163 (PF3): device 4020000.mmc function mmc0 group PF3
pin 164 (PF4): device 4020000.mmc function mmc0 group PF4
pin 165 (PF5): device 4020000.mmc function mmc0 group PF5
pin 166 (PF6): GPIO 300b000.pinctrl:166
pin 192 (PG0): device 4021000.mmc function mmc1 group PG0
pin 193 (PG1): device 4021000.mmc function mmc1 group PG1
pin 194 (PG2): device 4021000.mmc function mmc1 group PG2
pin 195 (PG3): device 4021000.mmc function mmc1 group PG3
pin 196 (PG4): device 4021000.mmc function mmc1 group PG4
pin 197 (PG5): device 4021000.mmc function mmc1 group PG5
pin 198 (PG6): UNCLAIMED
pin 199 (PG7): UNCLAIMED
pin 200 (PG8): UNCLAIMED
pin 201 (PG9): UNCLAIMED
pin 202 (PG10): UNCLAIMED
pin 203 (PG11): UNCLAIMED
pin 204 (PG12): UNCLAIMED
pin 205 (PG13): UNCLAIMED
pin 206 (PG14): UNCLAIMED
pin 207 (PG15): GPIO 300b000.pinctrl:207
pin 208 (PG16): UNCLAIMED
pin 209 (PG17): UNCLAIMED
pin 210 (PG18): GPIO 300b000.pinctrl:210
pin 211 (PG19): UNCLAIMED
pin 224 (PH0): device 5000000.serial function uart0 group PH0
pin 225 (PH1): device 5000000.serial function uart0 group PH1
pin 226 (PH2): UNCLAIMED
pin 227 (PH3): UNCLAIMED
pin 228 (PH4): UNCLAIMED
pin 229 (PH5): UNCLAIMED
pin 230 (PH6): UNCLAIMED
pin 231 (PH7): UNCLAIMED
pin 232 (PH8): UNCLAIMED
pin 233 (PH9): UNCLAIMED
pin 234 (PH10): UNCLAIMED
pin 256 (PI0): UNCLAIMED
pin 257 (PI1): UNCLAIMED
pin 258 (PI2): UNCLAIMED
pin 259 (PI3): UNCLAIMED
pin 260 (PI4): UNCLAIMED
pin 261 (PI5): UNCLAIMED
pin 262 (PI6): UNCLAIMED
pin 263 (PI7): UNCLAIMED
pin 264 (PI8): UNCLAIMED
pin 265 (PI9): UNCLAIMED
pin 266 (PI10): UNCLAIMED
pin 267 (PI11): UNCLAIMED
pin 268 (PI12): UNCLAIMED
pin 269 (PI13): UNCLAIMED
pin 270 (PI14): UNCLAIMED
pin 271 (PI15): UNCLAIMED
pin 272 (PI16): UNCLAIMED
```