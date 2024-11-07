{ pkgs, ... }:
let
	gruvbox = import ./flavor.toml;
in
{
  programs.yazi = {
    enable = true; 
    settings = {
       # flavor = "Gruvbox-Orange-Dark";
	flavor = gruvbox;
    };
  };
 }
