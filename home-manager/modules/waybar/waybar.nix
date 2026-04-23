{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
  };

  home.file."/home/simonkdev/.config/waybar/config" = {
    source = /home/simonkdev/nixsys/home-manager/modules/waybar/config;
  };
  # home.file."/home/simonkdev/.config/waybar/style.css" = {
  #   source = lib.mkForce /home/simonkdev/nixsys/home-manager/modules/waybar/style.css;
  # # };
  # home.file."/home/simonkdev/.config/waybar/style.css".text = lib.mkForce

  programs.waybar.style = ''
    /* `otf-font-awesome` is required to be installed for icons */
      * {
        font-family: JetBrainsMono Nerd Font;
        font-size: 15px;
      }

      window#waybar {
        color: ${config.lib.stylix.colors.withHashtag.base08};
        transition-property: background-color;
        transition-duration: 0.5s;
        border-top: 8px transparent;
        border-radius: 8px;
        transition-duration: 0.5s;
        margin: 5px 16px;
      }

      window#waybar.hidden {
        opacity: 0.2;
      }

      #workspaces button {
        padding: 0 5px;
        color: ${config.lib.stylix.colors.withHashtag.base06};
        background-color: transparent;
        box-shadow: inset 0 -3px transparent;
        border: none;
        border-radius: 0;
      }

      #workspaces button.focused {
        color: ${config.lib.stylix.colors.withHashtag.base0E};
      }

      #workspaces button.active {
        color: ${config.lib.stylix.colors.withHashtag.base0B};
      }

      #workspaces button.urgent {
        background-color: ${config.lib.stylix.colors.withHashtag.base08};
      }

      #window {
        color: ${config.lib.stylix.colors.withHashtag.base04};
        font-family: JetBrainsMono Nerd Font;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #disk,
      #temperature,
      #backlight,
      #network,
      #pulseaudio,
      #custom-media,
      #tray,
      #mode,
      #idle_inhibitor,
      #mpd,
      #bluetooth,
      #custom-hyprPicker,
      #custom-power-menu,
      #custom-spotify,
      #custom-weather,
      #custom-weather.severe,
      #custom-weather.sunnyDay,
      #custom-weather.clearNight,
      #custom-weather.cloudyFoggyDay,
      #custom-weather.cloudyFoggyNight,
      #custom-weather.rainyDay,
      #custom-weather.rainyNight,
      #custom-weather.showyIcyDay,
      #custom-weather.snowyIcyNight,
      #custom-weather.default {
        padding: 0 10px;
        color: ${config.lib.stylix.colors.withHashtag.base0F};
        border-radius: 9.5px;
        background-color: transparent;
      }

      #window,
      #workspaces {
        margin: 0 4px;
        border-radius: 7.8px;
        background-color: transparent;
      }

      #cpu {
        color: ${config.lib.stylix.colors.withHashtag.base0B};
        background-color: transparent;
      }

      #memory {
        color: ${config.lib.stylix.colors.withHashtag.base0C};
        background-color: transparent;
      }

      #custom-power-menu {
        border-radius: 9.5px;
        background-color: transparent;
        border-radius: 7.5px;
        padding: 0 5px;
      }

      #custom-launcher {
        background-color: transparent;
        color: ${config.lib.stylix.colors.withHashtag.base0B};
        border-radius: 7.5px;
        padding: 0 3px;
      }

      #custom-weather.severe {
        color: ${config.lib.stylix.colors.withHashtag.base0F};
      }

      #custom-weather.sunnyDay {
        color: ${config.lib.stylix.colors.withHashtag.base09};
      }

      #custom-weather.clearNight {
        color: ${config.lib.stylix.colors.withHashtag.base06};
      }

      #custom-weather.cloudyFoggyDay,
      #custom-weather.cloudyFoggyNight {
        color: ${config.lib.stylix.colors.withHashtag.base09};
      }

      #custom-weather.rainyDay,
      #custom-weather.rainyNight {
        color: ${config.lib.stylix.colors.withHashtag.base0C};
      }

      #custom-weather.showyIcyDay,
      #custom-weather.snowyIcyNight {
        color: ${config.lib.stylix.colors.withHashtag.base09};
      }

      #custom-weather.default {
        color: ${config.lib.stylix.colors.withHashtag.base0F};
      }

      /* If workspaces is the leftmost module, omit left margin */
      .modules-left > widget:first-child > #workspaces {
        margin-left: 0;
      }

      /* If workspaces is the rightmost module, omit right margin */
      .modules-right > widget:last-child > #workspaces {
        margin-right: 0;
      }

      #pulseaudio {
        color: ${config.lib.stylix.colors.withHashtag.base05};
      }

      #backlight {
        color: ${config.lib.stylix.colors.withHashtag.base0C};
      }

      #clock {
        color: ${config.lib.stylix.colors.withHashtag.base09};
      }

      #battery {
        color: ${config.lib.stylix.colors.withHashtag.base0F};
      }

      #battery.charging,
      #battery.full,
      #battery.plugged {
        color: ${config.lib.stylix.colors.withHashtag.base0A};
      }

      @keyframes blink {
        to {
          background-color: ${config.lib.stylix.colors.withHashtag.base01};
          color: ${config.lib.stylix.colors.withHashtag.base06};
        }
      }

      #battery.critical:not(.charging) {
        color: ${config.lib.stylix.colors.withHashtag.base08};
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: linear;
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      label:focus {
        background-color: ${config.lib.stylix.colors.withHashtag.base00};
      }

      #disk {
        background-color: ${config.lib.stylix.colors.withHashtag.base09};
      }

      #bluetooth {
        color: ${config.lib.stylix.colors.withHashtag.base05};
      }

      #bluetooth.disconnected {
        color: ${config.lib.stylix.colors.withHashtag.base08};
      }

      #network {
        color: ${config.lib.stylix.colors.withHashtag.base0F};
      }

      #network.disconnected {
        color: ${config.lib.stylix.colors.withHashtag.base08};
      }

      #custom-media {
        background-color: ${config.lib.stylix.colors.withHashtag.base0A};
        color: ${config.lib.stylix.colors.withHashtag.base00};
        min-width: 100px;
      }

      #custom-media.custom-spotify {
        background-color: ${config.lib.stylix.colors.withHashtag.base0A};
      }

      #custom-media.custom-vlc {
        background-color: ${config.lib.stylix.colors.withHashtag.base0B};
      }

      #temperature {
        background-color: ${config.lib.stylix.colors.withHashtag.base0F};
      }

      #temperature.critical {
        background-color: ${config.lib.stylix.colors.withHashtag.base08};
      }

      #tray > .passive {
        -gtk-icon-effect: dim;
      }

      #tray > .needs-attention {
        -gtk-icon-effect: highlight;
        background-color: ${config.lib.stylix.colors.withHashtag.base08};
      }

      #idle_inhibitor {
        background-color: ${config.lib.stylix.colors.withHashtag.base01};
      }

      #idle_inhibitor.activated {
        background-color: ${config.lib.stylix.colors.withHashtag.base0F};
        color: ${config.lib.stylix.colors.withHashtag.base00};
      }

      #mpd {
        color: ${config.lib.stylix.colors.withHashtag.base00};
      }

      #mpd.disconnected {
        color: ${config.lib.stylix.colors.withHashtag.base08};
      }

      #mpd.stopped {
        color: ${config.lib.stylix.colors.withHashtag.base05};
      }

      #mpd.paused {
        color: ${config.lib.stylix.colors.withHashtag.base0A};
      }

      #language {
        background: ${config.lib.stylix.colors.withHashtag.base0A};
        color: ${config.lib.stylix.colors.withHashtag.base00};
        padding: 0 5px;
        margin: 0 5px;
        min-width: 16px;
      }

      #keyboard-state {
        background: ${config.lib.stylix.colors.withHashtag.base0B};
        color: ${config.lib.stylix.colors.withHashtag.base00};
        padding: 0 0px;
        margin: 0 5px;
        min-width: 16px;
      }

      #keyboard-state > label {
        padding: 0 5px;
      }

      #keyboard-state > label.locked {
        background: ${config.lib.stylix.colors.withHashtag.base00};
      }

      #custom-spotify {
        padding: 0 10px;
        margin: 0 4px;
        color: ${config.lib.stylix.colors.withHashtag.base0F};
      }
  '';
}
