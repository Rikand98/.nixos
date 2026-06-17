{ pkgs, ... }:
{
  home.packages = (with pkgs; [ mako ]);
  services.mako = {
    enable = true;
    settings.default-timeout = 10000;

  };

}
