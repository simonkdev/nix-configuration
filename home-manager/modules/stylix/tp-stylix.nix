{
  config,
  lib,
  pkgs,
  ...
}: {
  ## bathory, gorgoroth, khold, mayhem, immortal
  stylix = {
    enable = true;

    # Use an existing wallpaper file so ImageMagick can open it during builds
    image = /home/simonkdev/nixsys/wallpapers/wp11803867-aesthetic-clouds-computer-wallpapers.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-macchiato.yaml";
    ## ashes, brewer, ayu-mirage, catppuccin-mocha, darktooth, dracula, gruvbox-material-dark-hard, gruvbox-dark-hard, black-metal-khold

    targets = {
      qt.platform = "gnome"; # or "qt5ct", "kde", etc.
      #qt.enable = false;
      btop.enable = true;
      firefox.enable = true;
      kde.enable = false;
      gnome.enable = true;
      gtk.enable = true;
      librewolf.profileNames = ["simonkdev"];
      swaync.enable = true;
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 16;
    };

    fonts.sizes = {
      applications = 12;
      terminal = 12;
      desktop = 12;
    };
  };

  gtk = {
    enable = true;

    iconTheme = {
      name = lib.mkForce "WhiteSur";
      package = lib.mkForce pkgs.whitesur-icon-theme;
      #package = lib.mkForce pkgs.cosmic-icons;
      ## quogir + pkgs.qogir-icon-theme
    };
  };
}
