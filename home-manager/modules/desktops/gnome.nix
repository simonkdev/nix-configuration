{
  config,
  lib,
  pkgs,
  ...
}: {
  imports = [./gnome-dconf.nix];

  home.packages = with pkgs.gnomeExtensions; [
    tiling-assistant
    blur-my-shell
    dash-to-dock
    search-light
    desktop-clock
    edit-desktop-files
    add-to-desktop
    gtk4-desktop-icons-ng-ding
    advanced-weather-companion
    rounded-window-corners-reborn
    unite
    spotify-controls
  ];

  programs.gnome-shell = {
    enable = true;
  };
}
