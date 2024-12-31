{ pkgs, ... }:
{
  services = {
    ssh.enable = true; # Enable SSH service if needed for remote login (macOS-native)
  };
}
