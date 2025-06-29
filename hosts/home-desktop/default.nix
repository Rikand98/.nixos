{ pkgs, ... }:
{
  imports = [
    ./hardware-configuration.nix
    ./../../modules/core/nixos
    ./hardware.nix
  ];

  powerManagement.cpuFreqGovernor = "performance";
}
