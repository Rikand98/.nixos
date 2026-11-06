{ username, ... }:
{
  services = {
    xserver = {
      enable = true;
      xkb.layout = "se";
    };

    displayManager.autoLogin = {
      enable = true;
      user = "${username}";
    };
  };
  # To prevent getting stuck at shutdown
  systemd.settings.Manager.DefaultTimeoutStopSec = "10s";
}
