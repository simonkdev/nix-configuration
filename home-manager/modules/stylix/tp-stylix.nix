{
  config,
  lib,
  pkgs,
  ...
}: {
  ## bathory, gorgoroth, khold, mayhem, immortal
  stylix = {
    enable = true;
    # absolute path avoids Nix treating it like a source derivation
    image = "/home/simonkdev/nixsys/wallpapers/porsche-tokyo-uw.png";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml";
    ## ashes, brewer, catppuccin-mocha, darktooth, dracula, gruvbox-material-dark-hard, gruvbox-dark-hard, black-metal-khold

    targets = {
      btop.enable = true;
      firefox.enable = true;
      gnome.enable = true;
      gtk.enable = false;
      librewolf.profileNames = ["simonkdev"];
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

    # Avoid forcing evaluation of the package/name; use plain values so Nix doesn't try
    # to treat them as source archives during evaluation.
    theme = {
      name = "WhiteSur-dark";
      package = pkgs.whitesur-gtk-theme;
      ## quogir + pkgs.qogir-gtk-theme
    };

    iconTheme = {
      name = lib.mkForce "WhiteSur";
      package = lib.mkForce pkgs.whitesur-icon-theme;
      #package = lib.mkForce pkgs.cosmic-icons;
      ## quogir + pkgs.qogir-icon-theme
    };
  };
}
