{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.wofi = {
    enable = true;
    style = ''
      /* Monokai Color Scheme */

      * {
        font-family: 'CodeNewRoman Nerd Font Mono', monospace;
        font-size: 15px;
      }

      window {
        border: 1px solid ${config.lib.stylix.colors.withHashtag.base0C}; /* Highlight color */
      }

      #input {
        margin-bottom: 15px;
        padding: 3px;
        border-radius: 5px;
        border: none;
        color: ${config.lib.stylix.colors.withHashtag.base0C}; /* Highlight color */
      }

      #inner-box {
        background-color: ${config.lib.stylix.colors.withHashtag.base01}; /* Base3 color */
      }

      #outer-box {
        margin: 1px;
        padding: 15px;
        background-color: ${config.lib.stylix.colors.withHashtag.base00}; /* Base0 color */
      }

      #text {
        padding: 5px;
        color: ${config.lib.stylix.colors.withHashtag.base0C}; /* Highlight color */
      }

      #entry:nth-child() {
        color: ${config.lib.stylix.colors.withHashtag.base07}; /* Base1 color */
      }

      #entry:nth-child(even),
      #entry:nth-child(odd) {
        background-color: transparent;
      }

      #entry:selected {
        border: 2px solid ${config.lib.stylix.colors.withHashtag.base0C}; /* Highlight color */
      }
    '';
  };
  home.file."/home/simonkdev/.config/wofi/config".source = "/home/simonkdev/nixsys/home-manager/modules/wofi/config";
}
