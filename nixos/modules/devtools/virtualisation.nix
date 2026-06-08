{
  config,
  lib,
  pkgs,
  ...
}: {
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.docker = {
    package = pkgs.docker_29;
    enable = true;
    enableOnBoot = true;
  };
}
