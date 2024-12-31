{ self, pkgs, lib, inputs, ...}:
{
  nix = {
    settings = {
      auto-optimise-store = true; # Optimize the Nix store for performance
      experimental-features = [ "nix-command" "flakes" ];
    };
  };
  nixpkgs = {
    overlays = [
      inputs.nur.overlays.default
    ];
  };

  environment.systemPackages = with pkgs; [
    wget
    git
  ];

  time.timeZone = "Europe/Stockholm";
  i18n.defaultLocale = "en_US.UTF-8";
  nixpkgs.config.allowUnfree = true;
}
