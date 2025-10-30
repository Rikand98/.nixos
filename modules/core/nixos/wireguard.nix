{ config, pkgs, lib, ... }:

let
  secret = name:
    if config.sops.secrets ? ${name}
    then config.sops.secrets.${name}.path
    else "/etc/wireguard/${name}";
in
{
  boot.extraModulePackages = [ config.boot.kernelPackages.wireguard ];

  networking.wg-quick.interfaces.wg0 = {
    address     = [ "10.66.66.1/24" ];
    listenPort  = 51820;
    privateKeyFile = secret "wg_server_privatekey";

    dns = [ "1.1.1.1" ];

    peers = [
      {
        publicKey  = lib.fileContents (secret "wg_client1_publickey");
        # presharedKeyFile = secret "wg_client1_psk";   # optional
        allowedIPs = [ "10.66.66.2/32" ];
      }
    ];

    postUp = ''
      ${pkgs.iptables}/bin/iptables -A FORWARD -i wg0 -j ACCEPT
      ${pkgs.iptables}/bin/iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
    '';
    postDown = ''
      ${pkgs.iptables}/bin/iptables -D FORWARD -i wg0 -j ACCEPT
      ${pkgs.iptables}/bin/iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
    '';
  };

  networking.firewall.allowedUDPPorts = [ 51820 ];

  boot.kernel.sysctl."net.ipv4.ip_forward" = true;

  sops.secrets = lib.mkIf (config.sops ? secrets) {
    wg_server_privatekey = { };
    wg_client1_publickey = { };
    # wg_client1_psk = { };
  };
}
