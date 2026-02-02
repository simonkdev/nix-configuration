#!/usr/bin/env bash

set -e

if [ -z "$1" ]; then
  echo "Usage: $0 <image_path>"
  exit 1
fi

IMG="$1"

hyprctl hyprpaper preload "$IMG" && sleep 0.5 && hyprctl hyprpaper wallpaper ,"$IMG"
