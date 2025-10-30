{ inputs, pkgs, ... }:
{
  home.packages = with pkgs; [
    swww
    grim
    slurp
    wl-clip-persist
    cliphist
    wf-recorder
    glib
    wayland
    direnv
    wineWowPackages.wayland # Wine for Wayland
  ];
  programs.niri = {
    enable = true;
  };
}
