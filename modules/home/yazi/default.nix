{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };
  xdg.configFile."yazi/yazi.toml".source = ./yazi.toml;
  xdg.configFile."yazi/theme.toml".source = ./theme.toml;
}

