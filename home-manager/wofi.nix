{ pkgs, lib, ... }:

{
  
  programs.wofi = {
   enable = true;
   style = ''
    /* CUSTOM ROUND - CUSTOM THEME WITH ROUNDING*/

window {
margin: 0px;
border-radius: 12px;
}

#input {
margin: 5px;
border-radius: 12px;
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
}

#entry:nth-child(even),
#entry:nth-child(odd) {
background-color: transparent;
}

  '';
  };

}
	
