{ pkgs, lib, ... }:
{
  # Enable Fish shell
  programs.fish.enable = true;

  # Enable Starship prompt (integrates with Fish)
  # programs.starship.enable = true;

  # Enable GnuPG agent with SSH support
  programs.gnupg.agent = {
    enable = true;
    enableSSHSupport = true;
  };

  # Optional: Configure GPG agent for macOS keychain integration
  environment.etc."gnupg/gpg-agent.conf".text = ''
    pinentry-program ${pkgs.pinentry_mac}/bin/pinentry-mac
  '';

  # Remove nix-ld (Linux-only, not supported on macOS)
  # programs.nix-ld.enable = false; # Omitted entirely as it’s irrelevant
}
