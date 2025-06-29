{inputs, pkgs, ... }:
{
  home.packages = (with pkgs; [
    proton
  ]);
}
