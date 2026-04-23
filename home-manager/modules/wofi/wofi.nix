{
  config,
  pkgs,
  lib,
  ...
}: {
  programs.wofi = {
    enable = true;
    style = ''
      /* Rofi Colors - Monokai Theme */
      * {
        background: ${config.lib.stylix.colors.withHashtag.base00};
        foreground: ${config.lib.stylix.colors.withHashtag.base05};
        selected: ${config.lib.stylix.colors.withHashtag.base0A};
        urgent: ${config.lib.stylix.colors.withHashtag.base08};
        active: ${config.lib.stylix.colors.withHashtag.base0B};
        normal: ${config.lib.stylix.colors.withHashtag.base05};
      }

      /* General Styling */
      configuration {
        modi: "window,drun,run";
        font: "CodeNewRoman Nerd Font Mono 18";
        padding: 4;
        fixed-num-columns: true;
        fixed-width: true;
        hide-scrollbar: true;
        urgent-enabled: true;
        cycle: true;
        sidebar-mode: true;
        show-icons: true;
      }

      /* Main Window */
      window {
        background: ${config.lib.stylix.colors.withHashtag.base00};
        border: 3px solid ${config.lib.stylix.colors.withHashtag.base01};
        border-radius: 8px;
        padding: 10px;
      }

      /* Entries */
      element {
        padding: 8px;
        margin: 2px;
        border-radius: 4px;
        border: 1px solid transparent;
      }

      element selected {
        background: ${config.lib.stylix.colors.withHashtag.base0A};
        color: ${config.lib.stylix.colors.withHashtag.base00};
        border: 1px solid ${config.lib.stylix.colors.withHashtag.base0A};
      }

      element urgent {
        background: ${config.lib.stylix.colors.withHashtag.base08};
        color: ${config.lib.stylix.colors.withHashtag.base00};
      }

      element active {
        color: ${config.lib.stylix.colors.withHashtag.base0B};
      }

      /* Prompt */
      prompt {
        background: ${config.lib.stylix.colors.withHashtag.base00};
        color: ${config.lib.stylix.colors.withHashtag.base05};
        padding: 8px;
      }

      /* Entry */
      entry {
        background: ${config.lib.stylix.colors.withHashtag.base01};
        color: ${config.lib.stylix.colors.withHashtag.base05};
        border: 1px solid ${config.lib.stylix.colors.withHashtag.base01};
        border-radius: 4px;
        padding: 8px;
      }

      entry:selected {
        background: ${config.lib.stylix.colors.withHashtag.base0A};
        color: ${config.lib.stylix.colors.withHashtag.base00};
      }

      /* Mode Switcher */
      mode-switcher {
        background: ${config.lib.stylix.colors.withHashtag.base01};
        color: ${config.lib.stylix.colors.withHashtag.base05};
        border: 1px solid ${config.lib.stylix.colors.withHashtag.base01};
        border-radius: 4px;
        padding: 4px;
      }

      mode-switcher:selected {
        background: ${config.lib.stylix.colors.withHashtag.base0A};
        color: ${config.lib.stylix.colors.withHashtag.base00};
      }
    '';
  };
  home.file."/home/simonkdev/.config/wofi/config".source = "/home/simonkdev/nixsys/home-manager/modules/wofi/config";
}
