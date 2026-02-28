{ pkgs, ... }:
{
  home.packages = (with pkgs; [ mako ]);
  services.mako = {
    enable = true;
    defaultTimeout = 10000;

  };

}
