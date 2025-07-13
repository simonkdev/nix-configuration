{ pkgs, lib, ... }:

{
  
  programs.wofi = {
   enable = true;
   style = ''
    /* CUSTOM ROUND - CUSTOM THEME WITH ROUNDING*/

window {
margin: 0px;
border: 2px solid;
}

#input {
margin: 5px;
border-radius: 12px;
background-color: transparent;
}

#inner-box {
margin: 5px;
border-radius: 12px;
}

#outer-box {
margin: 5px;
border-radius: 12px;
}

#scroll {
margin: 0px;
border: none;
}

#text {
margin: 5px;
border: none;
}

#entry {
border-radius: 12px;
}

#entry:selected {
border-radius: 12px;
border: 2px solid;
}

#entry:nth-child(even),
#entry:nth-child(odd) {
background-color: transparent;
}

  '';
  };

}
	
