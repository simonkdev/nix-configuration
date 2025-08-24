{
  inputs,
  config,
  pkgs,
  unpkgs,
  lib,
  ...
}: {
  home.username = "simonkdev";
  home.homeDirectory = "/home/simonkdev";

  ## This directory is ~/nixsys/home-manager :)

  imports = [
    ./modules/devtools/kitty.nix
    ./modules/stylix/tp-stylix.nix
    ./modules/desktops/gnome.nix
    ./modules/waybar/waybar.nix
    ./modules/wofi/wofi.nix
    ./modules/desktops/hyprland.nix
    #   ~/nixsys/home-manager/modules/nvim.nix
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
    pkgs.unzip
    unpkgs.rapidraw
    pkgs.moonlight-qt

    (pkgs.writeShellScriptBin "homeswitch" ''
      cd ~/nixsys
      git add .
      git commit -m "rebuilt"
      git push
      home-manager switch --impure --flake /home/simonkdev/nixsys/#thinkpad
      cd ~
    '')
    (pkgs.writeShellScriptBin "nixswitch" ''
      cd ~/nixsys
      git add .
      git commit -m "rebuilt system"
      git push
      sudo nixos-rebuild switch --impure --flake /home/simonkdev/nixsys/#thinkpad
      cd ~
    '')
    (pkgs.writeShellScriptBin "homeconf" ''
      nano /home/simonkdev/nixsys/home-manager/tp-home.nix
    '')
    (pkgs.writeShellScriptBin "sysconf" ''
      nano /home/simonkdev/nixsys/nixos/configs/tp-config.nix
    '')
    (pkgs.writeShellScriptBin "kittyconf" ''
      nano /home/simonkdev/nixsys/home-manager/kitty.nix
    '')
    (pkgs.writeShellScriptBin "gnomeconf" ''
      nano /home/simonkdev/nixsys/home-manager/modules/gnome.nix
    '')
    (pkgs.writeShellScriptBin "bsedlogin" ''
      ssh webadmin@46.252.195.82
    '')
    (pkgs.writeShellScriptBin "bsedmount" ''
      sudo sshfs webadmin@46.252.195.82:/home/webadmin/FleetManager ~/Documents/02-BSED/fleetmanager -o allow_other
    '')
    (pkgs.writeShellScriptBin "sshman" ''
      cd /home/simonkdev/nixsys/home-manager/modules/devtools/ssh_manager/
      devenv shell
      python hlbm.py
    '')
  ];

  home.sessionVariables = {
    EDITOR = "nano";
    WLR_NO_HARDWARE_CURSORS = 1;
    MOZ_ENABLE_WAYLAND = "1";
    LIBVA_DRIVER_NAME = "nvidia";
    EGL_PLATFORM = "wayland";
    GDK_SCALE = "1";
    QT_SCALE_FACTOR = "1";
  };

  programs.btop.enable = true;
  programs.wofi.enable = true;
  programs.home-manager.enable = true;
  programs.yazi.enable = true;

  home.file."/home/simonkdev/.config/fastfetch/config.jsonc".source = /home/simonkdev/nixsys/home-manager/modules/fastfetch/hypr.jsonc;

  home.file."/home/simonkdev/.unison/nas-sync-obsidian.prf".source = /home/simonkdev/nixsys/home-manager/modules/devtools/unison/nas-sync-obsidian.prf;
  home.file."/home/simonkdev/.unison/nas-sync-photos.prf".source = /home/simonkdev/nixsys/home-manager/modules/devtools/unison/nas-sync-photos.prf;
  home.file."/home/simonkdev/.smbcredentials".source = /home/simonkdev/nixsys/home-manager/modules/devtools/unison/.smbcredentials;

  programs.vscode = {
    enable = true;
    profiles.default.extensions = with pkgs.vscode-extensions; [
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      esbenp.prettier-vscode
      vscjava.vscode-java-pack
      github.copilot-chat
      github.copilot
      ms-python.python
      ms-python.vscode-pylance
      jnoortheen.nix-ide
      arrterian.nix-env-selector
      jdinhlife.gruvbox
      adpyke.codesnap
      dracula-theme.theme-dracula
      kamadorueda.alejandra
    ];
    profiles.default.userSettings = {
      "chat.editor.fontFamily" = "DejaVu Sans Mono";
      "debug.console.fontFamily" = "DejaVu Sans Mono";
      "editor.fontFamily" = "DejaVu Sans Mono";
      "editor.inlayHints.fontFamily" = "DejaVu Sans Mono";
      "editor.inlineSuggest.fontFamily" = "DejaVu Sans Mono";
      "markdown.preview.fontFamily" = "DejaVu Sans";
      "scm.inputFontFamily" = "DejaVu Sans Mono";
      "chat.editor.fontSize" = lib.mkForce 16.0;
      "editor.fontSize" = lib.mkForce 16.0;
      "workbench.colorTheme" = lib.mkForce "Catppuccin Mocha";
    };
  };
}
