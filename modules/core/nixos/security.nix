{ ... }:
{
  security.rtkit.enable = true;
  # You run LightDM (auto-enabled by services.xserver), not GDM — keyring
  # unlock must hook the service that actually authenticates the login.
  security.pam.services.lightdm.enableGnomeKeyring = true;
  security.pam.services.lightdm-autologin.enableGnomeKeyring = true;
  security.pam.services.swaylock = { };
}
