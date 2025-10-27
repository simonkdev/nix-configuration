{
  description = "My System Configuration in NixOS";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    stylix = {
      url = "github:nix-community/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    plasma-manager = {
      url = "github:nix-community/plasma-manager/archive/trunk";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    stylix,
    home-manager,
    unstable,
    ...
  } @ inputs: let
    # Variables for the outputs
    system = "x86_64-linux";

    unpkgs = import unstable {inherit system;};

    pkgs = import nixpkgs {
      inherit system;
      config = {allowUnfree = true;};
    };

    extraSpecialArgs = {inherit inputs system pkgs unpkgs;};
  in {
    nixosConfigurations = {
      main = nixpkgs.lib.nixosSystem {
        # configuration "main" starts here letsgooo
        specialArgs = {inherit system;};

        modules = [
          stylix.nixosModules.stylix
          ./nixos/configs/main-config.nix # Config for configuration "main" -> you can do multiple
        ];
      };
      thinkpad = nixpkgs.lib.nixosSystem {
        specialArgs = {inherit system;};

        modules = [
          stylix.nixosModules.stylix
          ./nixos/configs/tp-config.nix
        ];
      };
    };

    homeConfigurations = {
      main = home-manager.lib.homeManagerConfiguration {
        inherit extraSpecialArgs pkgs;
        modules = [
          stylix.homeModules.stylix
          ./home-manager/home.nix
        ];
      };

      thinkpad = home-manager.lib.homeManagerConfiguration {
        inherit extraSpecialArgs pkgs;
        modules = [
          stylix.homeModules.stylix
          ./home-manager/tp-home.nix
        ];
      };
    };
  };
}
