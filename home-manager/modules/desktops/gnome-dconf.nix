# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{lib, ...}:
with lib.hm.gvariant; {
  dconf.settings = {
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

    "org/gnome/calculator" = {
      base = 10;
      button-mode = "basic";
      source-currency = "";
      source-units = "degree";
      target-currency = "";
      target-units = "radian";
      window-maximized = true;
      window-size = mkTuple [360 616];
    };

    "org/gnome/control-center" = {
      last-panel = "privacy";
      window-state = mkTuple [980 640 false];
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
      apps = ["nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.Logs.desktop" "org.gnome.SystemMonitor.desktop"];
      name = "X-GNOME-Shell-System.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = ["org.gnome.Connections.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.font-viewer.desktop" "org.gnome.Loupe.desktop" "org.gnome.seahorse.Application.desktop"];
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
      picture-uri = "file:///nix/store/2xdmgicyzf5cx94z43p7jzszzijfyh9x-wallpaper.png";
      picture-uri-dark = "file:///nix/store/2xdmgicyzf5cx94z43p7jzszzijfyh9x-wallpaper.png";
    };

    "org/gnome/desktop/break-reminders/eyesight" = {
      play-sound = true;
    };

    "org/gnome/desktop/break-reminders/movement" = {
      duration-seconds = mkUint32 300;
      interval-seconds = mkUint32 1800;
      play-sound = true;
    };

    "org/gnome/desktop/calendar" = {
      show-weekdate = true;
    };

    "org/gnome/desktop/input-sources" = {
      mru-sources = [];
      sources = [(mkTuple ["xkb" "de"])];
      xkb-options = [];
    };

    "org/gnome/desktop/interface" = {
      clock-show-seconds = true;
      enable-hot-corners = false;
      icon-theme = "Qogir";
      show-battery-percentage = true;
    };

    "org/gnome/desktop/notifications" = {
      application-children = ["firefox" "discord" "gnome-power-panel"];
    };

    "org/gnome/desktop/notifications/application/altus" = {
      application-id = "Altus.desktop";
    };

    "org/gnome/desktop/notifications/application/discord" = {
      application-id = "discord.desktop";
    };

    "org/gnome/desktop/notifications/application/firefox" = {
      application-id = "firefox.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/onlyoffice-desktopeditors" = {
      application-id = "onlyoffice-desktopeditors.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
      application-id = "org.gnome.Nautilus.desktop";
    };

    "org/gnome/desktop/notifications/application/org-kde-kdenlive" = {
      application-id = "org.kde.kdenlive.desktop";
    };

    "org/gnome/desktop/notifications/application/spotify" = {
      application-id = "spotify.desktop";
    };

    "org/gnome/desktop/notifications/application/thunar" = {
      application-id = "thunar.desktop";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/screensaver" = {
      lock-enabled = false;
    };

    "org/gnome/desktop/search-providers" = {
      sort-order = ["org.gnome.Settings.desktop" "org.gnome.Contacts.desktop" "org.gnome.Nautilus.desktop"];
    };

    "org/gnome/desktop/session" = {
      idle-delay = 600;
    };

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

    "org/gnome/eog/view" = {
      background-color = "#1e1e2e";
    };

    "org/gnome/evolution-data-server" = {
      migrated = true;
    };

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
      window-size = [812 504];
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

    "org/gnome/mutter" = {
      edge-tiling = false;
    };

    "org/gnome/mutter/keybindings" = {
      toggle-tiled-left = [];
      toggle-tiled-right = [];
    };

    "org/gnome/mutter/wayland/keybindings" = {
      restore-shortcuts = [];
    };

    "org/gnome/nautilus/preferences" = {
      default-folder-viewer = "list-view";
      migrated-gtk-settings = true;
      open-folder-on-dnd-hover = false;
      search-filter-time-type = "last_modified";
    };

    "org/gnome/nautilus/window-state" = {
      initial-size = [890 550];
      initial-size-file-chooser = mkTuple [890 550];
    };

    "org/gnome/portal/filechooser/code" = {
      last-folder-path = "/home/simonkdev/nixsys";
    };

    "org/gnome/portal/filechooser/obsidian" = {
      last-folder-path = "/home/simonkdev/Documents/07-Obsidian/Mercutio";
    };

    "org/gnome/portal/filechooser/org/kde/kdenlive" = {
      last-folder-path = "/home/simonkdev/Videos/01_Projects/Sommerfest 2025 Afterwalk";
    };

    "org/gnome/portal/filechooser/org/shotcut/Shotcut" = {
      last-folder-path = "/home/simonkdev/Videos/01_Projects/Sommerfest 2025 Afterwalk";
    };

    "org/gnome/settings-daemon/plugins/color" = {
      night-light-schedule-automatic = false;
    };

    "org/gnome/settings-daemon/plugins/media-keys" = {
      custom-keybindings = ["/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom1/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom2/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom3/" "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom4/"];
      magnifier-zoom-in = ["<Super>plus"];
      magnifier-zoom-out = ["<Super>minus"];
      mic-mute = ["F4"];
      screensaver = ["<Super>y"];
      search = ["<Super>space"];
      volume-down = ["F2"];
      volume-mute = ["F1"];
      volume-up = ["F3"];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-Keybindings/custom1" = {
      binding = "<Super>s";
      command = "discord";
      name = "discord-launch";
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "<Super>q";
      command = "kitty";
      name = "kitty-launch";
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
      command = "kitty -e bash -c \"yazi\"";
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
      app-picker-layout = [["Altus.desktop"] ["org.gnome.clocks.desktop"] ["org.gnome.Settings.desktop"] ["org.gnome.Snapshot.desktop"] ["Utilities"] ["System"] ["org.gnome.Console.desktop"] ["org.gnome.Decibels.desktop"] ["btop.desktop"] ["thunar-bulk-rename.desktop"] ["org.gnome.Calculator.desktop"] ["org.gnome.Extensions.desktop"] ["org.gnome.Nautilus.desktop"] ["gimp.desktop"] ["cups.desktop"] ["nixos-manual.desktop"] ["nnn.desktop"] ["processing.desktop"] ["protonvpn-app.desktop"] ["thunar-volman-settings.desktop"] ["org.gnome.TextEditor.desktop"] ["thunar-settings.desktop"] ["unison.desktop"] ["vlc.desktop"] ["xterm.desktop"] ["yazi.desktop"]];
      command-history = ["thunar" "vsc"];
      disabled-extensions = ["dock-from-dash@fthx" "advanced-weather@sanjai.com"];
      enabled-extensions = ["user-theme@gnome-shell-extensions.gcampax.github.com" "blur-my-shell@aunetx" "dash-to-dock@micxgx.gmail.com" "lockscreen-extension@pratap.fastmail.fm" "search-light@icedman.github.com" "tiling-assistant@leleat-on-github" "gtk4-ding@smedius.gitlab.com" "editdesktopfiles@dannflower" "add-to-desktop@tommimon.github.com" "azclock@azclock.gitlab.com"];
      favorite-apps = ["firefox.desktop" "code.desktop" "kitty.desktop" "todoist.desktop" "thunar.desktop" "spotify.desktop" "LocalSend.desktop" "onlyoffice-desktopeditors.desktop" "obsidian.desktop" "discord.desktop" "org.kde.kdenlive.desktop"];
      last-selected-power-profile = "power-saver";
      welcome-dialog-last-shown-version = "48.1";
    };

    "org/gnome/shell/app-switcher" = {
      current-workspace-only = false;
    };

    "org/gnome/shell/extensions/advanced-weather" = {
      fill-button-background = true;
      location-mode = "auto";
      panel-position = "left";
      show-location-label = false;
      use-12hour-format = true;
    };

    "org/gnome/shell/extensions/azclock" = {
      create-initial-widget = false;
      prefs-visible-page = "";
      update-notifier-project-version = 14;
    };

    "org/gnome/shell/extensions/azclock/widget-data/38824b70-97c3-42fb-8be5-2171cdd0d4dd" = {
      anchor-point = "Top_Right";
      background-color = "rgba(0, 0, 0, .6)";
      location = mkTuple [1920 48];
      name = "Weather Widget";
      show-background = false;
      show-border = false;
    };

    "org/gnome/shell/extensions/azclock/widget-data/38824b70-97c3-42fb-8be5-2171cdd0d4dd/element-data/d4d1e99f-fe00-4520-bcf2-1c6e1e63b434" = {
      current-weather-icon-type = "Full_Color";
      element-type = "Weather_Element";
      locations = [(mkVariant [(mkUint32 2) (mkVariant ["Munich" "EDMO" true [(mkTuple [0.8392124761828427 0.19693131144892936])] [(mkTuple [0.8403760348352696 0.20216729920491233])]])])];
      name = "Weather Forecast";
      polling-interval = 300;
      show-current-apparent-temp = true;
      show-daily-forecast = false;
      show-location = false;
      weather-actor-shadow = mkTuple [false "rgba(0, 0, 0, 0.4)" 0 2 0 4];
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      pipelines = "{'pipeline_default': {'name': <'Default'>, 'effects': <[<{'type': <'native_static_gaussian_blur'>, 'id': <'effect_000000000000'>, 'params': <{'radius': <30>, 'brightness': <0.73999999999999999>, 'unscaled_radius': <14>}>}>]>}, 'pipeline_default_rounded': {'name': <'Default rounded'>, 'effects': <[<{'type': <'native_static_gaussian_blur'>, 'id': <'effect_000000000001'>, 'params': <{'radius': <30>, 'brightness': <0.59999999999999998>}>}>, <{'type': <'corner'>, 'id': <'effect_000000000002'>, 'params': <{'radius': <24>}>}>]>}}";
      settings-version = 2;
    };

    "org/gnome/shell/extensions/blur-my-shell/appfolder" = {
      brightness = 0.6;
      sigma = 30;
    };

    "org/gnome/shell/extensions/blur-my-shell/coverflow-alt-tab" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
      blur = true;
      brightness = 0.6;
      pipeline = "pipeline_default_rounded";
      sigma = 30;
      static-blur = true;
      style-dash-to-dock = 0;
    };

    "org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/overview" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/panel" = {
      brightness = 0.6;
      pipeline = "pipeline_default";
      sigma = 30;
    };

    "org/gnome/shell/extensions/blur-my-shell/screenshot" = {
      pipeline = "pipeline_default";
    };

    "org/gnome/shell/extensions/blur-my-shell/window-list" = {
      brightness = 0.6;
      sigma = 30;
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      background-opacity = 0.8;
      dash-max-icon-size = 48;
      dock-position = "BOTTOM";
      height-fraction = 0.9;
      hot-keys = false;
      multi-monitor = true;
      preferred-monitor = -2;
      preferred-monitor-by-connector = "DP-1";
    };

    "org/gnome/shell/extensions/gtk4-ding" = {
      icon-size = "standard";
      show-home = false;
      show-trash = false;
      show-volumes = false;
    };

    "org/gnome/shell/extensions/openbar" = {
      bg-change = true;
      bguri = "file:///nix/store/2xdmgicyzf5cx94z43p7jzszzijfyh9x-wallpaper.png";
      count1 = 239916;
      count10 = 2441;
      count11 = 6;
      count12 = 2;
      count2 = 62422;
      count3 = 60145;
      count4 = 57918;
      count5 = 42260;
      count6 = 26322;
      count7 = 19440;
      count8 = 7061;
      count9 = 2669;
      dark-bguri = "file:///nix/store/2xdmgicyzf5cx94z43p7jzszzijfyh9x-wallpaper.png";
      dark-palette1 = ["9" "27" "32"];
      dark-palette10 = ["44" "68" "65"];
      dark-palette11 = ["20" "76" "164"];
      dark-palette12 = ["128" "164" "116"];
      dark-palette2 = ["62" "129" "194"];
      dark-palette3 = ["35" "67" "86"];
      dark-palette4 = ["101" "180" "241"];
      dark-palette5 = ["40" "82" "126"];
      dark-palette6 = ["79" "109" "132"];
      dark-palette7 = ["188" "191" "202"];
      dark-palette8 = ["95" "61" "58"];
      dark-palette9 = ["184" "71" "67"];
      default-font = "Sans 12";
      import-export = false;
      light-bguri = "file:///nix/store/2xdmgicyzf5cx94z43p7jzszzijfyh9x-wallpaper.png";
      light-palette1 = ["9" "27" "32"];
      light-palette10 = ["44" "68" "65"];
      light-palette11 = ["20" "76" "164"];
      light-palette12 = ["128" "164" "116"];
      light-palette2 = ["62" "129" "194"];
      light-palette3 = ["35" "67" "86"];
      light-palette4 = ["101" "180" "241"];
      light-palette5 = ["40" "82" "126"];
      light-palette6 = ["79" "109" "132"];
      light-palette7 = ["188" "191" "202"];
      light-palette8 = ["95" "61" "58"];
      light-palette9 = ["184" "71" "67"];
      monitor-height = 1080;
      monitor-width = 1920;
      palette1 = ["9" "27" "32"];
      palette10 = ["44" "68" "65"];
      palette11 = ["20" "76" "164"];
      palette12 = ["128" "164" "116"];
      palette2 = ["62" "129" "194"];
      palette3 = ["35" "67" "86"];
      palette4 = ["101" "180" "241"];
      palette5 = ["40" "82" "126"];
      palette6 = ["79" "109" "132"];
      palette7 = ["188" "191" "202"];
      palette8 = ["95" "61" "58"];
      palette9 = ["184" "71" "67"];
      pause-reload = false;
      reloadstyle = false;
    };

    "org/gnome/shell/extensions/search-light" = {
      animation-speed = 100.0;
      blur-brightness = 0.6;
      blur-sigma = 30.0;
      entry-font-size = 1;
      monitor-count = 1;
      preferred-monitor = 0;
      scale-height = 0.1;
      scale-width = 0.1;
      shortcut-search = ["<Super>space"];
    };

    "org/gnome/shell/extensions/tiling-assistant" = {
      focus-hint-color = "rgb(53,132,228)";
      last-version-installed = 52;
      overridden-settings = "{'org.gnome.mutter.edge-tiling': <false>}";
    };

    "org/gnome/shell/extensions/user-theme" = {
      name = "Stylix";
    };

    "org/gnome/shell/keybindings" = {
      show-screenshot-ui = ["<Super>p"];
      switch-to-application-1 = [];
      switch-to-application-2 = [];
      switch-to-application-3 = [];
      switch-to-application-4 = [];
      toggle-application-view = [];
      toggle-quick-settings = [];
    };

    "org/gnome/shell/world-clocks" = {
      locations = [];
    };
  };
}
