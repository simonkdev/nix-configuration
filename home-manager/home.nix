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
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
 
  stylix = {
   enable = true;
   autoEnable = true;
  };

}
