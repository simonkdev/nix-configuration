{ inputs, config, pkgs, ... }:

{
  home.username = "simonkdev";
  home.homeDirectory = "/home/simonkdev";
  
  ## This directory is ~/nixsys/home-manager :)

  imports = [
   ~/nixsys/home-manager/modules/kitty.nix
   ~/nixsys/home-manager/modules/tp-stylix.nix
   ~/nixsys/home-manager/modules/gnome.nix
#   ~/nixsys/home-manager/modules/nvim.nix
  ];
  
  home.stateVersion = "25.05"; # Please read the comment before changing.

  home.packages = with pkgs; [
    hello
    wl-clipboard
    wireplumber
    cava
    playerctl
    brightnessctl
    upower
    #polkit_gnome


    (writeShellScriptBin "homeswitch" ''
        cd ~/nixsys
        git add .
        git commit -m "rebuilt"
        git push
        home-manager switch --impure --flake /home/simonkdev/nixsys/#thinkpad
        cd ~
    '')
    (writeShellScriptBin "nixswitch" ''
        cd ~/nixsys
        git add .
        git commit -m "rebuilt system"
        git push
        sudo nixos-rebuild switch --impure --flake /home/simonkdev/nixsys/#thinkpad
        cd ~
    '')
    (writeShellScriptBin "homeconf" ''
       nano /home/simonkdev/nixsys/home-manager/tp-home.nix
     '')
    (writeShellScriptBin "sysconf" ''
       nano /home/simonkdev/nixsys/nixos/tp-config.nix
     '')
    (writeShellScriptBin "kittyconf" ''
       nano /home/simonkdev/nixsys/home-manager/kitty.nix
     '')
    (writeShellScriptBin "gnomeconf" ''
       nano /home/simonkdev/nixsys/home-manager/modules/gnome.nix
     '')
    (writeShellScriptBin "bsedlogin" ''
       ssh webadmin@46.252.195.82
     '')
    (writeShellScriptBin "bsedmount" ''
       sudo sshfs webadmin@46.252.195.82:/home/webadmin/FleetManager ~/Documents/02-Projects/BSED/Fleet-Manager -o allow_other
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

  programs.neovim.enable = true;
  home.file.".config/nvim" = {
      source = /home/simonkdev/nixsys/home-manager/modules/doom-nvim;
      recursive = true;
  };



}
