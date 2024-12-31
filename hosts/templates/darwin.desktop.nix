{ pkgs, ... }:
{
  imports = [
    ./../../modules/core/darwin
  ];

  powerManagement.cpuFreqGovernor = "performance";
}
