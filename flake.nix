{
  description = "My System Configuration in NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
      winapps = {
        url = "github:winapps-org/winapps";
        inputs.nixpkgs.follows = "nixpkgs";
      };
    };
    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, stylix, home-manager, winapps }:
  let                                     # Variables for the outputs
    system = "x86_64-linux";
    
    pkgs = import nixpkgs {
       inherit system;                    # Build for x86_64-linux

       config = {
        allowUnfree = true;
       };

    };
  in
  {

   nixosConfigurations = {
    main = nixpkgs.lib.nixosSystem {      # configuration "main" starts here letsgooo
     specialArgs = {inherit system; };
     
     modules = [
     stylix.nixosModules.stylix
     ./nixos/configuration.nix            # Config for configuration "main" -> you can do multiple
     (
      {
        environment.systemPackages = [
           winapps.packages."${system}".winapps
           winapps.packages."${system}".winapps-launcher
        ];
      }
     )
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
  };
 };
}
