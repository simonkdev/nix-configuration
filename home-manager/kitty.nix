{ config, pkgs, lib, ... }:

{
  programs.kitty = {

     enable = true;
     font = {
    ##  name = "nerdfonts droid-sans-mono";
      size = lib.mkDefault  9;
      };     
  
  settings = {
     "enable_audio_bell" = "no";
     "background_opacity" = lib.mkDefault "0.20";
     "confirm_os_window_close" = 0;
  };

  };


}     
