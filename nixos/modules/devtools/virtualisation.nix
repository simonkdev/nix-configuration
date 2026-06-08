{
  config,
  lib,
  pkgs,
  ...
}: {
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  virtualisation.docker = {
    package = lib.mkForce pkgs.docker_29;
    enable = true;
    enableOnBoot = true;
  };
}
