{ config, pkgs, ... }:

{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/TextEditor" = { style-scheme = "stylix"; };

      "org/gnome/control-center" = {
        last-panel  = "keyboard";
        window-state = "(980, 642, false)";
      };

      "org/gnome/desktop/app-folders" = {
        folder-children = [ "System" "Utilities" "YaST" "Pardus" ];
      };

      "org/gnome/desktop/app-folders/folders/Pardus" = {
        categories = [ "X-Pardus-Apps" ];
        name       = "X-Pardus-Apps.directory";
        translate  = true;
      };

      "org/gnome/desktop/app-folders/folders/System" = {
        apps = [
          "nm-connection-editor.desktop"
          "org.gnome.baobab.desktop"
          "org.gnome.DiskUtility.desktop"
          "org.gnome.Logs.desktop"
          "org.gnome.SystemMonitor.desktop"
        ];
        name      = "X-GNOME-Shell-System.directory";
        translate = true;
      };

      "org/gnome/desktop/app-folders/folders/Utilities" = {
        apps = [
          "org.gnome.Connections.desktop"
          "org.gnome.Evince.desktop"
          "org.gnome.FileRoller.desktop"
          "org.gnome.font-viewer.desktop"
          "org.gnome.Loupe.desktop"
          "org.gnome.seahorse.Application.desktop"
        ];
        name      = "X-GNOME-Shell-Utilities.directory";
        translate = true;
      };

      "org/gnome/desktop/app-folders/folders/YaST" = {
        categories = [ "X-SuSE-YaST" ];
        name       = "suse-yast.directory";
        translate  = true;
      };

      "org/gnome/desktop/background" = {
        color-shading-type = "solid";
        picture-options    = "zoom";
        picture-uri        = "file:///nix/store/jf0vckmr8z01h81q42gjs5xiv6ybgr29-nix-magenta-blue-1920x1080.png";
        picture-uri-dark   = "file:///nix/store/jf0vckmr8z01h81q42gjs5xiv6ybgr29-nix-magenta-blue-1920x1080.png";
      };

      "org/gnome/desktop/break-reminders/eyesight" = { play-sound = true; };

      "org/gnome/desktop/break-reminders/movement" = {
        duration-seconds = 300;
        interval-seconds = 1800;
        play-sound       = true;
      };

      "org/gnome/desktop/input-sources" = {
        mru-sources = [ "('xkb','us')" ];
        sources     = [ "('xkb','de')" ];
        xkb-options = [];
      };

      "org/gnome/desktop/interface" = {
        color-scheme           = lib.mkForce "prefer-dark";
        cursor-size            = 16;
        cursor-theme           = "Bibata-Modern-Ice";
        document-font-name     = "DejaVu Serif 11";
        font-name              = "DejaVu Sans 12";
        gtk-theme              = "adw-gtk3";
        icon-theme             = "Qogir";
        monospace-font-name    = "DejaVu Sans Mono 12";
        show-battery-percentage = true;
      };

      "org/gnome/desktop/notifications" = {
        application-children = [ "firefox" "discord" ];
      };

      "org/gnome/desktop/notifications/application/discord" = { application-id = "discord.desktop"; };
      "org/gnome/desktop/notifications/application/firefox"  = { application-id = "firefox.desktop"; };

      "org/gnome/desktop/peripherals/mouse" = { accel-profile = "flat"; };
      "org/gnome/desktop/peripherals/touchpad" = { two-finger-scrolling-enabled = true; };
      "org/gnome/desktop/screensaver" = { lock-enabled = false; };

      "org/gnome/desktop/search-providers" = {
        sort-order = [
          "org.gnome.Settings.desktop"
          "org.gnome.Contacts.desktop"
          "org.gnome.Nautilus.desktop"
        ];
      };

      "org/gnome/desktop/session" = { idle-delay = 600; };

      "org/gnome/desktop/wm/keybindings" = {
        close                        = [ "<Super>c" ];
        maximize                     = [ "<Super>Up" ];
        move-to-workspace-1          = [ "<Shift><Super>1" ];
        move-to-workspace-2          = [ "<Shift><Super>2" ];
        move-to-workspace-3          = [ "<Shift><Super>3" ];
        move-to-workspace-4          = [ "<Shift><Super>4" ];
        panel-run-dialog             = [ "<Super>r" ];
        switch-applications          = [ "<Alt>Tab" ];
        switch-applications-backward = [ "<Shift><Alt>Tab" ];
        switch-input-source          = [];
        switch-input-source-backward = [];
        switch-to-workspace-1        = [ "<Super>1" ];
        switch-to-workspace-2        = [ "<Super>2" ];
        switch-to-workspace-3        = [ "<Super>3" ];
        switch-to-workspace-4        = [ "<Super>4" ];
        toggle-fullscreen            = [ "<Super>f" ];
      };

      "org/gnome/eog/view" = { background-color = "#1e1e2e"; };
      "org/gnome/evolution-data-server" = { migrated = true; };
      "org/gnome/mutter/wayland/keybindings" = { restore-shortcuts = []; };

      "org/gnome/nautilus/preferences" = { migrated-gtk-settings = true; };
      "org/gnome/settings-daemon/plugins/color" = { night-light-schedule-automatic = false; };

      "org/gnome/settings-daemon/plugins/media-keys" = {
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
        ];
        mic-mute    = [ "F4" ];
        screensaver = [ "<Super>y" ];
        search      = [ "<Super>space" ];
        volume-down = [ "F2" ];
        volume-mute = [ "F1" ];
        volume-up   = [ "F3" ];
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>q";
        command = "kitty";
        name    = "kitty-launch";
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1" = {
        binding = "<Super>s";
        command = "discord";
        name    = "discord-launch";
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
        binding = "<Super>x";
        command = "firefox";
        name    = "firefox-launch";
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
        binding = "<Super>e";
        command = "thunar";
        name    = "thunar-launch";
      };

      "org/gnome/settings-daemon/plugins/power" = { power-button-action = "interactive"; };

      "org/gnome/shell" = {
        enabled-extensions               = [ "user-theme@gnome-shell-extensions.gcampax.github.com" ];
        welcome-dialog-last-shown-version = "48.1";
      };
      "org/gnome/shell/app-switcher" = { current-workspace-only = false; };
      "org/gnome/shell/extensions/user-theme" = { name = "Stylix"; };
      "org/gnome/shell/keybindings" = {
        show-screenshot-ui      = [ "<Super>p" ];
        switch-to-application-1 = [];
        switch-to-application-2 = [];
        switch-to-application-3 = [];
        switch-to-application-4 = [];
        toggle-quick-settings   = [];
      };
      "org/gnome/shell/world-clocks" = { locations = []; };
    };
  };
}
