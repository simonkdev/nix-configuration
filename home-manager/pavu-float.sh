#!/bin/bash

# Launch pavucontrol
env GDK_BACKEND=x11 pavucontrol &

# Wait for window to appear
sleep 0.3

# Get window ID
wid=$(hyprctl clients | grep -A 10 "pavucontrol" | grep 'windowID' | awk '{print $2}')

# Get monitor info
read -r X Y WIDTH HEIGHT <<< $(hyprctl monitors -j | jq -r '.[0] | "\(.x) \(.y) \(.width) \(.height)"')

# Set desired position (right-top corner, a bit below Waybar, e.g., y+30)
WIN_WIDTH=500
WIN_HEIGHT=400
WAYBAR_HEIGHT=30  # Adjust if your bar is taller

POS_X=$((X + WIDTH - WIN_WIDTH - 10))  # 10px margin
POS_Y=$((Y + WAYBAR_HEIGHT + 10))      # below the bar

# Move the window
hyprctl dispatch movewindowpixel exact "$POS_X $POS_Y"
