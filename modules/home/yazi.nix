{ pkgs, ... }:
{
  programs.yazi = {
    enable = true; 
    settings = {
        flavor = "Gruvbox-Orange-Dark";
	iconTheme= "Gruvbox-Plus-Dark";
    };
  };
 }
