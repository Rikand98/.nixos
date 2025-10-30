{ self, pkgs, lib, inputs,username, ... }:
{
  nix = {
    settings = {
      nix.optimise.automatic = true;
      experimental-features = [ "nix-command" "flakes" ];
    };
  };

  system.stateVersion = 6;
  system.primaryUser = "${username}";

  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default # Ensure `nur` is defined in flake.nix inputs
    ];
    config.allowUnfree = true; # Allow proprietary packages
    config.allowUnsupportedSystem = true;
  };

  environment.systemPackages = with pkgs; [
    git # Essential for repo management
    # wget moved to network.nix to avoid redundancy
  ];

  time.timeZone = "Europe/Stockholm";
}
