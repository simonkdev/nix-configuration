{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
    ];
  nix.settings.experimental-features = [ "nix-command" "flakes"];
  nix.settings.trusted-users = [ "root" "simonkdev" ];

  nixpkgs.config.allowUnfree = true;
  nixpkgs.config.allowUnsupportedSystem = true;

  security.polkit.enable = true;
  services.udisks2.enable = true;

  xdg.portal.enable = true;
  xdg.portal.extraPortals = [ pkgs.xdg-desktop-portal-gtk ];

  services.dbus.enable = true;  
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.kernelPackages = pkgs.linuxPackages_zen; # Use latest kernel Package

  boot.supportedFilesystems = [ "ntfs" ];

  boot.kernelParams = [ "i915.modeset=1" ];

  networking.hostName = "nixTUF"; # Define your hostname.
  networking.wireless.enable = false;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; 
 
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
   extraGroups = [ "wheel" "docker" "networkmanager" "storage" "plugdev" "camera"]; # Enable ‘sudo’ for the user.
   packages = with pkgs; [
   tree
   kitty
   ];
};

 programs.firefox.enable = true;
 programs.hyprland.enable = true;

  services.xserver.enable = true;
  services.xserver.displayManager.gdm.enable = true;

 programs.thunar.enable = true;
 programs.thunar.plugins = with pkgs.xfce; [ thunar-volman ];

 services.gvfs.enable = true;

 environment.systemPackages = with pkgs; [
   digikam
   libmtp
   mtpfs
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
   qogir-icon-theme
   gphoto2
   mangohud
   protonup
   pavucontrol
   jq
   todoist-electron
   discord
   notion-app
   spotify
   obsidian
   lshw
   ntfs3g
   glxinfo
   vulkan-tools
   iwd
   networkmanager
   networkmanagerapplet
   protonvpn-gui
   unison
   altus
   cowsay
   libffi
   libffi.dev
   devenv
   _7zz
   mpris-timer
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
   font-awesome 
];


 services.openssh.enable = true; # Enable SSH

  system.stateVersion = "25.05"; # Just dont change it.

 stylix = {
   enable = true;
##   image = ../wallpapers/wallpaper.jpg;
   base16Scheme = "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
   polarity = "dark";
   autoEnable = true;
 };

 programs.steam.enable = true;
 programs.steam.gamescopeSession.enable = true;
 programs.gamemode.enable = true; 
 

 hardware.graphics = {
   enable = true;
   enable32Bit = true;
   extraPackages = with pkgs; [
      libvdpau
      vaapiVdpau
      libva
      vulkan-loader
      vulkan-validation-layers
      nvidia-vaapi-driver
    ];
 };

 virtualisation.docker.enable = true;
 virtualisation.docker.daemon.settings = {
    "dns" = [ "8.8.8.8" "1.1.1.1" ];
  };


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
   powerManagement.finegrained = false;
   nvidiaSettings = true;
#   hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_550;
   package = config.boot.kernelPackages.nvidiaPackages.stable;
   open = true;
   prime = {
    sync.enable = true; 
    intelBusId = "PCI:0:2:0";
    nvidiaBusId = "PCI:1:0:0";
   };
#   dynamicBoost.enable = true;
   nvidiaPersistenced = true;
 };

 services.xserver.videoDrivers = [ "nvidia" ];

}

