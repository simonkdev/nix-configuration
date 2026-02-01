{
  config,
  lib,
  pkgs,
  unpkgs,
  inputs,
  ...
}: {
  imports = [
    ./tp-hardware.nix
    ../modules/misc/stylix.nix
    ../modules/devtools/networking.nix
    ../modules/misc/tp-misc.nix
    ../modules/boot/tp-boot.nix
    ../modules/devtools/virtualisation.nix
    ../modules/gaming/gaming.nix
  ];

  users.users.simonkdev = {
    isNormalUser = true;
    extraGroups = ["wheel" "docker" "networkmanager" "storage" "plugdev" "camera" "kvm" "libvirtd" "dialout"]; # Enable ‘sudo’ for the user.
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
      plugins = with pkgs.xfce; [thunar-volman tumbler];
    };
  };

  security.polkit.enable = true;

  virtualisation.docker = {
    enable = true;
    enableOnBoot = lib.mkForce false;
  };

  virtualisation.forwardPorts = [
    {
      from = "host";
      host.port = 8096;
      guest.port = 8096;
    }
  ];

  networking.firewall.allowedTCPPorts = [8096];

  services = {
    fprintd = {
      enable = true;
      tod = {
        enable = true;
        driver = pkgs.libfprint-2-tod1-goodix-550a;
      };
    };
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
      intel-vaapi-driver
      intel-media-driver
      intel-media-sdk
      libvdpau
      vaapiVdpau
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
    pamixer
    pavucontrol

    # --- Desktop & UI ---
    hyprshot
    qogir-icon-theme
    cowsay
    cmatrix
    cbonsai
    pipes-rs
  ];

  #home-manager.backupFileExtension = "backup";

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
    font-awesome
  ];
}
