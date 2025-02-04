{ lib, inputs, system, ... }:
let
  pkgsUnstable = (import ../pkgs/get.nix) inputs.nixpkgs-unstable system inputs;
in {
  options.xsfx.neovim = lib.mkEnableOption "enable neovim";
  options.xsfx.x11 = lib.mkEnableOption "enable x11";

  config = {
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = false; # Put the stuff to .nix-profile
    home-manager.extraSpecialArgs = { inherit pkgsUnstable; };
  };
}
