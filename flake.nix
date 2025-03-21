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

    quickemu = {
      url = "github:quickemu-project/quickemu";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs: {
    nixosConfigurations = {
      troy = inputs.nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        modules = [
          {
            xsfx.neovim = true;
            xsfx.x11 = true;
            xsfx.work = true;

            home-manager.users.marv = import ./.nix-configurations/home/marv.nix;
          }
          ./.nix-configurations/home
          ./.nix-configurations/hosts/troy/configuration.nix
          ./.nix-configurations/hosts/troy/hardware-configuration.nix
          ./.nix-configurations/hosts/troy/syncthing.nix
          inputs.home-manager.nixosModules.home-manager
          inputs.nixos-hardware.nixosModules.dell-xps-13-7390
          { _module.args = { inherit inputs system; }; }
        ];
      };
    };
  };
}
