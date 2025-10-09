{ pkgs, hostname, ... }:
{
  networking = {
    hostName = "${hostname}"; # Sets ComputerName, HostName, and LocalHostName on macOS
  };

  environment.systemPackages = with pkgs; [
    mtr                  # Network diagnostic tool
    wget                 # Command-line downloader
    curl                 # Command-line HTTP client
    openssh              # SSH client (consistent Nix-managed version)
    nmap                 # Network scanner
  ];

}
