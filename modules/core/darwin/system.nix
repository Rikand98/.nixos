{ self, pkgs, lib, inputs, ... }:
{
  nix = {
    settings = {
      auto-optimise-store = true; # Optimize the Nix store for performance
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default # Ensure `nur` is defined in flake.nix inputs
    ];
    config.allowUnfree = true; # Allow proprietary packages
  };

  environment.systemPackages = with pkgs; [
    git # Essential for repo management
    # wget moved to network.nix to avoid redundancy
  ];

  time.timeZone = "Europe/Stockholm";
  i18n.defaultLocale = "en_US.UTF-8";
}
