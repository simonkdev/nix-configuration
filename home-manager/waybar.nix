{ config, pkgs, lib, ... }:

let
  waybarSettings = {
    # Primary bar on laptop and DP-1
    outputs = [ "eDP-2" "DP-1" ];
    height  = 24;
    spacing = 4;

    # Modules positions
    modules-left   = [ "hyprland/workspaces" "cava" "hyprland/submap" "hyprland/scratchpad" ];
    modules-center = [ "hyprland/window" ];
    modules-right  = [ "mpris" "idle_inhibitor" "load" "wireplumber" "backlight" "clock" "battery" "tray" ];

    # Hyprland workspaces
    "hyprland/workspaces" = {
      all-outputs              = true;
      warp-on-scroll           = false;
      enable-bar-scroll        = true;
      disable-scroll-wraparound = true;
      format                   = "{icon}";
      "format-icons" = {
        "1"  = ""; "2" = ""; "3" = ""; "4" = ""; "5" = "";
        "9"  = ""; "10" = "";
      };
    };

    # Focused window title
    "hyprland/window" = {
      format        = "{title}";
      max-length    = 40;
      all-outputs   = true;
    };

    # Cava audio visualizer
    cava = {
      framerate         = 30;
      autosens          = 1;
      bars              = 14;
      lower_cutoff_freq = 50;
      higher_cutoff_freq = 10000;
      method            = "pipewire";
      source            = "auto";
      stereo            = true;
      bar_delimiter     = 0;
      noise_reduction   = 0.77;
      input_delay       = 2;
      hide_on_silence   = true;
      format-icons      = [ "▁" "▂" "▃" "▄" "▅" "▆" "▇" "█" ];
      actions = {
        "on-click-right" = "hyprctl dispatch toggle_mod_submap";
      };
    };

    # MPRIS media display
    mpris = {
      format           = " {status_icon} {dynamic}";
      interval         = 1;
      "dynamic-len"    = 40;
      "status-icons"   = {
        playing = "▶"; paused = "⏸"; stopped = "";
      };
      "dynamic-order"  = [ "title" "artist" ];
      "ignored-players" = [ "firefox" ];
    };

    # Idle inhibitor
    idle_inhibitor = {
      format       = "{icon}";
      format-icons = { activated = ""; deactivated = ""; };
    };

    # Hyprland submap (mode) indicator
    "hyprland/submap" = {
      format = "{}";
    };

    # Scratchpad count
    "hyprland/scratchpad" = {
      format          = "{icon} {count}";
      show-empty      = false;
      format-icons    = [ "" "" ];
      tooltip         = true;
      tooltip-format  = "{app}: {title}";
    };

    # System tray
    tray = {
      icon-size = 14;
      spacing   = 10;
    };

    # Load average
    load = {
      format = " {}";
    };

    # Clock & calendar
    clock = {
      tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
      format-alt     = "{:%Y-%m-%d}";
    };

    # Battery status
    battery = {
      states = { warning = 30; critical = 15; };
      format           = "{icon} {capacity}%";
      format-full      = "{icon} {capacity}%";
      format-charging  = " {capacity}%";
      format-plugged   = " {capacity}%";
      format-alt       = "{icon} {time}";
      format-icons     = [ "" "" "" "" "" ];
    };

    # Backlight control
    backlight = {
      format       = "{icon} {percent}%";
      format-icons = [ "" "" "" "" "" "" "" "" "" ];
    };

    # WirePlumber volume
    wireplumber = {
      scroll-step            = 5;
      format                 = "{icon} {volume}%";
      format-bluetooth       = "{icon} {volume}% ";
      format-bluetooth-muted = " {icon}";
      format-muted           = "";
      format-icons = {
        headphone    = "";
        "hands-free" = "";
        headset      = "";
        phone        = "";
        portable     = "";
        car          = "";
        default      = [ "" "" "" ];
      };
      on-click = "wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle";
    };
  };

  # A second bar on HDMI-A-1 (e.g. external monitor)
  waybarSettingsHDMI = waybarSettings // {
    outputs        = [ "HDMI-A-1" ];
    modules-left   = [ "hyprland/workspaces" "hyprland/submap" "hyprland/scratchpad" ];
    modules-center = [ "clock" ];
    modules-right  = [ "hyprland/window" ];
  };
in

{
  programs.waybar = {
    enable  = true;
    package = pkgs.waybar;

    # Apply both bars
    settings = [ waybarSettings waybarSettingsHDMI ];

    # Inline CSS: layout only, no colors
    style = ''
      * {
        font-size: 14px;
        border-radius: 5px;
      }
      window#waybar {
        font-family: FontAwesome, monospace;
        background-color: transparent;
        border-bottom: 0px;
        transition: background-color 0.5s;
      }
      window#waybar.hidden { opacity: 0.2; }
      window#waybar.empty #window { background-color: transparent; }
      .modules-left   { margin: 10px 0 0 10px; }
      .modules-center { margin: 10px 0 0 0; }
      .modules-right  { margin: 10px 10px 0 0; }
      button           { border: none; }
      #workspaces button {
        padding: 0 5px;
        background-color: transparent;
        border-radius: 0;
      }
      #workspaces button:first-child { border-radius: 5px 0 0 5px; }
      #workspaces button:last-child  { border-radius: 0 5px 5px 0; }
      .modules-left > widget:first-child > #workspaces { margin-left: 0; }
      .modules-right > widget:last-child > #workspaces { margin-right: 0; }
      #idle_inhibitor,
      #cava,
      #scratchpad,
      #hyprland\\/submap,
      #hyprland\\/window,
      #clock,
      #battery,
      #backlight,
      #wireplumber,
      #tray,
      #mpris,
      #load { padding: 0 10px; }
      #cava { padding: 0 5px; }
      @keyframes blink { /* Colors via Stylix */ to { } }
      #battery.critical:not(.charging) {
        animation: blink .5s steps(12) infinite alternate;
      }
      label:focus { /* Stylix background */ }
      #tray > .passive         { -gtk-icon-effect: dim; }
      #tray > .needs-attention { -gtk-icon-effect: highlight; }
      #tray menu               { font-family: sans-serif; }
      #scratchpad.empty        { background: transparent; }
    '';
  };
}
