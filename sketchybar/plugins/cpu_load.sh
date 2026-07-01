#!/bin/bash
CORE_LOAD=$(ps -A -o %cpu | awk '{s+=$1} END {printf "%.0f", s/8}')
if [ "$CORE_LOAD" -gt 100 ]; then CORE_LOAD="100"; fi
sketchybar --set $NAME label="${CORE_LOAD}%"
