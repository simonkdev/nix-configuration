{
  config,
  lib,
  pkgs,
  ...
}: {
  ## bathory, gorgoroth,
  stylix = {
    enable = true;
    image = ~/nixsys/wallpapers/switch-uw.png;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-khold.yaml";
    ## ashes, brewer, catppuccin-mocha, darktooth, dracula, gruvbox-material-dark-hard, gruvbox-dark-hard

    targets = {
      btop.enable = true;
      firefox.enable = true;
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
      name = lib.mkForce "Gruvbox";
      package = lib.mkForce pkgs.gruvbox-plus-icons;
      ## quogir + pkgs.qogir-icon-theme
    };
  };
}
