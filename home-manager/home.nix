{
  config,
  lib,
  pkgs,
  unpkgs,
  ...
}: {
  home.username = "simonkdev";
  home.homeDirectory = "/home/simonkdev";

  ## This directory is ~/nixsys/home-manager :)

  imports = [
    ./modules/desktops/hyprland.nix
    ./modules/devtools/kitty.nix
    ./modules/waybar/waybar.nix
    ./modules/wofi/wofi.nix
    ./modules/stylix/stylix.nix
    ./modules/devtools/vscode.nix
  ];

  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = [
    pkgs.hello
    pkgs.wl-clipboard
    pkgs.wireplumber
    pkgs.cava
    pkgs.playerctl
    pkgs.brightnessctl
    pkgs.upower
    unpkgs.rapidraw
    pkgs.font-awesome
    pkgs.pipes-rs

    (pkgs.writeShellScriptBin "homeswitch" ''
      cd ~/nixsys
      git add .
      git commit -m "rebuilt"
      git push
      home-manager switch --impure --flake /home/simonkdev/nixsys/#main
      cd ~
    '')
    (pkgs.writeShellScriptBin "nixswitch" ''
      cd ~/nixsys
      git add .
      git commit -m "rebuilt system"
      git push
      sudo nixos-rebuild switch --impure --flake /home/simonkdev/nixsys/#main
      cd ~
    '')
    (pkgs.writeShellScriptBin "homeconf" ''
      nano /home/simonkdev/nixsys/home-manager/home.nix
    '')
    (pkgs.writeShellScriptBin "sysconf" ''
      nano /home/simonkdev/nixsys/nixos/configuration.nix
    '')
    (pkgs.writeShellScriptBin "hyprconf" ''
      nano /home/simonkdev/nixsys/home-manager/modules/hyprland.nix
    '')
    (pkgs.writeShellScriptBin "kittyconf" ''
      nano /home/simonkdev/nixsys/home-manager/kitty.nix
    '')
    (pkgs.writeShellScriptBin "waybarconf" ''
      nano /home/simonkdev/nixsys/home-manager/waybar.nix
    '')
  ];

  home.sessionVariables = {
    EDITOR = "nano";
    WLR_NO_HARDWARE_CURSORS = 1;
    MOZ_ENABLE_WAYLAND = "1";
    LIBVA_DRIVER_NAME = "nvidia";
    EGL_PLATFORM = "wayland";
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    GDK_SCALE = "1";
    QT_SCALE_FACTOR = "1";
  };

  programs.btop.enable = true;
  programs.home-manager.enable = true;

  xdg.desktopEntries = {
    cups = {
      name = "NOT INTENDED";
      type = "Application";
      noDisplay = true;
    };
    ktelnetservice6 = {
      name = "NOT INTENDED";
      type = "Application";
      noDisplay = true;
    };
    nixos-manual = {
      name = "NOT INTENDED";
      type = "Application";
      noDisplay = true;
    };
    thunar-bulk-rename = {
      name = "NOT INTENDED";
      type = "Application";
      noDisplay = true;
    };
    thunar-settings = {
      name = "NOT INTENDED";
      type = "Application";
      noDisplay = true;
    };
  };

  programs.yazi = {
    enable = true;
  };

  home.file."/home/simonkdev/.config/fastfetch/config.jsonc".source = /home/simonkdev/nixsys/home-manager/modules/fastfetch/hypr.jsonc;
}
