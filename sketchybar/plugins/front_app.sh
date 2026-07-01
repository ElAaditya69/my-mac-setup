#!/bin/bash
APP=$(yabai -m query --windows --window | jq -r '.app' 2>/dev/null || echo 'Desktop')
case "$APP" in
    "Safari") ICON="󰀇" ;; "Chrome") ICON="󰊯" ;; "Firefox") ICON="󰈹" ;; "Spotify") ICON="󰎆" ;;
    "Discord") ICON="󰙯" ;; "Terminal"|"kitty"|"iTerm2") ICON="󰆍" ;; "Finder") ICON="󰀶" ;;
    "Code"|"Visual Studio Code") ICON="󰨞" ;; "Xcode") ICON="󰘦" ;; "Slack") ICON="󰒱" ;;
    "Notion") ICON="󰎚" ;; "Obsidian") ICON="󱓧" ;; "Kimi") ICON="󰭹" ;; *) ICON="󰣆" ;;
esac
sketchybar --set front_app icon="$ICON" label="$APP"
