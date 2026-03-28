{ pkgs, ... }:
{
  home.packages = (
    with pkgs;
    [
      qobuz-player
      streamrip
    ]
  );
}
