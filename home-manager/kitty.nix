{ config, pkgs, ... }:

{
  programs.kitty = {

     enable = true;
     font = {
      name = "nerdfonts droid-sans-mono";
      size = 9;
     };     
  
  settings = {
     "enable_audio_bell" = "no";
     "background_opacity" = "0.49";
     "confirm_os_window_close" = 0;


  };


}     
