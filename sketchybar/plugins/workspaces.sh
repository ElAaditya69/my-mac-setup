#!/bin/bash

# Get all spaces and active space
SPACES=$(yabai -m query --spaces | jq -r '.[].index' | sort -n)
ACTIVE=$(yabai -m query --spaces --space | jq -r '.index')

# Build the workspace string
OUTPUT=""
for sid in $SPACES; do
    HAS=$(yabai -m query --spaces --space $sid 2>/dev/null | jq -r '.windows | length')
    
    if [ "$sid" = "$ACTIVE" ]; then
        # Active space - green
        OUTPUT="${OUTPUT}%{F#FF30D68C}${sid}%{F#FFCDD6F4} "
    elif [ "$HAS" -gt 0 ]; then
        # Has windows - light gray
        OUTPUT="${OUTPUT}%{F#FFAAAAAA}${sid}%{F#FFCDD6F4} "
    else
        # Empty - dark gray
        OUTPUT="${OUTPUT}%{F#FF666666}${sid}%{F#FFCDD6F4} "
    fi
done

sketchybar --set workspaces label="$OUTPUT"
