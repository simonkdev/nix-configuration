{
  config,
  lib,
  pkgs,
  unpkgs,
  inputs,
  ...
}: {
  imports = [
    /etc/nixos/hardware-configuration.nix
    ../modules/misc/stylix.nix
    ../modules/devtools/networking.nix
    ../modules/misc/tp-misc.nix
    ../modules/boot/tp-boot.nix
  ];

  users.users.simonkdev = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker" "networkmanager" "storage" "plugdev" "camera" "kvm" "libvirtd"]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
      kitty
      #   pkgs.nvchad
    ];
  };

  programs = {
    firefox.enable = true;
    localsend.enable = true;
    npm.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [thunar-volman tumbler];
    };
  };

  security.polkit.enable = true;

  services = {
    gvfs.enable = true;
    xserver = {
      xkb.layout = "de";
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
    mysql-workbench
    #  pkgs.nvchad
    sshfs
    python3Minimal
    go
    cargo

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
