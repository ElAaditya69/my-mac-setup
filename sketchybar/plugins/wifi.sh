#!/bin/bash
# wifi.sh
SSID=$(airport -I 2>/dev/null | awk '/ SSID/ {print substr($0, index($0, $2))}')
if [ -z "$SSID" ]; then
  SSID=$(networksetup -getairportnetwork en0 | cut -d ":" -f2 | sed 's/^ *//')
fi
if [ -z "$SSID" ] || [ "$SSID" = "You are not associated with an AirPort network." ]; then
  sketchybar --set $NAME icon=睊 icon.color=$DARK_GREY label="off"
else
  sketchybar --set $NAME icon= icon.color=$AMBER label="$SSID"
fi
