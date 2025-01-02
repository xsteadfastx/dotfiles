pkgs: system: inputs:
import pkgs {
  inherit system;
  config = { allowUnfree = true; };
  overlays = [ (import ../overlays { inherit system inputs; }) ];
}

