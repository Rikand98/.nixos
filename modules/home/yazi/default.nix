{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableFishintergration = true;
  };
  xdg.configFile."yazi/yazi.toml".soruce = ./yazi.toml;
}

