{ pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    steam
    proton
    lutris
  ];
}
