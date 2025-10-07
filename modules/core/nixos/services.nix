{ ... }:
{
  services = {
    gvfs.enable = true;
    gnome.gnome-keyring.enable = true;
    dbus.enable = true;
    fstrim.enable = true;
    logind.settings.Login = {
      HandlePowerKey = "ignore";
    };
  };
}
