 { config, lib, pkgs, ...}:

 {
    environment.sessionVariables = {
       STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/simonkdev/.steam/root/compatibilitytools.d";
       __GLX_VENDOR_LIBRARY_NAME = "nvidia";
       WLR_NO_HARDWARE_CURSORS = "1";
       WLR_RENDERER_ALLOW_SOFTWARE = "1";
       LIBVA_DRIVER_NAME = "nvidia";
       GBM_BACKEND = "nvidia-drm";
       __GL_GSYNC_ALLOWED = "1";
       __GL_VRR_ALLOWED = "1";
       WLR_DRM_NO_ATOMIC = "1"; # sometimes helps on NVIDIA 
    };

    services.libinput = {
     enable = true;
     mouse = {
       accelProfile = "flat";
     };
     touchpad = {
       accelProfile = "flat";
     };
    }; 

    system.stateVersion = "25.05"; # Just dont change it.

    nix.settings = {
      experimental-features = [ "nix-command" "flakes"];
      trusted-users = [ "root" "simonkdev" ];
    };

    nixpkgs.config = {
       allowUnfree = true;
       allowUnsupportedSystem = true;
    };

    security.polkit.enable = true;

    time.timeZone = "Europe/Berlin";

    i18n = { 
      defaultLocale = "en_US.UTF-8";
      extraLocales = [ "en_US.UTF-8/UTF-8" ];
    };
}