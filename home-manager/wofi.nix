{ pkgs, lib, ... }:

{
  
  programs.wofi = {
   enable = true;
   style = ''
    /* CUSTOM ROUND - CUSTOM THEME WITH ROUNDING*/

window {
margin: 0px;
border: 2px solid #a7ffbc;
background-color: #1e2623;
border-radius: 12px;
}

#input {
margin: 5px;
border: 0px solid #a7ffbc;
color: #D3C6AA;
background-color: #27332e;
border-radius: 12px;
}

#inner-box {
margin: 5px;
border-radius: 12px;
border: none;
background-color: #1e2623;
}

#outer-box {
margin: 5px;
border: none;
border-radius: 12px;
background-color: #1e2622;
}

#scroll {
margin: 0px;
border: none;
}

#text {
margin: 5px;
border: none;
color: #aad3b2;
}

#entry:selected {
border-radius: 12px;
background-color: #27332f;
}

  '';
  };

}
	
