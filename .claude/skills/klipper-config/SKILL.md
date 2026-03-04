---
name: klipper-config
description: Klipper configuration editing conventions and safety rules. Invoke when modifying any .cfg or .conf file in this repository.
user-invocable: false
---

# Klipper Configuration Editing

You are editing Klipper 3D printer configuration files. These files directly control physical hardware — errors can damage printers.

## Before Any Edit

1. Read the target file AND the printer's `printer.cfg` to understand the [include] structure
2. Read AGENTS.md if you haven't already — it has printer-specific details
3. Identify which printer you're editing (voronica, hodad, smurf, mpmd, pruscilla)

## File Structure Rules

- `printer.cfg` is the root config; it uses `[include]` to pull in modular files
- **Never inline** configurations that are in separate included files
- **Never touch** the `SAVE_CONFIG` block (below `#*# <---------------------- SAVE_CONFIG ---------------------->`)
- Swappable hardware (hotend, extruder) uses comment/uncomment on `[include]` lines

## Macro Naming Conventions

| Type | Convention | Example |
|------|-----------|---------|
| Public macros | UPPER_CASE | `PRINT_START`, `HEAT_SOAK` |
| Private helpers | `_` prefix | `_HEATSOAK`, `_CG28` |
| LED macros | `led_` prefix, lowercase | `led_heating`, `led_standby` |

## Macro Syntax

- Parameters: `params.NAME|default(value)|type` (Jinja2)
- Always close blocks: `{% if %}` needs `{% endif %}`, `{% for %}` needs `{% endfor %}`
- Status messages: `RESPOND MSG="message"` (shown in web UI)
- Comments: use `#` for Klipper lines (preferred), `;` also works

## Hardware Safety — Do Not Change Without Explicit Confirmation

- `run_current` / `hold_current` — stepper motor currents (can overheat motors)
- `thermistor` — must match the physical sensor type
- `canbus_uuid` — unique per physical CAN device
- `endstop_pin` / `diag_pin` — endstop wiring
- `rotation_distance` — calibrated per extruder/axis
- `z_offset` (in SAVE_CONFIG) — probe offset, critical for bed safety
- PID values (in SAVE_CONFIG) — calibrated per heater at specific conditions

## Pin References

- **Voronica**: Uses `spider_aliases.cfg` symbolic names (`X_Step`, `HE_BED`, `FAN2`)
- **Voronica TinyFan**: Has its own `[board_pins tinyfan]` section
- **Hodad**: Uses `bigtreetech-skr-pico-v1.0.cfg` mappings

## Printer-Specific Notes

### Voronica (Voron 2.4 350mm)
- PRINT_START params: `BED`, `HOTEND`, `CHAMBER`, `BEDMESH`, `FORCE_QGL`, `COLORS`
- CAN bus: Spider 2.2 as USB-CAN bridge, Mellow SB2040 toolhead
- Has Happy Hare MMU (mmu/ directory), KAMP, K-ShakeTune, LED effects
- MQTT integration with Home Assistant (in moonraker.conf)

### Hodad (Voron v0.2r1)
- PRINT_START params: `BED`, `EXTRUDER`, `CHAMBER` (note: `EXTRUDER` not `HOTEND`)
- CAN bus: BTT EBB36 toolhead
- Shared cleanup via `_FINALIZE_PRINT`
