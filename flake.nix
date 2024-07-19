{
  description = "xsfx config";

  inputs = {
    # Stable
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";

    # Unstable
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # home manager
    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    airmtp.url = "github:xsteadfastx/airmtp";
  };

  outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs { inherit system; };
    in
    {
      homeConfigurations = {
        xsfx = inputs.home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home.nix ];
          extraSpecialArgs = { inherit system inputs; };
        };
      };
    };
}
