{ pkgs, ... }:
{
   programs.tmux = {
    enable = true;
    prefix = "C- ";
    shell = "${pkgs.fish}/bin/fish";
    terminal = "tmux-256color";
    historyLimit = 100000;
    extraConfig = '';
  };
}
