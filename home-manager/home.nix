{ config, lib, pkgs, unpkgs, ... }:

let
  rapidraw = unpkgs.rapidraw.overrideAttrs (oldAttrs: rec {
    # After building, override the desktop file Exec command
    postInstall = oldAttrs.postInstall or "" + ''
      substituteInPlace $out/share/applications/RapidRAW.desktop --replace \
        'Exec=rapidraw' \
        'Exec=GDK_BACKEND=x11 GDK_GL=disable rapidraw'
    '';
  });
in


{
  home.username = "simonkdev";
  home.homeDirectory = "/home/simonkdev";
  
  ## This directory is ~/nixsys/home-manager :)

  imports = [
   ~/nixsys/home-manager/modules/hyprland.nix
   ~/nixsys/home-manager/modules/kitty.nix
   ~/nixsys/home-manager/modules/waybar.nix
   ~/nixsys/home-manager/modules/wofi.nix
   ~/nixsys/home-manager/modules/stylix.nix
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
    rapidraw
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
     WLR_NO_HARDWARE_CURSORS=1;
     MOZ_ENABLE_WAYLAND = "1";
     LIBVA_DRIVER_NAME = "nvidia";
     EGL_PLATFORM = "wayland";
     __GLX_VENDOR_LIBRARY_NAME = "nvidia";
     GDK_SCALE = "1";
     QT_SCALE_FACTOR = "1";
  };
  
  programs.btop.enable = true;
  programs.wofi.enable = true;
  programs.home-manager.enable = true;

 #  services.desktopManager.gnome.polkit-gnome-authentication-agent.enable = true;
 
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
   nixos-manual= {
    name = "NOT INTENDED";
    type = "Application";
    noDisplay = true;
   };
   thunar-bulk-rename= {
    name = "NOT INTENDED";
    type = "Application";
    noDisplay = true;
   };   
   thunar-settings= {
    name = "NOT INTENDED";
    type = "Application";
    noDisplay = true;
   };
  };

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
    ];
    profiles.default.userSettings = {
       "chat.editor.fontFamily"= "DejaVu Sans Mono";
       "chat.editor.fontSize"= 12.0;
       "debug.console.fontFamily"= "DejaVu Sans Mono";
       "debug.console.fontSize"= 12.0;
       "editor.fontFamily"= "DejaVu Sans Mono";
       "editor.fontSize"= 12.0;
       "editor.inlayHints.fontFamily"= "DejaVu Sans Mono";
       "editor.inlineSuggest.fontFamily"= "DejaVu Sans Mono";
       "editor.minimap.sectionHeaderFontSize"= 7.714285714285714;
       "markdown.preview.fontFamily"= "DejaVu Sans";
       "markdown.preview.fontSize"= 12.0;
       "scm.inputFontFamily"= "DejaVu Sans Mono";
       "scm.inputFontSize"= 11.142857142857142;
       "screencastMode.fontSize"= 48.0;
       "terminal.integrated.fontSize" = 12.0;
       "workbench.colorTheme" = lib.mkForce "Dracula Theme";
   };
   };
     
    programs.yazi = {
       enable = true;
    };

    home.file."/home/simonkdev/.config/fastfetch/config.jsonc".source = /home/simonkdev/nixsys/home-manager/modules/fastfetch/nyarch.jsonc;
}
