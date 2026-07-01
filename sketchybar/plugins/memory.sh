#!/bin/bash
# memory.sh
MEM=$(vm_stat | awk '
  /Pages free/ { free=$3 }
  /Pages active/ { active=$3 }
  /Pages inactive/ { inactive=$3 }
  /Pages wired/ { wired=$3 }
  END {
    gsub(/\\./, "", free); gsub(/\\./, "", active); gsub(/\\./, "", inactive); gsub(/\\./, "", wired)
    total=(free+active+inactive+wired)*4096/1024/1024/1024
    used=(active+inactive+wired)*4096/1024/1024/1024
    printf "%.1f/%.1fG", used, total
  }
')
sketchybar --set $NAME label="$MEM"
