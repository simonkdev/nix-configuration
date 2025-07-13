{ config, lib, pkgs, ... }:

{
  networking = {
  
  hostName = "nixTUF"; # Define your hostname.
  wireless.enable = false;  # Enables wireless support via wpa_supplicant.
  networkmanager.enable = true; 
  
  };

  services.openssh.enable = true; # Enable SSH


}
