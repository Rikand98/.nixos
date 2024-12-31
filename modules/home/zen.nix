{ inputs, pkgs, ... }:
{
  home.packages = (with pkgs; [
      inputs.zen-browser.packages."${system}".zen
  ]);
}
