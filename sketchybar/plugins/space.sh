#!/bin/bash
# space.sh - Highlight active space
source "$CONFIG_DIR/colors.sh"

if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME background.color=$AMBER icon.color=$BLACK
else
  sketchybar --set $NAME background.color=0x00000000 icon.color=$WHITE
fi
