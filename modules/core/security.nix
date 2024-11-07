{ ... }: 
{
  security.rtkit.enable = true;
  security.sudo.enable = true;
  security.pam.services.gdm-password.enableGnomeKeyring = true;
  # security.pam.services.swaylock = { };
  security.pam.services.hyprlock = {};
}
