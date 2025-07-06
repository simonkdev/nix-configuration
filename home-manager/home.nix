{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "simonkdev";
  home.homeDirectory = "/home/simonkdev";
  
  ## This directory is ~/nixsys/home-manager :)

  imports = [
   ./hyprland.nix
   ./kitty.nix
   ./waybar.nix
   ./wofi.nix
  ];
  
  # This value determines the Home Manager release that your configuration is
  # compatible with. This helps avoid breakage when a new Home Manager release
  # introduces backwards incompatible changes.
  #
  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "25.05"; # Please read the comment before changing.

  # The home.packages option allows you to install Nix packages into your
  # environment.
  home.packages = [
    # # Adds the 'hello' command to your environment. It prints a friendly
    # # "Hello, world!" when run.
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


    # # It is sometimes useful to fine-tune packages, for example, by applying
    # # overrides. You can do that directly here, just don't forget the
    # # parentheses. Maybe you want to install Nerd Fonts with a limited number of
    # # fonts?
    # (pkgs.nerdfonts.override { fonts = [ "FantasqueSansMono" ]; })

    # # You can also create simple shell scripts directly inside your
    # # configuration. For example, this adds a command 'my-hello' to your
    # # environment:
    (pkgs.writeShellScriptBin "homeswitch" ''
        cd ~/nixsys
        git add .
        git commit -m "rebuilt"
        git push
        home-manager switch --flake /home/simonkdev/nixsys/#main
        cd ~
    '')
    (pkgs.writeShellScriptBin "nixswitch" ''
        cd ~/nixsys
        git add .
        git commit -m "rebuilt system"
        git push
        sudo nixos-rebuild switch --flake /home/simonkdev/nixsys/#main
        cd ~
    '')
    (pkgs.writeShellScriptBin "homeconf" ''
       nano /home/simonkdev/nixsys/home-manager/home.nix
     '')
    (pkgs.writeShellScriptBin "sysconf" ''
       nano /home/simonkdev/nixsys/nixos/configuration.nix
     '')
    (pkgs.writeShellScriptBin "hyprconf" ''
       nano /home/simonkdev/nixsys/home-manager/hyprland.nix
     '')
    (pkgs.writeShellScriptBin "kittyconf" ''
       nano /home/simonkdev/nixsys/home-manager/kitty.nix
     '')
    (pkgs.writeShellScriptBin "waybarconf" ''
       nano /home/simonkdev/nixsys/home-manager/waybar.nix
     '')



  ];

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  # Home Manager can also manage your environment variables through
  # 'home.sessionVariables'. These will be explicitly sourced when using a
  # shell provided by Home Manager. If you don't want to manage your shell
  # through Home Manager then you have to manually source 'hm-session-vars.sh'
  # located at either
  #
  #  ~/.nix-profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  ~/.local/state/nix/profiles/profile/etc/profile.d/hm-session-vars.sh
  #
  # or
  #
  #  /etc/profiles/per-user/simonkdev/etc/profile.d/hm-session-vars.sh
  #
  home.sessionVariables = {
     EDITOR = "nano";
     WLR_NO_HARDWARE_CURSORS=1;
       MOZ_ENABLE_WAYLAND = "1";
  LIBVA_DRIVER_NAME = "nvidia";
  EGL_PLATFORM = "wayland";
  __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
  programs.btop.enable = true;
  programs.wofi.enable = true;
  # Let Home Manager install and manage itself.
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
     ];
 };




  stylix.enable = true;
#  stylix.image = ../wallpapers/wallpaper.jpg;
  stylix.base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
## ashes, brewer


  stylix.targets = {
   btop.enable = true;
  };
  stylix.cursor = {
   package = pkgs.bibata-cursors;
   name = "Bibata-Modern-Ice";
   size = 14;
  };
  stylix.fonts.sizes = {
  applications = 9;
  terminal = 9;
  desktop = 9;
  };



  home.sessionVariables = {
   GDK_SCALE = "1";
   QT_SCALE_FACTOR = "1";
  };



  gtk = {
   enable = true;
   iconTheme = {
     name = "Qogir";
     package = pkgs.qogir-icon-theme;
   };
  };
}
