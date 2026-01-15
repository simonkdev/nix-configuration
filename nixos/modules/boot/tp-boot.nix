{
  config,
  lib,
  pkgs,
  ...
}: {
  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };

    #kernelPackages = pkgs.linuxPackages_zen; # Use latest kernel Package

    boot.kernelPackages = pkgs.linuxPackagesFor (
      pkgs.linux_zen.override {
        version = "6.17.7";
        src = pkgs.fetchurl {
          url = "https://github.com/zen-kernel/zen-kernel/archive/refs/tags/v6.17.7-zen1.tar.gz";
          sha256 = "1a05r1797k2qmpxksjgyyk4sgdjd3lfcdql0hbmn0ninf5r4i58b";
        };
      }
    );
    supportedFilesystems = ["ntfs"];

    #     kernelParams = [ "i915.modeset=1" "intel=iommu=on"];
  };
}
