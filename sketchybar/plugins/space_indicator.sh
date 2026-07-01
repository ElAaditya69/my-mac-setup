#!/bin/bash
if [ "$SENDER" == "forced" ] || [ "$SENDER" == "space_change" ] || [ "$SENDER" == "window_change" ] || [ "$SENDER" == "front_app_switched" ]; then
  ALL_SPACES=$(yabai -m query --spaces | jq -r '.[].index')
  ACTIVE=$(yabai -m query --spaces --space | jq -r '.index')
  for i in $ALL_SPACES; do
    sketchybar --query space.$i >/dev/null 2>&1
    if [ $? -eq 0 ]; then
      if [ "$i" = "$ACTIVE" ]; then
        sketchybar --set space.$i icon.color=0xFF30D68C
      else
        HAS=$(yabai -m query --spaces --space $i 2>/dev/null | jq -r '.windows | length')
        if [ "$HAS" -gt 0 ]; then
          sketchybar --set space.$i icon.color=0xFFAAAAAA
        else
          sketchybar --set space.$i icon.color=0xFF666666
        fi
      fi
    fi
  done
fi
