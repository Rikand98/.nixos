{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # teamspeak6-client
    # webcord
    discord
    # discordo
  ];
  # xdg.configFile."Vencord/themes/gruvbox.theme.css".source = ./gruvbox.css;
}
