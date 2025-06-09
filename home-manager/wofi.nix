{ pkgs, lib, ... }:

{
  
  programs.wofi = {
   enable = true;
   style = ''
     /* for noobs like me, just copy and paste this into ~/.config/wofi/style.css. that is if you can do that... (no judging m8) */  
#input {
margin: 5px;
border: none;
color: #d8dee9;
background-color: #1e1e1e;
}

#inner-box {
margin: 5px;
border: none;
background-color: #1e1e1e; 
}

#outer-box {
margin: 5px;
border: none;
background-color: #1e1e1e;
}

#scroll {
margin: 0px;
border: 1e1e1e;
}

#text {
margin: 5px;
border: none;
color: #c4c4c4;
}

#entry:selected {
background-color: #1e1e1e;
}
/* Add rounded corners to the Wofi window */
window {
    border-radius: 10px; /* 10px radius for rounded corners */
}

  '';
  };

}
	
