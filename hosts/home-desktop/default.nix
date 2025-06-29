{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core/nixos
    ./hardawre.nix
  ];

  powerManagement.cpuFreqGovernor = "performance";
}
