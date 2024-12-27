{
  description = "xsfx config";

  inputs = {
    # Stable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    # Unstable
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # hardware tweaks
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    # home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    airmtp.url = "github:xsteadfastx/airmtp";

    compose2nix = {
      url = "github:aksiksi/compose2nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    let
      system = "x86_64-linux";

      pkgs = import inputs.nixpkgs { inherit system; };

      lib = inputs.nixpkgs.lib;

      pkgsUnstable = import inputs.nixpkgs-unstable {
        inherit system;
        config = { allowUnfree = true; };
        overlays = [
          (import .nix-configurations/overlays { inherit pkgs system inputs; })
        ];
      };
    in {
      homeConfigurations = {
        xsfx = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ .nix-configurations/home.nix ];
          extraSpecialArgs = { inherit system pkgsUnstable; };
        };
      };

      nixosConfigurations = {
        troy = lib.nixosSystem {
          inherit system;
          modules = [
            ./.nix-configurations/hosts/troy/configuration.nix
            ./.nix-configurations/hosts/troy/hardware-configuration.nix
            inputs.nixos-hardware.nixosModules.dell-xps-13-7390
            inputs.home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;

              # put the stuff to .nix-profile
              home-manager.useUserPackages = false;

              home-manager.extraSpecialArgs = { inherit system pkgsUnstable; };
              home-manager.users.marv =
                import .nix-configurations/home/marv.nix;
            }
          ];
        };
      };
    };
}
