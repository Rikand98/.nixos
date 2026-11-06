{ pkgs, username, ... }:
{
  nix = {
    settings.experimental-features = [
      "nix-command"
      "flakes"
    ];
    optimise.automatic = true;
    gc = {
      automatic = true;
      options = "--delete-older-than 14d";
    };
  };

  system.stateVersion = 6;
  system.primaryUser = "${username}";

  nixpkgs.config.allowUnfree = true; # Allow proprietary packages

  environment.systemPackages = with pkgs; [
    git # Essential for repo management
  ];

  time.timeZone = "Europe/Stockholm";
}
