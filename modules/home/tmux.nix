{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    prefix = "C-Space";
    shell = "${pkgs.fish}/bin/fish";
    terminal = "tmux-256color";
    historyLimit = 100000;
    plugins = with pkgs.tmuxPlugins; [
      tmux-fzf
      gruvbox
    ];
    extraConfig = ''
      set -g mouse on
      unbind C-b
      set -g prefix C-Space
      bind-key C-Space send-prefix
      set -g focus-events on
    '';
  };
}
