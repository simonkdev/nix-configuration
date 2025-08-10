 { config, lib, pkgs, ... }:
 {

    hardware.nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
      nvidiaSettings = true;
  #   hardware.nvidia.package = config.boot.kernelPackages.nvidiaPackages.legacy_550;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
      open = true;
      prime = {
        sync.enable = true; 
        intelBusId = "PCI:0:2:0";
        nvidiaBusId = "PCI:1:0:0";
      };
  #   dynamicBoost.enable = true;
      nvidiaPersistenced = true;
    };

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.graphics = {
      enable = true;
      enable32Bit = true;
      extraPackages = with pkgs; [
          libvdpau
          vaapiVdpau
          libva
          vulkan-loader
          vulkan-validation-layers
          nvidia-vaapi-driver
      ];
    };

    xdg.portal = { 
      enable = true;
       extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };
 }