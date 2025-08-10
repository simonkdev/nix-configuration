{ pkgs, lib, ... }:

{
  
  programs.wofi = {
   enable = true;
   style = home.file."/home/simonkdev/nixsys/home-manager/modules/style.css";
   config = home.file."/home/simonkdev/nixsys/home-manager/modules/wofi/config";
  };

}
	
