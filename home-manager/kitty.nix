{ config, pkgs, ... }:

{
  programs.kitty = {

     enable = true;
     font = {
      name = "nerdfonts droid-sans-mono";
      size = 9;
     };     

  };


}     
