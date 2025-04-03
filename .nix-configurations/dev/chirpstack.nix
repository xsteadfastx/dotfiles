{ ... }:
{
  networking.hosts = {
    "127.0.0.1" = [
      "chirpstack.localhost"
      "mqtt.localhost"
    ];
  };

  networking.firewall.allowedTCPPorts = [ 8080 ];
}
