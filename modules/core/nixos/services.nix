{ ... }:
{
  services = {
    tailscale.enable = true;
    gvfs.enable = true;
    logind.settings.Login = {
      HandlePowerKey = "ignore";
    };
  };
}
