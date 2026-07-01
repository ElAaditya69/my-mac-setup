#!/bin/bash
BOOT_TIME=$(sysctl -n kern.boottime | awk '{print $4}' | tr -d ',')
CURRENT_TIME=$(date +%s)
ELAPSED=$((CURRENT_TIME - BOOT_TIME))
HOURS=$((ELAPSED / 3600))
MINUTES=$(((ELAPSED % 3600) / 60))
sketchybar --set $NAME label="${HOURS}h ${MINUTES}m"
