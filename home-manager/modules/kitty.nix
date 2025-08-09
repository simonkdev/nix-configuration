{ config, pkgs, lib, ... }:

{
  programs.kitty = {

     enable = true;
     font = {
    ##  name = "nerdfonts droid-sans-mono";
      size = lib.mkForce  9;
      };     
  
  settings = {
     "enable_audio_bell" = "no";
     "background_opacity" = lib.mkForce "0.8";
     "confirm_os_window_close" = 0;
  };

  };


}     
