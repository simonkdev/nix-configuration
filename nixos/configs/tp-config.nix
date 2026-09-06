{
  config,
  lib,
  pkgs,
  unpkgs,
  inputs,
  modulesPath,
  ...
}:
{
  imports = [
    ./tp-hardware.nix
    ../modules/devtools/networking.nix
    ../modules/misc/tp-misc.nix
    ../modules/boot/tp-boot.nix
    ../modules/devtools/virtualisation.nix
  ];

  users.users.simonkdev = {
    isNormalUser = true;
    extraGroups = [
      "wheel"
      "docker"
      "networkmanager"
      "storage"
      "plugdev"
      "camera"
      "kvm"
      "libvirtd"
      "dialout"
    ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
      kitty
      #   pkgs.nvchad
    ];
  };

  programs = {
    kdeconnect.enable = true;
    localsend.enable = true;
    npm.enable = true;
    yazi.enable = true;
    hyprland.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-volman
        tumbler
      ];
    };
  };

  xdg.portal = {
    enable = true;

    extraPortals = with pkgs; [
      xdg-desktop-portal-cosmic
      xdg-desktop-portal-gtk
    ];

    config = {
      cosmic = {
        default = [ "cosmic" ];
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      };

      common = {
        default = [ "gtk" ];
        "org.freedesktop.impl.portal.FileChooser" = [ "gtk" ];
      };
    };
  };

  security.polkit.enable = true;

  virtualisation.docker = {
    package = lib.mkForce pkgs.docker_29;
    enable = true;
    enableOnBoot = lib.mkForce false;
  };

  # virtualisation.qemu.networkingOptions = lib.mkForce [
  #   "-device e1000,netdev=net0"
  #   "-netdev user,id=net0,hostfwd=tcp:127.0.0.1:8096-:8096,\${QEMU_NET_OPTS:+,$QEMU_NET_OPTS}"
  # ];

  networking.firewall.allowedTCPPorts = [
    8096
  ];

  services = {
    flatpak.enable = true;
    gvfs.enable = true;
    xserver = {
      xkb.layout = "de";
      enable = true;
    };
    printing = {
      enable = true; # Enable Printing
      drivers = [
        pkgs.epson-escpr
        pkgs.epson-escpr2
      ];
    };
    pulseaudio.enable = false; # Enable Audio
    udisks2.enable = true;
    dbus.enable = true;
    tailscale.enable = true;
    displayManager.sddm = lib.mkForce {
      enable = true; # themes are in /run/current-system/sw/share/sddm/themes by default
      theme = "breeze";
    };
  };

  services.desktopManager = {
    # plasma6.enable = true;
    cosmic.enable = true;
  };

  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-vaapi-driver
      intel-media-driver
      libvdpau
      libva-vdpau-driver
      libva
      vulkan-loader
      vulkan-validation-layers
    ];
  };

  environment.gnome.excludePackages = with pkgs; [
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
    mysql-workbench
    #  pkgs.nvchad
    sshfs
    python3Minimal
    cargo
    qemu
    iptables
    firewalld

    # --- Productivity & Notes ---
    todoist-electron
    obsidian
    altus

    # --- Communication / Media  ---
    discord
    spotify
    ani-cli
    kdePackages.kdenlive
    gimp3
    vlc
    pamixer
    pavucontrol
    epson-escpr2

    # --- Desktop & UI ---
    hyprshot
    qogir-icon-theme
    cowsay
    cmatrix
    cbonsai
    pipes-rs
    elegant-sddm
    kdePackages.qtstyleplugin-kvantum
    qt6Packages.qtstyleplugin-kvantum
    libsForQt5.qtstyleplugin-kvantum
  ];

  #home-manager.backupFileExtension = "backup";

  services.udev.packages = with pkgs; [
    platformio-core.udev
    openocd
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
    font-awesome
  ];
}
