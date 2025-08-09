 { config, lib, pkgs, ...}:

 {
    services.libinput = {
     enable = true;
     mouse = {
       accelProfile = "flat";
     };
     touchpad = {
       accelProfile = "flat";
     };
    }; 

    services.touchegg = {
      enable = true;
      enablePalmDetection = true;
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

    time.timeZone = "Europe/Berlin";

    i18n = { 
      defaultLocale = "en_US.UTF-8";
      extraLocales = [ "en_US.UTF-8/UTF-8" ];
    };
}
