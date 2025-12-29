{
  config,
  lib,
  pkgs,
  ...
}: {
  ## bathory, gorgoroth, khold, mayhem, immortal
  stylix = {
    enable = true;
    image = ~/nixsys/wallpapers/porsche-tokyo-uw.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    ## ashes, brewer, catppuccin-mocha, darktooth, dracula, gruvbox-material-dark-hard, gruvbox-dark-hard, black-metal-khold

    targets = {
      btop.enable = true;
      firefox.enable = true;
      gnome.enable = true;
      gtk.enable = true;
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
      name = lib.mkForce "Cosmic";
      package = lib.mkForce pkgs.cosmic-icons;
      ## quogir + pkgs.qogir-icon-theme
    };
  };
}
