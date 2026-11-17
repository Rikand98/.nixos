{ lib, pkgs, ... }:
let
  linuxOnly = lib.optionals pkgs.stdenv.isLinux;
in
{
  imports = [
    ./dev.nix
    ./terminal.nix
    ./utilities.nix
  ]
  # Whole file is Linux desktop apps (pitivi, gimp, obs, mission-center, …)
  ++ linuxOnly [ ./gui.nix ];
}
