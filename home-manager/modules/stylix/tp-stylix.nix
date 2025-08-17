{
  config,
  lib,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    image = ~/nixsys/wallpapers/wallpaper.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    ## ashes, brewer, catppuccin-mocha, darktooth, dracula, gruvbox-material-dark-hard, gruvbox-dark-hard

    targets = {
      btop.enable = true;
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
      name = "Qogir";
      package = pkgs.qogir-icon-theme;
    };
  };
}
