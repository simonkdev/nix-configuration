{
  config,
  lib,
  pkgs,
  ...
}:
{
  ## bathory, gorgoroth, khold, mayhem, immortal
  stylix = {
    enable = true;

    # Use an existing wallpaper file so ImageMagick can open it during builds
    # image = /home/simonkdev/nixsys/wallpapers/planet-uw.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    ## ashes, brewer, ayu-mirage, catppuccin-mocha, darktooth, dracula, gruvbox-material-dark-hard, gruvbox-dark-hard, black-metal-khold

    targets = {
      qt.platform = "qtct"; # or "qt5ct", "kde", etc.
      qt.enable = true;
      btop.enable = true;
      firefox.enable = true;
      # kde.enable = true;
      gnome.enable = true;
      gtk.enable = true;
      firefox.profileNames = [ "simonkdev" ];
      swaync.enable = true;
      micro.enable = true;
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
    enable = lib.mkForce false;

    iconTheme = {
      name = lib.mkForce "WhiteSur";
      package = lib.mkForce pkgs.whitesur-icon-theme;
      #package = lib.mkForce pkgs.cosmic-icons;
      ## quogir + pkgs.qogir-icon-theme
    };
  };

}
