{ pkgs, hostname, ... }:
{
  networking = {
    hostName = "${hostname}"; # Sets the hostname for the macOS system
  };

  environment.systemPackages = with pkgs; [
    mtr                  # Network diagnostic tool
    wget                 # Command-line downloader
    curl                 # Command-line HTTP client
    openssh              # SSH client
    nmap                 # Network scanner
  ];

  # Enable macOS-native firewall settings (if desired, requires manual setup via `nix-darwin` or system preferences)
  services.firewall = {
    enable = true;  # If you are using a firewall utility like `Little Snitch`, this can be set manually.
  };

  # DNS settings (optional; macOS has its own resolvers)
  # Manual DNS configuration is generally done via System Preferences or `scutil` commands.
  # You can skip this unless explicitly needed.
}
