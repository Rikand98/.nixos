{ ... }:
{
  programs.dconf.enable = true;
  programs.fish.enable = true;
  programs.starship.enable = true;
  programs.niri.enable = true;
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };
  # nix-ld appends its own default library list; an empty list here is a no-op.
  programs.nix-ld.enable = true;
}
