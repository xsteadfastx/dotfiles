{
  description = "xsfx config";

  inputs = {
    agenix.inputs.home-manager.follows = "home-manager";
    agenix.inputs.nixpkgs.follows = "nixpkgs";
    agenix.url = "github:ryantm/agenix";
    airmtp.url = "github:xsteadfastx/airmtp";
    compose2nix.inputs.nixpkgs.follows = "nixpkgs";
    compose2nix.url = "github:aksiksi/compose2nix";
    firefox-addons.url = "gitlab:rycee/nur-expressions?dir=pkgs/firefox-addons";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    quickemu.inputs.nixpkgs.follows = "nixpkgs";
    quickemu.url = "github:quickemu-project/quickemu";
    kerouac.url = "git+ssh://git@git.wobcom.de/smartmetering/kerouac.git?ref=refs/tags/v0.12.8";
  };

  outputs = inputs: {
    nixosConfigurations = {
      troy = inputs.nixpkgs.lib.nixosSystem rec {
        system = "x86_64-linux";
        modules =
          let
            pkgsUnstable = (import ./.nix-configurations/pkgs/get.nix) inputs.nixpkgs-unstable system inputs;
          in
          [
            {
              xsfx.kodi = true;
              xsfx.neovim = true;
              xsfx.work = true;
              xsfx.x11 = true;
              home-manager.users.marv = import ./.nix-configurations/home/marv.nix;
            }
            ./.nix-configurations/home
            ./.nix-configurations/hosts/troy
            inputs.home-manager.nixosModules.home-manager
            inputs.nixos-hardware.nixosModules.dell-xps-13-7390
            { _module.args = { inherit inputs system pkgsUnstable; }; }
          ];
      };
    };
  };
}
