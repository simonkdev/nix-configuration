#!/usr/bin/env bash

# Path to shader
SHADER="$HOME/.config/hypr/shaders/grayscale.glsl"
WALLPAPER="$HOME/nixsys/wallpapers/porsche-tokyo-uw.png"
WALLPAPER_DEF="$HOME/nixsys/wallpapers/gruv-wallpaper.png"

# Check active shader
if hyprshade current | grep -q "grayscale"; then
    # Deactivate and Reload
    hyprshade off
    hyprctl reload
    brightnessctl set 100%


    hyprctl hyprpaper preload "$WALLPAPER"
    hyprctl hyprpaper wallpaper ",$WALLPAPER"
    waybar
    
else
    # ACTIVATES
    hyprshade on "$SHADER"

    pkill waybar
    hyprctl hyprpaper preload "$WALLPAPER_DEF"
    hyprctl hyprpaper wallpaper ",$WALLPAPER_DEF"
    
    brightnessctl set 37% 
    # Force E-ink visuals: No animations, no shadows, thin black borders
    hyprctl keyword animations:enabled 0
    # hyprctl keyword decoration:blur:enabled 0
    hyprctl keyword decoration:rounding 0
    # hyprctl keyword general:gaps_in 0
    # hyprctl keyword general:gaps_out 0
    hyprctl keyword general:border_size 2
    hyprctl keyword general:col.active_border "rgba(000000ff)"
    hyprctl keyword general:col.inactive_border "rgba(000000ff)"
    hyprctl keyword decoration:dim_inactive 0
    
fi