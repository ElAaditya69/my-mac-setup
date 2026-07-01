#!/bin/bash
# Launch the 4-pane rice setup

# Start yabai if not running
yabai --start-service 2>/dev/null

# Launch kitty with session
kitty --session ~/.config/kitty/session.conf &
