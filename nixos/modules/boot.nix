{ config, lib, pkgs, ... }:

{
  
  boot = {
     
     loader = { 
     systemd-boot.enable = true;
     efi.canTouchEfiVariables = true;
     };
     
     kernelPackages = pkgs.linuxPackages_zen; # Use latest kernel Package

     supportedFilesystems = [ "ntfs" ];

     kernelParams = [ "i915.modeset=1" "intel=iommu=on"];
  }; 

}