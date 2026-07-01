#!/bin/bash
# cpu.sh
CPU=$(top -l 2 -n 0 -F | grep "CPU usage" | tail -1 | awk '{print $3}' | sed 's/%//')
if [ -z "$CPU" ]; then
  CPU=$(ps -A -o %cpu | awk '{s+=$1} END {printf "%.0f", s}')
fi
sketchybar --set $NAME label="${CPU}%"
