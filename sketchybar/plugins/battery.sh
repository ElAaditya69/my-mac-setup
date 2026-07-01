#!/bin/bash

# Extract exact system battery capacity percentage
PERCENTAGE=$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1 | head -n 1)

# Check active power charging states
CHARGING=$(pmset -g batt | grep 'AC Power')

if [ -z "$PERCENTAGE" ]; then
  sketchybar --set $NAME label="N/A" icon=""
  exit 0
fi

# Pick the correct flat font icon based on percentage levels
if [ "$CHARGING" != "" ]; then
  ICON="  "
else
  if [ "$PERCENTAGE" -gt 80 ]; then ICON="";
  elif [ "$PERCENTAGE" -gt 60 ]; then ICON="";
  elif [ "$PERCENTAGE" -gt 40 ]; then ICON="";
  elif [ "$PERCENTAGE" -gt 20 ]; then ICON="";
  else ICON=""; fi
fi

# Ship the flat icon out cleanly in your signature green accent color
sketchybar --set $NAME label="${PERCENTAGE}%" icon="$ICON" icon.color=0xFFA6E3A1 label.color=0xFFA6E3A1
