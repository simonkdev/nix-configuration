 { config, lib, pkgs, ...}:

 {
  stylix = { 
      enable = true;
      image = ~/nixsys/wallpapers/Mandalorian.jpg;
      base16Scheme = "${pkgs.base16-schemes}/share/themes/dracula.yaml";
   ## ashes, brewer, catppuccin-mocha, darktooth, dracula, gruvbox-material-dark-hard, gruvbox-dark-hard
      
      targets = {
        btop.enable = true;
      };

      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Ice";
        size = 16;
      };
      
      fonts.sizes = {
       applications = 9;
       terminal = 9;
       desktop = 9;
      };

  };

  gtk = {
      enable = true;
       
      iconTheme = {
      name = "Qogir";
      package = pkgs.qogir-icon-theme;
      };
  };

 }
