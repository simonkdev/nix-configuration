#!/bin/bash

# Options with icons and markup (requires `allow-markup=true` in wofi config)
options=$(cat <<EOF
⏻ Shutdown
↻ Reboot
EOF
)

# Show menu
choice=$(echo -e "$options" | wofi --dmenu --markup --prompt "Power menu:")

# Handle choice
case "$choice" in
  *Shutdown)
    systemctl poweroff
    ;;
  *Reboot)
    systemctl reboot
    ;;
esac
