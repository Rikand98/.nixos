{ pkgs, config, ... }:
{
  imports = [
    ./../../modules/core/darwin
  ];

  # Packages relevant for macOS
  environment.systemPackages = with pkgs; [
    htop
    neofetch
  ];


  nixpkgs.hostPlatform = "aarch64-darwin";  # Ensure native ARM builds
}
