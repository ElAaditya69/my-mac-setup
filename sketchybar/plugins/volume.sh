#!/bin/bash
VOL=$(osascript -e 'output volume of (get volume settings)' 2>/dev/null)
MUTED=$(osascript -e 'output muted of (get volume settings)' 2>/dev/null)
if [ "$MUTED" = "true" ] || [ "$VOL" = "0" ] || [ -z "$VOL" ]; then ICON="󰖁"; COLOR="0xFF666666"
else
    if [ "$VOL" -ge 70 ]; then ICON="󰕾"; elif [ "$VOL" -ge 30 ]; then ICON="󰖀"; else ICON="󰕿"; fi
    COLOR="0xFFFFD700"; fi
sketchybar --set volume icon="$ICON" label="${VOL}%" icon.color="$COLOR" label.color="$COLOR"
