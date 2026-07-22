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
    image = /home/simonkdev/nixsys/wallpapers/obi-wan-vs-vader-uw.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/nord.yaml";
    ## ashes, brewer, ayu-mirage, catppuccin-mocha, darktooth, dracula, gruvbox-material-dark-hard, gruvbox-dark-hard, black-metal-khold

    targets = {
      qt.platform = "qtct"; # or "qt5ct", "kde", etc.
      qt.enable = true;
      btop.enable = true;
      firefox.enable = true;
      kde.enable = true;
      librewolf.profileNames = [ "simonkdev" ];
      swaync.enable = true;
      micro.enable = true;
    };

    cursor = {
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Ice";
      size = 16;
    };

    fonts.sizes = {
      applications = 10;
      terminal = 10;
      desktop = 10;
    };
  };
}
