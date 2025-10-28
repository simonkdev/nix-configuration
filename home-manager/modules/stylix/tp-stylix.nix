{
  config,
  lib,
  pkgs,
  ...
}: {
  ## bathory, gorgoroth, khold, mayhem, immortal
  stylix = {
    enable = true;
    image = ~/nixsys/wallpapers/garage-ultrawide.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-khold.yaml";
    ## ashes, brewer, catppuccin-mocha, darktooth, dracula, gruvbox-material-dark-hard, gruvbox-dark-hard

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
