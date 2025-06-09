{ pkgs, lib, ... }:

{
  
  programs.wofi = {
   enable = true;
   style = ''
     window { 
        margin: 0px;
	padding: 10px;
	border-radius: 10px;
	font-family: JetBrainsMono, monospace;
  	font-size: 16px;
     };

    #input {
	margin: 10px;
	padding: 6px 10px;
	border-radius 6px;
    };

    #entry {
	padding: 6px 10px;
	margin: 2px 0;
	border-radius: 6px;
    };
  ''
  };

}
	
