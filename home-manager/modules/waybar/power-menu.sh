#!/bin/bash

options=$(cat <<EOF
⏻ Shutdown
↻ Reboot
EOF
)

choice=$(echo -e "$options" | wofi --dmenu --markup --prompt "Power menu:" --location=topright)

case "$choice" in
  *Shutdown)
    systemctl poweroff
    ;;
  *Reboot)
    systemctl reboot
    ;;
esac

