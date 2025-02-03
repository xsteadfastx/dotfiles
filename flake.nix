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

    # needed because of https://github.com/ghostty-org/ghostty/issues/5494
    workingGhostty.url =
      "github:nixos/nixpkgs/f7b11968ea1d19496487f6afaac99c130a87c1ff";
  };

  outputs = inputs: {
    nixosConfigurations = {
      troy = inputs.nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        modules = [
          {
            xsfx.neovim = true;
            xsfx.x11 = true;

            home-manager.users.marv =
              import ./.nix-configurations/home/marv.nix;
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
