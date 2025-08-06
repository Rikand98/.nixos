{ pkgs, ... }:
{
  programs = {
    fish = {
      enable = true;
      loginShellInit = ''
        export EDITOR=nvim \n
        starship init fish | source
      '';

      interactiveShellInit = ''
        ${pkgs.pfetch}/bin/pfetch

               function fish_greeting; end

               # Map '-' to cd back to previous directory
               abbr -a -- - prevd

               # use vi bindings
               set -g fish_key_bindings fish_vi_key_bindings

               # Emulates vim's cursor shape behavior
               set -g fish_vi_force_cursor 1
               # Set the normal and visual mode cursors to a block
               set fish_cursor_default block
               # Set the insert mode cursor to a line
               set fish_cursor_insert line
               # Set the replace mode cursors to an underscore
               set fish_cursor_replace_one underscore set fish_cursor_replace underscore

               abbr --add dotdot --regex '^\.\.+$' --function multicd
      '';

      plugins = [
        {
          name = "plugin-git";
          src = pkgs.fishPlugins.plugin-git.src;
        }
        {
          name = "bass";
          src = pkgs.fishPlugins.bass.src;
        }
        {
          name = "fzf.fish";
          src = pkgs.fishPlugins.fzf-fish.src;
        }
      ];

      shellAliases = {
        # Utils
        c = "clear";
        cd = "z";
        tt = "gtrash put";
        cat = "bat";
        nano = "micro";
        diff = "delta --diff-so-fancy --side-by-side";
        less = "bat";
        y = "yazi";
        py = "python";
        dsize = "du -hs";
        pdf = "tdf";
        open = "xdg-open";
        space = "ncdu";
        man = "BAT_THEME='default' batman";

        l = "eza --icons  -a --group-directories-first -1"; # EZA_ICON_SPACING=2
        ll = "eza --icons  -a --group-directories-first -1 --no-user --long";
        tree = "eza --icons --tree --group-directories-first";

        # Nixos
        cdnix = "cd ~/.nixos && nvim ~/.nixos";
        nixop = "nix store optimise";
        nixgc = "nix store gc";
        nixup = "nix flake update";
        nixosbuild = "sudo nixos-rebuild switch --flake .#nixos";
        darwinbuild = "sudo nixos-rebuild switch --flake .#darwin";
        ns = "nix-search-tv print | fzf --preview 'nix-search-tv preview {}' --scheme history";
      };
    };
  };
}
