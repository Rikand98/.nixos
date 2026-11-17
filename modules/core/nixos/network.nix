{ pkgs, hostname, ... }:
{
  networking = {
    hostName = "${hostname}";
    networkmanager.enable = true;
    nameservers = [
      "8.8.8.8"
      "8.8.4.4"
      "1.1.1.1"
    ];
    firewall = {
      enable = true;
      # Dev ports live on the Tailscale interface only, not the LAN.
      trustedInterfaces = [ "tailscale0" ];
      allowedTCPPorts = [
        80
        443
      ];
      allowedUDPPorts = [ ];
    };
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
    proton-vpn
  ];
}
