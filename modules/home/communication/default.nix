{ pkgs, ... }:
{
  home.packages = with pkgs; [
    teamspeak6-client
    discordo
    webcord-vencord
  ];
  xdg.configFile."Vencord/themes/gruvbox.theme.css".source = ./gruvbox.css;
}
