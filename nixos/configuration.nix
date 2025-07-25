{ config, lib, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      /home/simonkdev/nixsys/nixos/modules/virtualisation.nix
      /home/simonkdev/nixsys/nixos/modules/stylix.nix
      /home/simonkdev/nixsys/nixos/modules/networking.nix
      /home/simonkdev/nixsys/nixos/modules/misc.nix
      /home/simonkdev/nixsys/nixos/modules/graphics.nix
      /home/simonkdev/nixsys/nixos/modules/gaming.nix
      /home/simonkdev/nixsys/nixos/modules/boot.nix
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
   hyprland.enable = true;
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
     };
     printing.enable = true; # Enable Printing
     pulseaudio.enable = false; # Enable Audio
     udisks2.enable = true;
     dbus.enable = true;  
  };

 environment.systemPackages = with pkgs; [
  # --- Media & Photography ---
  digikam
  libmtp
  mtpfs
  gphoto2

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
  glxinfo
  vulkan-tools
  unison
  p7zip
  virtiofsd
  onlyoffice-desktopeditors

  # --- Development Tools ---
  git
  gh
  jq
  libffi
  libffi.dev
  devenv
  home-manager
  isoimagewriter

  # --- Audio & Video ---
  pamixer
  pavucontrol
  mangohud
  protonup

  # --- Productivity & Notes ---
  todoist-electron
  obsidian
  altus

  # --- Communication / Media  ---
  discord
  spotify

  # --- Desktop & UI ---
  hyprshot
  qogir-icon-theme
  gedit
  cowsay
  cmatrix
  cbonsai

 ];

 fonts.packages = with pkgs; [
   nerd-fonts.fira-code
   nerd-fonts.droid-sans-mono
   nerd-fonts.jetbrains-mono
   font-awesome 
];

}

