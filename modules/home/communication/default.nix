{ pkgs, ... }:
{
  home.packages = with pkgs; [
    teamspeak6-client
    discord
    (discord.override {
     withVencord = true;
    })
  ];
  xdg.configFile."Vencord/themes/gruvbox.theme.css".source = ./gruvbox.css;
}
