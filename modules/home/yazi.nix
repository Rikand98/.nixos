{ pkgs, ... }:
{
  programs.yazi = {
    enable = true; 
    settings = {
        flavor = "gruvbox-gtk-theme"
    };
  };
 }
