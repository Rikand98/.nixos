{
  pkgs,
  ...
}:
{
  environment.systemPackages = with pkgs; [
    stasis.packages.${config.nixpkgs.system}.stasis
  ];
}
