{ pkgs, ... }:
{
  home.packages = with pkgs; [
    teamspeak6-client
    webcord-vencord
    # discordo
  ];
  xdg.configFile."Vencord/themes/gruvbox.theme.css".source = ./gruvbox.css;
}
