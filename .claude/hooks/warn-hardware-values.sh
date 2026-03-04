#!/bin/bash
# Hook: Warn when editing hardware-critical values in Klipper configs.
# These values are tuned for specific physical hardware and should not be
# changed without understanding the implications.

INPUT="$CLAUDE_TOOL_INPUT"

# Only check .cfg files
FILE=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('file_path',''))" 2>/dev/null)
if [ -z "$FILE" ]; then
  exit 0
fi
case "$FILE" in
  *.cfg) ;;
  *) exit 0 ;;
esac

NEW_STRING=$(echo "$INPUT" | python3 -c "import sys,json; d=json.load(sys.stdin); print(d.get('new_string',''))" 2>/dev/null)

WARNINGS=""

if echo "$NEW_STRING" | grep -qiE "(run_current|hold_current)"; then
  WARNINGS="${WARNINGS}- Stepper motor current values (run_current/hold_current) are being changed\n"
fi

if echo "$NEW_STRING" | grep -qi "canbus_uuid"; then
  WARNINGS="${WARNINGS}- CAN bus UUID is being changed (hardware-specific identifier)\n"
fi

if echo "$NEW_STRING" | grep -qi "thermistor"; then
  WARNINGS="${WARNINGS}- Thermistor type is being changed (must match physical sensor)\n"
fi

if echo "$NEW_STRING" | grep -qiE "(endstop_pin|diag_pin)"; then
  WARNINGS="${WARNINGS}- Endstop/diagnostic pin assignment is being changed\n"
fi

if echo "$NEW_STRING" | grep -qi "rotation_distance"; then
  WARNINGS="${WARNINGS}- Rotation distance is being changed (calibrated to specific hardware)\n"
fi

if [ -n "$WARNINGS" ]; then
  echo "WARNING: Hardware-critical values are being modified:" >&2
  echo -e "$WARNINGS" >&2
  echo "Verify the physical hardware setup matches these changes." >&2
fi

exit 0
