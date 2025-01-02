{ inputs, system }: rec {
  pkgs = import inputs.nixpkgs-unstable {
    inherit system;
    config = { allowUnfree = true; };
    overlays = [ (import ../overlays { inherit pkgs system inputs; }) ];
  };
}
