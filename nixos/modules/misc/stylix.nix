{
  config,
  lib,
  pkgs,
  ...
}: {
  stylix = {
    enable = true;
    ##   image = ../wallpapers/wallpaper.jpg;
    base16Scheme = "${pkgs.base16-schemes}/share/themes/black-metal-khold.yaml";
    polarity = "dark";
    autoEnable = true;
    targets = {
      gtk.enable = true;
    };
  };

  console = {
    font = "Lat2-Terminus16";
    keyMap = lib.mkForce "de";
    useXkbConfig = true; # use xkb.options in tty.
  };
}
