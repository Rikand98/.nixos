{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    steam
    protonplus
    lutris
  ];
}
