{ config, pkgs, ... }:

{
  home.username = "simonkdev";
  home.homeDirectory = "/home/simonkdev";
  
  ## This directory is ~/nixsys/home-manager :)

  imports = [
   ~/nixsys/home-manager/modules/kitty.nix
   ~/nixsys/home-manager/modules/stylix.nix
   ~/nixsys/home-manager/modules/gnome.nix
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
    pkgs.python3
    pkgs.python3Packages.pip
    pkgs.python3Packages.virtualenv

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
       nano /home/simonkdev/nixsys/home-manager/home.nix
     '')
    (pkgs.writeShellScriptBin "sysconf" ''
       nano /home/simonkdev/nixsys/nixos/configuration.nix
     '')
    (pkgs.writeShellScriptBin "kittyconf" ''
       nano /home/simonkdev/nixsys/home-manager/kitty.nix
     '')



  ];

  home.sessionVariables = {
     EDITOR = "nano";
     WLR_NO_HARDWARE_CURSORS=1;
     MOZ_ENABLE_WAYLAND = "1";
     LIBVA_DRIVER_NAME = "nvidia";
     EGL_PLATFORM = "wayland";
     GDK_SCALE = "1";
     QT_SCALE_FACTOR = "1";
  };
  
  programs.btop.enable = true;
  programs.wofi.enable = true;
  programs.home-manager.enable = true;
 
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
    ];
 };





}
