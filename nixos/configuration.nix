{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  services.dbus.enable = true;  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest; # Use latest kernel Package

  networking.hostName = "nixTUF"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  i18n.extraLocales = [ "en_US.UTF-8/UTF-8" ];

  console = {
    font = "Lat2-Terminus16";
    keyMap = lib.mkForce "de";
    useXkbConfig = true; # use xkb.options in tty.
  };

  services.printing.enable = true; # Enable Printing

  services.pulseaudio.enable = false; # Enable Audio

  users.users.simonkdev = {
   isNormalUser = true;
   extraGroups = [ "wheel" "docker"]; # Enable ‘sudo’ for the user.
   packages = with pkgs; [
   tree
   kitty
   ];
};

 programs.firefox.enable = true;
 programs.hyprland.enable = true;

 environment.systemPackages = with pkgs; [
   wget
   home-manager
   nano
   fastfetch
   git
   nnn
   gh
   pamixer
   cmatrix
   cbonsai
   gedit
   hyprshot
   xfce.thunar
   qogir-icon-theme
   gvfs
   mangohud
   protonup
   pavucontrol
   jq
   todoist-electron
   discord
   notion-app
   spotify
   wasistlos
   obsidian
 ];

 environment.sessionVariables = {
  STEAM_EXTRA_COMPAT_TOOLS_PATHS =
    "/home/simonkdev/.steam/root/compatibilitytools.d";
  };

 fonts.packages = with pkgs; [
   nerd-fonts.fira-code
   nerd-fonts.droid-sans-mono
   nerd-fonts.jetbrains-mono
 ];


 services.openssh.enable = true; # Enable SSH

  system.stateVersion = "25.05"; # Just dont change it.

 stylix = {
   enable = true;
   image = ../wallpapers/wallpaper.jpg;
   ##base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
   polarity = "dark";
   autoEnable = true;
 };

 programs.steam.enable = true;
 programs.steam.gamescopeSession.enable = true;
 programs.gamemode.enable = true; 
 

 hardware.graphics = {
   enable = true;
   enable32Bit = true;
 };

 virtualisation.docker.enable = true;

 services.libinput = {
   enable = true;
   mouse = {
     accelProfile = "flat";
   };
   touchpad = {
     accelProfile = "flat";
   };
 }; 
 
 hardware.nvidia = {
#   modesetting.enable = true;
#   powerManagement.enable = false;
#   nvidiaSettings = true;
#       package = config.boot.kernelPackages.nvidiaPackages.mkDriver {
#      version = "535.154.05";
#      sha256_64bit     = "sha256-fpUGXKprgt6SYRDxSCemGXLrEsIA6GOinp+0eGbqqJg=";
#      sha256_aarch64   = "sha256-G0/GiObf/BZMkzzET8HQjdIcvCSqB1uhsinro2HLK9k=";
#      openSha256       = "sha256-wvRdHguGLxS0mR06P5Qi++pDJBCF8pJ8hr4T8O6TJIo=";
#      settingsSha256   = "sha256-9wqoDEWY4I7weWW05F4igj1Gj9wjHsREFMztfEmqm10=";
#      persistencedSha256 = "sha256-d0Q3Lk80JqkS1B54Mahu2yY/WocOqFFbZVBh+ToGhaE=";
#    };
   open = lib.mkForce false;
 };

 services.xserver.videoDrivers = [ "nvidia" ];

}

