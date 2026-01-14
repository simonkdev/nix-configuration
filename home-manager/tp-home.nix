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
  programs.hyprlock.extraConfig = ''
        # BACKGROUND
    background {
        monitor =
        #path = screenshot
        path = /home/justin/Pictures/wal.png
        #color = $background
        blur_passes = 2
        contrast = 1
        brightness = 0.5
        vibrancy = 0.2
        vibrancy_darkness = 0.2
    }

    # GENERAL
    general {
        no_fade_in = true
        no_fade_out = true
        hide_cursor = false
        grace = 0
        disable_loading_bar = true
    }

    # INPUT FIELD
    input-field {
        monitor =
        size = 250, 60
        outline_thickness = 2
        dots_size = 0.2 # Scale of input-field height, 0.2 - 0.8
        dots_spacing = 0.35 # Scale of dots' absolute size, 0.0 - 1.0
        dots_center = true
        outer_color = rgba(0, 0, 0, 0)
        inner_color = rgba(0, 0, 0, 0.2)
        font_color = $foreground
        fade_on_empty = false
        rounding = -1
        check_color = rgb(204, 136, 34)
        placeholder_text = <i><span foreground="##cdd6f4">Input Password...</span></i>
        hide_input = false
        position = 0, -200
        halign = center
        valign = center
    }

    # DATE
    label {
      monitor =
      text = cmd[update:1000] echo "$(date +"%A, %B %d")"
      color = rgba(242, 243, 244, 0.75)
      font_size = 22
      font_family = JetBrains Mono
      position = 0, 300
      halign = center
      valign = center
    }

    # TIME
    label {
      monitor =
      text = cmd[update:1000] echo "$(date +"%-I:%M")"
      color = rgba(242, 243, 244, 0.75)
      font_size = 95
      font_family = JetBrains Mono Extrabold
      position = 0, 200
      halign = center
      valign = center
    }



    # Profile Picture
    image {
        monitor =
        path = /home/justin/Pictures/profile_pictures/justin_square.png
        size = 100
        border_size = 2
        border_color = $foreground
        position = 0, -100
        halign = center
        valign = center
    }

    # Desktop Environment
    image {
        monitor =
        path = /home/justin/Pictures/profile_pictures/hypr.png
        size = 75
        border_size = 2
        border_color = $foreground
        position = -50, 50
        halign = right
        valign = bottom
    }

    # CURRENT SONG
    label {
        monitor =
        text = cmd[update:1000] echo "$(/home/justin/Documents/Scripts/whatsong.sh)"
        color = $foreground
        #color = rgba(255, 255, 255, 0.6)
        font_size = 18
        font_family = Metropolis Light, Font Awesome 6 Free Solid
        position = 0, 50
        halign = center
        valign = bottom
    }

    label {
        monitor =
        text = cmd[update:1000] echo "$(/home/justin/Documents/Scripts/whoami.sh)"
        color = $foreground
        font_size = 14
        font_family = JetBrains Mono
        position = 0, -10
        halign = center
        valign = top
    }

    label {
        monitor =
        text = cmd[update:1000] echo "$(/home/justin/Documents/Scripts/battery.sh)"
        color = $foreground
        font_size = 24
        font_family = JetBrains Mono
        position = -90, -10
        halign = right
        valign = top
    }

    label {
        monitor =
        text = cmd[update:1000] echo "$(/home/justin/Documents/Scripts/network-status.sh)"
        color = $foreground
        font_size = 24
        font_family = JetBrains Mono
        position = -20, -10
        halign = right
        valign = top
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
