{ pkgs, ... }:
{
  services = {
    tailscale.enable = true;
    gvfs.enable = true;
    udev.packages = [
      (pkgs.writeTextFile {
        name = "50-zmk.rules";
        destination = "/etc/udev/rules.d/50-zmk.rules";
        text = ''
          SUBSYSTEM=="tty", SUBSYSTEMS=="usb", ATTRS{idVendor}=="1d50", ATTRS{idProduct}=="615e", MODE="0660", GROUP="dialout", TAG+="uaccess"
        '';
      })
    ];
    logind.settings.Login = {
      HandlePowerKey = "ignore";
    };
  };
}
