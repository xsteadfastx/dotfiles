{ inputs, system, ... }:
let
  pkgsUnstable = (import ../pkgs/get.nix) inputs.nixpkgs-unstable system inputs;
in {
  home-manager.useGlobalPkgs = true;

  # Put the stuff to .nix-profile
  home-manager.useUserPackages = false;

  home-manager.extraSpecialArgs = { inherit pkgsUnstable; };

  home-manager.users.marv = import ./marv.nix;
}
