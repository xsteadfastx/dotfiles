{ ... }:
{
  imports = [
    ../../dev/chirpstack.nix
    ./configuration.nix
    ./hardware-configuration.nix
    ./syncthing.nix
  ];
}
