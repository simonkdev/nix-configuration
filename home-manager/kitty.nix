{ config, pkgs, ... }:

{

  builtins.trace "Loading kitty.nix" {};

  programs.kitty = {

     enable = true;
     
  };


}     
