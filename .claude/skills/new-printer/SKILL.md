---
name: new-printer
description: Set up a new printer directory with proper structure, README, gitignore, and root README update
disable-model-invocation: true
---

# Add a New Printer

Set up a new printer directory following the established repository conventions.

## Required Information

Ask the user for:
1. **Printer name** (lowercase, used as directory name)
2. **Model** (e.g., "Voron 2.4 350mm", "Voron v0.2r1")
3. **Mainboard** (e.g., "BTT SKR Pico", "FYSETC Spider 2.2")
4. **Toolhead MCU** (if CAN bus, e.g., "BTT EBB36", "Mellow SB2040")
5. **Firmware** (default: Klipper)
6. **Web UI** (default: Mainsail)
7. **Status** (ACTIVE or RETIRED, default: ACTIVE)

## Steps

### 1. Create directory structure

```
{printer_name}/
├── README.md
├── klipper/
│   ├── printer.cfg
│   ├── .gitignore
│   ├── macros/
│   ├── hotend/
│   └── lighting/
└── docs/
```

If CAN bus (toolhead MCU specified), also create:
```
{printer_name}/CANBUS/
```

### 2. Create klipper/.gitignore

```
printer-*.cfg
*.bkp
.variables.stb
moonraker.conf.backup
K-ShakeTune_results/
```

### 3. Create README.md

Use this template:
```markdown
# {Printer Name}

## Overview

| Property | Value |
|----------|-------|
| Model | {model} |
| Mainboard | {mainboard} |
| Toolhead MCU | {toolhead_mcu or "N/A"} |
| Firmware | {firmware} |
| Web UI | {web_ui} |
| Status | {status} |

## Modifications

_List hardware modifications here._

## Klipper Configuration

The `klipper/` directory contains the Klipper configuration files.
- `printer.cfg` — Main configuration (uses [include] for modular organization)

## Firmware Update

_Document firmware update procedure in `docs/Firmware_Update.md`._
```

### 4. Create starter printer.cfg

Include standard sections with TODO placeholders:
- `[mcu]` with serial/canbus_uuid placeholder
- `[printer]` with kinematics
- `[include]` directives for macros, hotend, lighting
- Comment noting SAVE_CONFIG block will be auto-generated

### 5. Update root README.md

Add the new printer to the printer table in `/README.md`.

### 6. Verify

- Confirm all files created
- Show the user the directory tree
- Remind them to fill in hardware-specific values (MCU serial, pin mappings, etc.)
