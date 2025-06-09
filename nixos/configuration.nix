{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_latest; # Use latest kernel Package

  networking.hostName = "nixTUF"; # Define your hostname.
  networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  
  time.timeZone = "Europe/Berlin";

  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    font = "Lat2-Terminus16";
    keyMap = lib.mkForce "de";
    useXkbConfig = true; # use xkb.options in tty.
  };

  services.printing.enable = true; # Enable Printing

  services.pulseaudio.enable = false; # Enable Audio
  
  services.libinput.enable = true; # Enab[e Touchpad

  users.users.simonkdev = {
   isNormalUser = true;
   extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
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
 ];

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

}
