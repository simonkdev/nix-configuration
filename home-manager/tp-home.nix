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
    ##./modules/desktops/kde-plasma.nix
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
    pkgs.quick-webapps
    pkgs.peaclock
    pkgs.protonmail-desktop
    pkgs.cpufetch
    pkgs.gpufetch
    pkgs.geeqie
    pkgs.openrocket
    pkgs.libreoffice

    (pkgs.writeShellScriptBin "homeswitch" ''
      cd ~/nixsys
      git add .
      git commit -m "rebuilt"
      git push
      rm -rf /home/simonkdev/.config/gtk-3.0/gtk.css.backup
      rm -rf /home/simonkdev/.config/gtk-4.0/gtk.css.backup
      home-manager switch -b backup --impure --flake /home/simonkdev/nixsys/#thinkpad
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
      nano /home/simonkdev/nixsys/home-manager/modules/desktops/gnome.nix
    '')
    (pkgs.writeShellScriptBin "bsedlogin" ''
      ssh webadmin@46.252.195.82
    '')
    (pkgs.writeShellScriptBin "bsedmount" ''
      sudo sshfs webadmin@46.252.195.82:/home/webadmin/FleetManager ~/Documents/02-BSED/fleetmanager -o allow_other
    '')
    (pkgs.writeShellScriptBin "sshman" ''
      /home/simonkdev/nixsys/home-manager/modules/devtools/ssh_manager/hlbm
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

  programs.hyprlock.enable = true;
  programs.hyprlock.settings = {
    input-field = {
      monitor = "";
      size = "300, 55";
      outline_thickness = 0;

      dots_size = 0.2;
      dots_spacing = 0.2;
      dots_center = true;

      rounding = 10;
      shadow_passes = 0;

      # outer_color = "rgba(0, 0, 0, 0)";
      # inner_color = "rgba(255, 255, 255, 0.1)";
      # font_color = "rgb(200, 200, 200)";

      placeholder_text = "<i><span foreground=\"##ffffff99\">🔒 Enter Password</span></i>";
      hide_input = false;

      # fail_color = "rgb(204, 34, 34)";
      fail_text = "<i>$FAIL <b>($ATTEMPTS)</b></i>";

      position = "0, -200";
      halign = "center";
      valign = "center";
    };
  };

  programs.hyprlock.extraConfig = ''

        # Background with blur
    background {
        monitor =
        path = screenshot
        blur_passes = 3
        blur_size = 8
        noise = 0.01
        contrast = 1.1
        brightness = 0.8
    }

    # Clock (HH:MM:SS)
    label {
        monitor =
        text = $TIME
        font_size = 96
        font_family = monospace
        color = rgba(255,255,255,1.0)

        position = 0, 300
        halign = center
        valign = center
    }

    # Date (optional, below clock)
    label {
        monitor =
        text = cmd[update:1000] date "+%A, %d %B %Y"
        font_size = 24
        font_family = monospace
        color = rgba(200,200,200,1.0)

        position = 0, 220
        halign = center
        valign = center
    }


    # Ensure clock updates every second
    general {
        grace = 0
    }

  '';
  home.file."/home/simonkdev/.config/fastfetch/config.jsonc".source = /home/simonkdev/nixsys/home-manager/modules/fastfetch/hypr.jsonc;

  home.file."/home/simonkdev/.unison/nas-sync-obsidian.prf".source = /home/simonkdev/nixsys/home-manager/modules/devtools/unison/nas-sync-obsidian.prf;
  home.file."/home/simonkdev/.unison/nas-sync-photos.prf".source = /home/simonkdev/nixsys/home-manager/modules/devtools/unison/nas-sync-photos.prf;
  home.file."/home/simonkdev/.smbcredentials".source = /home/simonkdev/nixsys/home-manager/modules/devtools/unison/.smbcredentials;

  #programs.gnome-terminal.enable = true;
  programs.gnome-terminal.showMenubar = false;

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
      ms-toolsai.jupyter
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
