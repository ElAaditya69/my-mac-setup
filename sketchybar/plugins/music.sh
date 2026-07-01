#!/bin/bash
PLAYER_STATE=$(osascript -e 'tell application "System Events" to set spaceToRun to exists process "Spotify"')
if [ "$PLAYER_STATE" = "true" ]; then
  STATE=$(osascript -e 'tell application "Spotify" to player state as string')
  if [ "$STATE" = "playing" ]; then
    TRACK=$(osascript -e 'tell application "Spotify" to name of current track')
    ARTIST=$(osascript -e 'tell application "Spotify" to artist of current track')
    sketchybar --set music label="$TRACK - $ARTIST" label.max_chars=12 scroll_texts=on
    exit 0
  fi
fi
sketchybar --set music label="Paused" scroll_texts=off label.max_chars=0
