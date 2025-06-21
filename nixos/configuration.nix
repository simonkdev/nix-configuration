{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];
  nix.settings.experimental-features = [ "nix-command" "flakes"];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  security.polkit.enable = true;
  services.udisks2.enable = true;
  xdg.portal.enable = true;

  services.dbus.enable = true;  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_6_14; # Use latest kernel Package

  boot.supportedFilesystems = [ "ntfs" ];

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
   extraGroups = [ "wheel" "docker" "networkmanager" "storage" "plugdev" ]; # Enable ‘sudo’ for the user.
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
   lshw
   ntfs3g
 ];



 environment.sessionVariables = {
  STEAM_EXTRA_COMPAT_TOOLS_PATHS =
    "/home/simonkdev/.steam/root/compatibilitytools.d";
  __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  WLR_NO_HARDWARE_CURSORS = "1";
  WLR_RENDERER_ALLOW_SOFTWARE = "1";
  LIBVA_DRIVER_NAME = "nvidia";
  GBM_BACKEND = "nvidia-drm";
  __GL_GSYNC_ALLOWED = "1";
  __GL_VRR_ALLOWED = "1";
  WLR_DRM_NO_ATOMIC = "1"; # sometimes helps on NVIDIA 
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
   modesetting.enable = true;
   powerManagement.enable = false;
   nvidiaSettings = true;
   package = config.boot.kernelPackages.nvidiaPackages.stable;
   open = false;
   prime = {
     sync.enable = true;
     allowExternalGpu = true;
     intelBusId = "PCI:0:2:0";
     nvidiaBusId = "PCI:1:0:0";
   };
 };

 services.xserver.videoDrivers = [ "nvidia" ];

}

