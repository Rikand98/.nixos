{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    heroic
    steam
    protonplus
    rivalcfg
    lutris
    umu-launcher
    minion
    satisfactorymodmanager
  ];
  # rivalcfg ships its own udev rules; the hand-pasted copy was world-writable.
  services.udev.packages = [ pkgs.rivalcfg ];
}
