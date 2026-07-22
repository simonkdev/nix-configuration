{
  config,
  lib,
  pkgs,
  unpkgs,
  inputs,
  modulesPath,
  ...
}:let
  sddm-astronaut = (pkgs.sddm-astronaut.override {
    embeddedTheme = "japanese_aesthetic";  # or any other theme
    themeConfig = {
      # Customize colors and settings
      HeaderTextColor = "#d5c4a1";
      Background = "Backgrounds/obi-wan-vs-vader-uw.jpg";
      # ... other theme configuration options
    };
  }).overrideAttrs (oldAttrs: {
    # Optional: Inject custom background image
    installPhase = oldAttrs.installPhase + ''
      chmod u+w $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/
      cp ${../../wallpapers/obi-wan-vs-vader-uw.jpg} \
        $out/share/sddm/themes/sddm-astronaut-theme/Backgrounds/obi-wan-vs-vader-uw.png
    '';
  });
in



{
  imports = [
    ./tp-hardware.nix
    ../modules/misc/stylix.nix
    ../modules/devtools/networking.nix
    ../modules/misc/tp-misc.nix
    ../modules/boot/tp-boot.nix
    ../modules/devtools/virtualisation.nix
    #../modules/gaming/gaming.nix
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
        enable = true;
        package = pkgs.kdePackages.sddm;
        extraPackages = with pkgs; [
          kdePackages.qtmultimedia # Required for video backgrounds/audio
        ];
        theme = "sddm-astronaut-theme";
      };
  };


  services.desktopManager.plasma6.enable = true;

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
    sddm-astronaut
  ];

  #home-manager.backupFileExtension = "backup";

  fonts.packages = with pkgs; [
    nerd-fonts.fira-code
    nerd-fonts.droid-sans-mono
    nerd-fonts.jetbrains-mono
    font-awesome
  ];
}
