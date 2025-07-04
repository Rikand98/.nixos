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
      allowedTCPPorts = [
        22
        80
        443
        59010
        59011
        8000
        8001
        8002
        24800
      ];
      allowedUDPPorts = [
        59010
        59011
      ];
    };
  };

  environment.systemPackages = with pkgs; [
    networkmanagerapplet
  ];
}
