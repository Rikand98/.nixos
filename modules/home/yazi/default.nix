{ pkgs, ... }:
{
  programs.yazi = {
    enable = true;
    enableFishIntegration = true;
  };
  xdg.configFile."yazi/keymap.toml".source = ./keymap.toml;
  xdg.configFile."yazi/theme.toml".source = ./theme.toml;
  xdg.configFile."yazi/yazi.toml".source = ./yazi.toml;
}


