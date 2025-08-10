{ config, pkgs, lib, ... }:

{
  programs.wofi = {
   enable = true;
   style = ''
    @keyframes fadeIn {
    0% {
    }
    100% {
    }
}

* {
    all:unset;
    font-family: 'CodeNewRoman Nerd Font Mono', monospace;
    font-size: 18px;
    outline: none;
    border: none;
    text-shadow:none;
    background-color:transparent;
}

window {
    all:unset;
    padding: 20px;
    border-radius: 0px;
    background-color: alpha(${config.lib.stylix.colors.withHashtag.base00}, 0.5)
}
#inner-box {
    margin: 2px;
    padding: 5px
    border: none;
}
#outer-box {    
    border: none;
}
#scroll {
    margin: 0px;
    padding: 30px;
    border: none;
}
#input {
    all:unset;
    margin-left:20px;
    margin-right:20px;
    margin-top:20px;
    padding: 20px;
    border: none;
    color: ${config.lib.stylix.colors.withHashtag.base05};
    outline: none;
    box-shadow: 1px 1px 5px rgba(0,0,0, .5);
    border-radius:10;
    background-color: alpha(${config.lib.stylix.colors.withHashtag.base01}, 0.2);
}
#input image {
    border: none;
    color: ${config.lib.stylix.colors.withHashtag.base09};
    padding-right:10px;
}
#input * {
    border: none;
    outline: none;
}

#input:focus {
    outline: none;
    border: none;

    border-radius:10;
}
#text {
    margin: 5px;
    border: none;
    outline: none;
    color: ${config.lib.stylix.colors.withHashtag.base05};
}
#text {
    margin: 5px;
    border: none;
    outline: none;
    color: ${config.lib.stylix.colors.withHashtag.base05};
}
#entry {
    border: none;
    margin: 5px;
    padding: 10px;
}
#entry arrow {
    border: none;
    color: ${config.lib.stylix.colors.withHashtag.base08};
}
#entry:selected {
    box-shadow: 1px 1px 5px rgba(255,255,255, .03);
    border: none;
    border-radius: 20px;
    background-color:transparent;
}
#entry:selected #text {
    color: ${config.lib.stylix.colors.withHashtag.base0C};
}
#entry:drop(active) {
    background-color: ${config.lib.stylix.colors.withHashtag.base0C};
}
   '';
  };
   home.file."/home/simonkdev/.config/wofi/config".source = "/home/simonkdev/nixsys/home-manager/modules/wofi/config";

}
	
