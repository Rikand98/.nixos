{ pkgs, ... }:
{
  xdg.portal = {
    enable = true;
    xdgOpenUsePortal = true;
    # niri writes niri-portals.conf, which wins over `config.common` here.
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };
}
