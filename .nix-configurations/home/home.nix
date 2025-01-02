{ inputs, system, ... }:
let pkgsUnstable = import ../pkgs/unstable.nix { inherit inputs system; };
in {
  home-manager.useGlobalPkgs = true;

  # Put the stuff to .nix-profile
  home-manager.useUserPackages = false;

  home-manager.extraSpecialArgs = {
    pkgsUnstable = pkgsUnstable.pkgs;
    inherit system;
  };

  home-manager.users.marv = import ./marv.nix;
}
