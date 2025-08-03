{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs.gnomeExtensions; [
      tiling-assistant
      blur-my-shell
      dock-from-dash
      search-light
  ];

  programs.gnome-shell = {
    enable = true;
#    extensions = with pkgs.gnomeExtensions; [
#      tiling-assistant
#      blur-my-shell
#      dock-from-dash
#      ];
  };
  dconf = {
    enable = true;
    settings = {
    "org/gnome/Console" = {
      last-window-maximised = false;
      last-window-size = [812 504];
    };

    "org/gnome/Extensions" = {
      window-height = 520;
      window-maximized = false;
      window-width = 958;
    };

    "org/gnome/Snapshot" = {
      is-maximized = true;
      window-height = 640;
      window-width = 800;
    };

    "org/gnome/TextEditor" = {
      style-scheme = "stylix";
    };

    "org/gnome/control-center" = {
      last-panel = "applications";
      window-state = [980 640 0];
    };

    "org/gnome/desktop/a11y/magnifier" = {
      mag-factor = 3.0;
    };

    "org/gnome/desktop/app-folders" = {
      folder-children = ["System" "Utilities" "YaST" "Pardus"];
    };

    "org/gnome/desktop/app-folders/folders/Pardus" = {
      categories = ["X-Pardus-Apps"];
      name = "X-Pardus-Apps.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/System" = {
      apps = [
        "nm-connection-editor.desktop"
        "org.gnome.baobab.desktop"
        "org.gnome.DiskUtility.desktop"
        "org.gnome.Logs.desktop"
        "org.gnome.SystemMonitor.desktop"
      ];
      name = "X-GNOME-Shell-System.directory";
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
      name = "X-GNOME-Shell-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = ["X-SuSE-YaST"];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/background" = {
      color-shading-type = "solid";
      picture-options = "zoom";
      picture-uri = "file:///nix/store/xhl96ggmf2vz619d9xhlsa2g2h0jaivc-dominik-mayer-17.jpg";
      picture-uri-dark = "file:///nix/store/xhl96ggmf2vz619d9xhlsa2g2h0jaivc-dominik-mayer-17.jpg";
    };

    "org/gnome/desktop/break-reminders/eyesight" = {
      play-sound = true;
    };

    "org/gnome/desktop/break-reminders/movement" = {
      duration-seconds = 300;
      interval-seconds = 1800;
      play-sound = true;
    };

    "org/gnome/desktop/input-sources" = {
      mru-sources = [];
      sources = [ (lib.mkTuple [ "xkb" "de" ])  ];
      xkb-options = [];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = lib.mkForce "prefer-dark";
      enable-hot-corners = true;
      font-name = "DejaVu Sans 12";
      gtk-theme = "adw-gtk3";
      icon-theme = "Qogir";
      monospace-font-name = "DejaVu Sans Mono 12";
      show-battery-percentage = true;
    };

    "org/gnome/desktop/notifications" = {
      application-children = ["firefox" "discord" "gnome-power-panel"];
    };
    "org/gnome/desktop/notifications/application/discord" = { application-id = "discord.desktop"; };
    "org/gnome/desktop/notifications/application/firefox" = { application-id = "firefox.desktop"; };
    "org/gnome/desktop/notifications/application/gnome-power-panel" = { application-id = "gnome-power-panel.desktop"; };
    "org/gnome/desktop/notifications/application/onlyoffice-desktopeditors" = { application-id = "onlyoffice-desktopeditors.desktop"; };
    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = { application-id = "org.gnome.Nautilus.desktop"; };
    "org/gnome/desktop/notifications/application/org-kde-kdenlive" = { application-id = "org.kde.kdenlive.desktop"; };
    "org/gnome/desktop/notifications/application/spotify" = { application-id = "spotify.desktop"; };
    "org/gnome/desktop/notifications/application/thunar" = { application-id = "thunar.desktop"; };

    "org/gnome/desktop/peripherals/mouse" = { accel-profile = "flat"; };
    "org/gnome/desktop/peripherals/touchpad" = { two-finger-scrolling-enabled = true; };
    "org/gnome/desktop/screensaver" = { lock-enabled = false; };

    "org/gnome/desktop/search-providers" = { sort-order = ["org.gnome.Settings.desktop" "org.gnome.Contacts.desktop" "org.gnome.Nautilus.desktop"]; };
    "org/gnome/desktop/session" = { idle-delay = 600; };

    "org/gnome/desktop/wm/keybindings" = {
      close = ["<Super>c"];
      maximize = [];
      move-to-workspace-1 = ["<Shift><Super>1"];
      move-to-workspace-2 = ["<Shift><Super>2"];
      move-to-workspace-3 = ["<Shift><Super>3"];
      move-to-workspace-4 = ["<Shift><Super>4"];
      panel-run-dialog = ["<Super>r"];
      switch-applications = ["<Alt>Tab"];
      switch-applications-backward = ["<Shift><Alt>Tab"];
      switch-input-source = [];
      switch-input-source-backward = [];
      switch-to-workspace-1 = ["<Super>1"];
      switch-to-workspace-2 = ["<Super>2"];
      switch-to-workspace-3 = ["<Super>3"];
      switch-to-workspace-4 = ["<Super>4"];
      toggle-fullscreen = ["<Super>f"];
      unmaximize = [];
    };

    "org/gnome/eog/view" = { background-color = "#1e1e2e"; };
    "org/gnome/evolution-data-server" = { migrated = true; };

    "org/gnome/file-roller/dialogs/extract" = {
      height = 800;
      recreate-folders = true;
      skip-newer = false;
      width = 1000;
    };
    "org/gnome/file-roller/file-selector" = {
      show-hidden = false;
      sidebar-size = 300;
      sort-method = "name";
      sort-type = "ascending";
      window-size = [ 812 504 ];
    };
    "org/gnome/file-roller/listing" = {
      list-mode = "as-folder";
      name-column-width = 234;
      show-path = false;
      sort-method = "name";
      sort-type = "ascending";
    };
    "org/gnome/file-roller/ui" = {
      sidebar-width = 200;
      window-height = 480;
      window-width = 600;
    };

    "org/gnome/gnome-system-monitor" = {
      cpu-stacked-area-chart = true;
      current-tab = "resources";
      maximized = false;
      show-dependencies = false;
      show-whose-processes = "user";
      window-height = 720;
      window-width = 800;
    };
    "org/gnome/gnome-system-monitor/proctree" = {
      col-26-visible = false;
      col-26-width = 0;
    };

    "org/gnome/mutter" = { edge-tiling = false; };
    "org/gnome/mutter/keybindings" = { toggle-tiled-left = []; toggle-tiled-right = []; };
    "org/gnome/mutter/wayland/keybindings" = { restore-shortcuts = []; };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      migrated-gtk-settings = true;
      search-filter-time-type = "last_modified";
    };
    "org/gnome/nautilus/window-state" = {
      initial-size = [890 550];
      initial-size-file-chooser = [890 550];
    };

    "org/gnome/portal/filechooser/code" = { last-folder-path = "/home/simonkdev/nixsys"; };
    "org/gnome/portal/filechooser/org.kde.kdenlive" = { last-folder-path = "/home/simonkdev/Videos/01_Projects/Sommerfest 2025 Afterwalk"; };
    "org/gnome/portal/filechooser/org.shotcut.Shotcut" = { last-folder-path = "/home/simonkdev/Videos/01_Projects/Sommerfest 2025 Afterwalk"; };

    "org/gnome/settings-daemon/plugins/color" = { night-light-schedule-automatic = false; };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/"
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"
      ];
      magnifier-zoom-in = ["<Super>plus"];
      magnifier-zoom-out = ["<Super>minus"];
      mic-mute = ["F4"];
      screensaver = ["<Super>y"];
      search = ["<Super>space"];
      volume-down = ["F2"];
      volume-mute = ["F1"];
      volume-up = ["F3"];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>q";
      command = "kitty";
      name = "kitty-launch";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-Keybindings/custom1" = {
      binding = "<Super>s";
      command = "discord";
      name = "discord-launch";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2" = {
      binding = "<Super>x";
      command = "firefox";
      name = "firefox-launch";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3" = {
      binding = "<Super>e";
      command = "thunar";
      name = "thunar-launch";
    };
    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4" = {
      binding = "<Super>a";
      command = "kitty -e bash -c \"sudo yazi\"";
      name = "yazi-launch";
    };

    "org/gnome/settings-daemon/plugins/power" = {
      idle-dim = false;
      power-button-action = "interactive";
      power-saver-profile-on-low-battery = false;
      sleep-inactive-ac-type = "nothing";
      sleep-inactive-battery-timeout = 1500;
    };

    "org/gnome/shell" = {
      app-picker-layout = [
        [ "Altus.desktop" ]
        [ "org.gnome.clocks.desktop" ]
        [ "org.gnome.Settings.desktop" ]
        [ "org.gnome.Snapshot.desktop" ]
        [ "Utilities" ]
        [ "System" ]
        [ "org.gnome.Console.desktop" ]
        [ "org.gnome.Decibels.desktop" ]
        [ "btop.desktop" ]
        [ "thunar-bulk-rename.desktop" ]
        [ "org.gnome.Calculator.desktop" ]
        [ "org.gnome.Extensions.desktop" ]
        [ "org.gnome.Nautilus.desktop" ]
        [ "gimp.desktop" ]
        [ "cups.desktop" ]
        [ "nixos-manual.desktop" ]
        [ "nnn.desktop" ]
        [ "processing.desktop" ]
        [ "protonvpn-app.desktop" ]
        [ "thunar-volman-settings.desktop" ]
        [ "org.gnome.TextEditor.desktop" ]
        [ "thunar-settings.desktop" ]
        [ "unison.desktop" ]
        [ "vlc.desktop" ]
        [ "xterm.desktop" ]
        [ "yazi.desktop" ]
      ];
      command-history              = [ "thunar" "vsc" ];
      disabled-extensions          = [ "dock-from-dash@fthx" ];
      enabled-extensions           = [
        "user-theme@gnome-shell-extensions.gcampax.github.com"
        "blur-my-shell@aunetx"
        "dash-to-dock@micxgx.gmail.com"
        "lockscreen-extension@pratap.fastmail.fm"
        "search-light@icedman.github.com"
        "tiling-assistant@leleat-on-github"
      ];
      favorite-apps                = [
        "firefox.desktop"
        "code.desktop"
        "kitty.desktop"
        "todoist.desktop"
        "thunar.desktop"
        "spotify.desktop"
        "LocalSend.desktop"
        "onlyoffice-desktopeditors.desktop"
        "obsidian.desktop"
        "discord.desktop"
        "org.kde.kdenlive.desktop"
      ];
      last-selected-power-profile  = "power-saver";
      welcome-dialog-last-shown-version = "48.1";
    };
    "org/gnome/shell/app-switcher" = { current-workspace-only = false; };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Stylix";
    };

    "org/gnome/shell/keybindings" = {
      show-screenshot-ui             = [ "<Super>p" ];
      switch-to-application-1        = [];
      switch-to-application-2        = [];
      switch-to-application-3        = [];
      switch-to-application-4        = [];
      toggle-application-view        = [];
      toggle-quick-settings          = [];
    };

    "org/gnome/shell/world-clocks" = { locations = []; };

    "org/gtk/gtk4/settings/color-chooser" = {
      custom-colors  = [ [0.0 0.0 0.0 0.0] [0.0 0.0 0.0 0.25] [1.0 1.0 1.0 0.0] ];
      selected-color = [ 0.0 0.0 0.0 0.0 ]; # Remove 'true'
    };

    "org/gtk/settings/color-chooser" = {
      selected-color = [ 0.38431372549 0.62745098039 0.91764705882 1.0 ];
    };

    "org/gtk/settings/file-chooser" = {
      date-format              = "regular";
      location-mode            = "path-bar";
      show-hidden              = false;
      show-size-column         = true;
      show-type-column         = true;
      sidebar-width            = 189;
      sort-column              = "name";
      sort-directories-first   = false;
      sort-order               = "ascending";
      type-format              = "category";
      window-position          = [35 32];
      window-size              = [1310 982];
    };
    };
  };
}
