#!/bin/bash

# Target interface (en0 is standard for Mac built-in Wi-Fi)
INTERFACE="en0"

# Fetch initial network byte counters
INITIAL_DATA=$(netstat -I $INTERFACE -b | tail -n 1)
R1=$(echo $INITIAL_DATA | awk '{print $7}') # Bytes Received
T1=$(echo $INITIAL_DATA | awk '{print $10}') # Bytes Transmitted

# Pause for 1 second to calculate delta speed
sleep 1

# Fetch secondary network byte counters
SECONDARY_DATA=$(netstat -I $INTERFACE -b | tail -n 1)
R2=$(echo $SECONDARY_DATA | awk '{print $7}')
T2=$(echo $SECONDARY_DATA | awk '{print $10}')

# Calculate bytes per second
TBPS=$((T2 - T1))
RBPS=$((R2 - R1))

# Convert to Kilobytes per second
DOWN_KB=$(echo "scale=2; $RBPS / 1024" | bc)
UP_KB=$(echo "scale=2; $TBPS / 1024" | bc)

# Format the output text smoothly
# If speeds exceed 1024 KB, format as MB/s instead for clean bar space
if (( $(echo "$DOWN_KB > 1024" | bc -l) )); then
  DOWN_STR=$(echo "scale=2; $DOWN_KB / 1024" | bc)
  DOWN="$DOWN_STR""M"
else
  DOWN="$DOWN_KB""K"
fi

if (( $(echo "$UP_KB > 1024" | bc -l) )); then
  UP_STR=$(echo "scale=2; $UP_KB / 1024" | bc)
  UP="$UP_STR""M"
else
  UP="$UP_KB""K"
fi

# Ship the speeds directly back into your SketchyBar element layout
sketchybar --set $NAME label="↓$DOWN ↑$UP"
