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
     # Remove C-b because that just sucks
      unbind C-b
      set -g prefix C-Space
      bind-key C-Space send-prefix
    '';
  };
}
