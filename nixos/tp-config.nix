{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      /home/simonkdev/nixsys/nixos/tp-hardware.nix
      /home/simonkdev/nixsys/nixos/modules/stylix.nix
      /home/simonkdev/nixsys/nixos/modules/networking.nix
      /home/simonkdev/nixsys/nixos/modules/misc.nix
      /home/simonkdev/nixsys/nixos/modules/tp-boot.nix
    ];

  users.users.simonkdev = {
   isNormalUser = true;
   extraGroups = [ "wheel" "docker" "networkmanager" "storage" "plugdev" "camera" "kvm" "libvirtd"]; # Enable ‘sudo’ for the user.
   packages = with pkgs; [
   tree
   kitty
   ];
  };

  programs = { 
   firefox.enable = true;
   localsend.enable = true;
   thunar = { 
     enable = true;
     plugins = with pkgs.xfce; [ thunar-volman ];
   };
  };

  services = { 
     gvfs.enable = true;
     xserver = {
     enable = true;
     displayManager.gdm.enable = true;
     desktopManager.gnome.enable = true;
     };
     printing.enable = true; # Enable Printing
     pulseaudio.enable = false; # Enable Audio
     udisks2.enable = true;
     dbus.enable = true;  
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
     vaapiIntel 
     intel-media-driver
     intel-media-sdk
    ];
  };


 environment.gnome.excludePackages = with pkgs; [
  baobab
  cheese
  eog
  epiphany
  gedit
  simple-scan
  totem
  yelp
  evince
  geary
  seahorse
  gnome-calendar
  gnome-characters
  gnome-contacts
  gnome-maps
  gnome-music
  gnome-photos
  gnome-weather
  gnome-disk-utility
  gnome-connections
  gnome-terminal
  gnome-tour
 ];

 environment.systemPackages = with pkgs; [

  # --- Networking & Connectivity ---
  iwd
  networkmanager
  networkmanagerapplet
  protonvpn-gui

  # --- File Management & Utilities ---
  wget
  nano
  fastfetch
  nnn
  lshw
  ntfs3g
  p7zip
  onlyoffice-desktopeditors
  unison
  yazi
 
  # --- Development Tools ---
  git
  gh
  jq
  libffi
  libffi.dev
  devenv
  home-manager
  processing
  zulu24

  # --- Productivity & Notes ---
  todoist-electron
  obsidian
  altus

  # --- Communication / Media  ---
  discord
  spotify
  ani-cli
  mov-cli

  # --- Desktop & UI ---
  cowsay
  cmatrix
  cbonsai
  pipes-rs
 ];

 fonts.packages = with pkgs; [
   nerd-fonts.fira-code
   nerd-fonts.droid-sans-mono
   nerd-fonts.jetbrains-mono
   font-awesome 
];

}

