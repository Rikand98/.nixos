{ pkgs, ... }:
{
  home.packages = (with pkgs; [ stasis ]);
}
