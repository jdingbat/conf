{
  description = "jdingbat nix conf";

  inputs = {

    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin_home_manager = {
      url = "github:nix-community/home-manager/release-22.05";
      inputs.nixpkgs.follows = "darwin_nixpkgs";
    };

    darwin_nixpkgs = {
      url = "github:nixos/nixpkgs/nixpkgs-22.05-darwin";
    };

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "darwin_nixpkgs";
    };

    nixpkgs.url = "nixpkgs/nixos-unstable";
  };

  outputs = inputs: with inputs; {

    # Used with `nixos-rebuild --flake .#<hostname>`
    # nixosConfigurations."<hostname>".config.system.build.toplevel must be a derivation
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./configuration.nix
          ./system/linux.nix
          home-manager.nixosModules.home-manager {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
          }
        ];
      };
    };

    darwinConfigurations = {
      mac = darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = {
          inherit inputs;
        };
        modules = [
          ./darwin_configuration.nix
          ./system/darwin.nix
          darwin_home_manager.darwinModules.home-manager {
             home-manager.useGlobalPkgs = true;
             home-manager.useUserPackages = true;
           }
        ];
      };
    };

  };
}
