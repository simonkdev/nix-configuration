{
  config,
  pkgs,
  ...
}: {
  wayland.windowManager.hyprland = {
    enable = true;

    settings = {
      ###############################
      ######## MAIN PROGRAMS ########
      ###############################

      "$term" = "kitty";
      "$fileManager" = "dolphin";
      "$launcher" = "wofi --show drun";

      "exec-once" = [
        "waybar"
        "nm-applet"
        "dbus-update-activation-environment --systemd DISPLAY HYPRLAND_INSTANCE_SIGNATURE WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"
      ];

      #######################
      ######## INPUT ########
      #######################

      input = {
        "kb_layout" = "de";
      }; ## endinput

      gestures = {
        "workspace_swipe" = true;
      }; ## endgestures

      #############################
      ####### LOOK AND FEEL #######
      #############################

      monitor = [
        "DP-1, 3044x1440@120.00, 0x0, 1.0"
        #"eDP-1, preferred, 0x0@144, 1"
        "eDP-1, preferred, auto, 1, mirror, DP-1"
        #"eDP-1, disabled"
      ];

      bezier = [
        "easeOutQuint, 0.23,1,0.32,1"
        "easeInOutCubic, 0.65,0.05,0.36,1"
        "linear,0,0,1,1"
        "almostLinear,0.5,0.5,0.75,1.0"
        "quick,0.15,0,0.1,1"
      ];

      cursor = {
        "inactive_timeout" = 20;
      };

      animation = [
        "global, 1, 10, default"
        "border, 1, 5.39, easeOutQuint"
        "windows, 1, 4.79, easeOutQuint"
        "windowsIn, 1, 4.1, easeOutQuint, popin 87%"
        "windowsOut, 1, 1.49, easeOutQuint, popin 87%"
        "fadeIn, 1, 1.73, almostLinear"
        "fadeOut, 1, 1.46, almostLinear"
        "fade, 1, 3.03, quick"
        "layers, 1, 4, easeOutQuint"
        "layersIn, 1, 1.5, linear, fade"
        "layersOut, 1, 1.5, linear, fade"
        "fadeLayersIn, 1, 1.79, almostLinear"
        "fadeLayersOut, 1, 1.39, almostLinear"
        "workspaces, 1, 1.94, almostLinear, fade"
        "workspacesIn, 1, 1.21, almostLinear, fade"
        "workspacesOut, 1, 1.94, almostLinear, fade"
      ];

      dwindle = {
        pseudotile = true;
        "preserve_split" = false;
      };

      general = {
        "border_size" = 1;
        "gaps_in" = 3;
        "gaps_out" = 8;
        "allow_tearing" = false;
      };

      decoration = {
        rounding = 0;
        "rounding_power" = "0.0";
        "active_opacity" = "1.0";
        "inactive_opacity" = "1.0";
        "fullscreen_opacity" = "1.0";

        blur = {
          enabled = true;
          size = 3;
          passes = 3;
          "ignore_opacity" = true;
          brightness = "1.0";
          vibrancy = "0.0";
        }; ## blurend
      }; ## decorationend

      ###########################
      ####### KEYBINDINGS #######
      ###########################

      "$mod" = "SUPER"; # Windows key is "mod"

      bind = [
        #### Simple binds

        "$mod, Q, exec, kitty"
        "$mod, C, killactive"
        "$mod, M, exit"
        "$mod, E, exec, hyprctl dispatch exec '[float] kitty --class yazi -e yazi'"
        "$mod, V, togglefloating"
        "$mod, R, exec, $launcher"
        "$mod, T, exec, thunar"
        "$mod, F, fullscreen"
        "$mod, S, exec, discord"
        "$mod, X, exec, librewolf"
        "$mod, A, exec, steam"
        "$mod, P, exec, hyprshot -m output -m DP-1 -o ~/screenshots"
        "$mod, P, exec, GDK_BACKEND=x11 GDK_GL=disable rapidraw"
        "$mod, Y, exec, hyprlock"
        "$mod, H, exec, bash /home/simonkdev/nixsys/home-manager/modules/readmode/reading_mode.sh"
        "$mod, L, exec, swaync -t"

        #### Move windows with arrow keys

        "$mod SHIFT, left, swapwindow, l"
        "$mod SHIFT, right, swapwindow, r"
        "$mod SHIFT, up, swapwindow, u"
        "$mod SHIFT, down, swapwindow, d"

        #### Moving focus with arrows

        "$mod, left, movefocus, l"
        "$mod, right, movefocus, r"
        "$mod, up, movefocus, u"
        "$mod, down, movefocus, d"

        #### Switching workspaces

        "$mod, 1, workspace, 1"
        "$mod, 2, workspace, 2"
        "$mod, 3, workspace, 3"
        "$mod, 4, workspace, 4"
        "$mod, 5, workspace, 5"
        "$mod, 6, workspace, 6"
        "$mod, 7, workspace, 7"
        "$mod, 8, workspace, 8"
        "$mod, 9, workspace, 9"
        "$mod, 0, workspace, 10"

        #### Move window to workspace

        "$mod SHIFT, 1, movetoworkspace, 1"
        "$mod SHIFT, 2, movetoworkspace, 2"
        "$mod SHIFT, 3, movetoworkspace, 3"
        "$mod SHIFT, 4, movetoworkspace, 4"
        "$mod SHIFT, 5, movetoworkspace, 5"
        "$mod SHIFT, 6, movetoworkspace, 6"
        "$mod SHIFT, 7, movetoworkspace, 7"
        "$mod SHIFT, 8, movetoworkspace, 8"
        "$mod SHIFT, 9, movetoworkspace, 9"
        "$mod SHIFT, 0, movetoworkspace, 0"

        #### Scroll through workspaces with win+scroll

        "$mod, mouse_down, workspace, e+1"
        "$mod, mouse_up, workspace, e-1"
      ]; ## endbinds

      bindm = [
        #### Move/Resize Windows with win+mousebuttons

        "$mod, mouse:272, movewindow"
        "$mod, mouse:273, resizewindow"
      ]; ## endbindms

      bindel = [
        # ThinkPad T480s / common XF86 multimedia keys
        # Brightness
        ", XF86MonBrightnessUp, exec, brightnessctl set +10%"
        ", XF86MonBrightnessDown, exec, brightnessctl set 10%-"

        # Volume
        ", XF86AudioRaiseVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ +5%"
        ", XF86AudioLowerVolume, exec, pactl set-sink-volume @DEFAULT_SINK@ -5%"
        ", XF86AudioMute, exec, pactl set-sink-mute @DEFAULT_SINK@ toggle"

        # Microphone
        ", XF86AudioMicMute, exec, pactl set-source-mute @DEFAULT_SOURCE@ toggle"

        # Media controls (playerctl is commonly available and works with most players)
        ", XF86AudioPlay, exec, playerctl play-pause"
        ", XF86AudioNext, exec, playerctl next"
        ", XF86AudioPrev, exec, playerctl previous"
      ];

      #########################
      ##### WINDOW RULES ######
      #########################

      windowrule = [
        "opacity [2.0 2.0], class:kitty"
        "rounding [12], class:wofi"
        "roundingpower [10.0], class:wofi"
        "float, class:pavucontrol"
        "float, class:thunar"
        "float, class:Todoist"
        "float, class:org.gnome.Calculator"
        "float, class:org.gnome.clocks"
        "float, class:localsend_app"
        "float, class:org.gnome.TextEditor"
        "float, class:org.gnome.Loupe"
        "float, class:org.gnome.Decibels"
        "float, class:org.gnome.Weather"
        "float, class:org.gnome.baobab"
        "float, class:org.gnome.Snapshot"
        "float, class:org.gnome.SystemMonitor"
      ];

      windowrulev2 = [
        "size 960 540, class:yazi"
      ];

      layerrule = [
        "noanim, wofi"
      ];

      #env = [
      #"LIBVA_DRIVER_NAME,nvidia"
      #"__GLX_VENDOR_LIBRARY_NAME,nvidia"
      #"__NV_PRIME_RENDER_OFFLOAD,1"
      #"WLR_NO_HARDWARE_CURSORS,0"
      #"AQ_DRM_DEVICES,/dev/dri/card1"
      #];
    }; ## endsettings
  }; ## endhyprland

  ########################
}
