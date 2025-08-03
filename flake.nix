{
  description = "My System Configuration in NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };      
    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs, stylix, home-manager, unstable }:
  let                                     # Variables for the outputs
    system = "x86_64-linux";
    
    unpkgs = import unstable { inherit system; };

    rapidrawOverlay = final: prev: {
      rapidraw = unpkgs.rapidraw;
    };

    pkgs = import nixpkgs {
       inherit system;                    # Build for x86_64-linux  
       config = {
        allowUnfree = true;
       };
       overlays = [ rapidrawOverlay ];

    };
  in
  {

   nixosConfigurations = {
    main = nixpkgs.lib.nixosSystem {      # configuration "main" starts here letsgooo
     specialArgs = {inherit system; };
     
     modules = [
     stylix.nixosModules.stylix
     ./nixos/configuration.nix            # Config for configuration "main" -> you can do multiple
     ];

    };
    thinkpad = nixpkgs.lib.nixosSystem {
    specialArgs = {inherit system; };

     modules = [
     stylix.nixosModules.stylix
     /home/simonkdev/nixsys/nixos/tp-config.nix
    ];

    };

   };

  homeConfigurations = {

    main = home-manager.lib.homeManagerConfiguration {
     inherit pkgs;
     modules = [
      stylix.homeModules.stylix
      ./home-manager/home.nix
     ];
    };

    thinkpad = home-manager.lib.homeManagerConfiguration {
     inherit pkgs;
     modules = [
      stylix.homeModules.stylix
      /home/simonkdev/nixsys/home-manager/tp-home.nix
     ];
    };
  };
 };
}
