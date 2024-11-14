{ lib, inputs, ... }:
{
  programs.starship = {
    enable = true;

    enableBashIntegration = true;
    enableFishIntegration = true;
    enableNushellIntegration = true;

    settings = {
      format = lib.concatStrings [
        "[](color_orange)"
        "$os"
        "[](bg:color_yellow fg:color_orange)"
        "$directory"
        "[](fg:color_yellow bg:color_aqua)"
        "$git_branch"
        "$git_status"
        "[](fg:color_aqua bg:color_blue)"
        "$nix_shell"
        "$python"
        "$dart"
        "$lua"
        "[](fg:color_blue bg:color_bg3)"
        "$docker_context"
        "[](fg:color_bg3 bg:color_bg1)"
        "$cmd_duration"
        "[](fg:color_bg1)"
        "$line_break$character"
      ];

      palette = "gruvbox_dark";
      palettes.gruvbox_dark = {
        color_fg0 = "#fbf1c7";
        color_bg1 = "#3c3836";
        color_bg3 = "#665c54";
        color_blue = "#458588";
        color_aqua = "#689d6a";
        color_green = "#98971a";
        color_orange = "#d65d0e";
        color_purple = "#b16286";
        color_red = "#cc241d";
        color_yellow = "#d79921";
      };

      os = {
        disabled = false;
        style = "bg:color_orange bold fg:color_fg0";
        symbols = {
          NixOS = " ";
        };
      };

      directory = {
        style = "bold fg:color_fg0 bg:color_yellow";
        format = "[ $path ]($style)";
        truncation_length = 3;
      };

      git_branch = {
        symbol = "";
        style = "bg:color_aqua";
        format = "[[ $symbol $branch ](bold fg:color_fg0 bg:color_aqua)]($style)";
      };

      git_status = {
        style = "bg:color_aqua bold fg:color_fg0";
        format = "[$all_status$ahead_behind]($style)";
      };

      nix_shell = {
        format = "[ via nix $name ]($style)";
        style = "bg:color_blue bold fg:color_fg0";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:color_bg1";
        format = "[[   $time ](fg:color_fg0 bg:color_bg1)]($style)";
      };

      cmd_duration = {
        format = "[ [󰔛 $duration](fg:color_fg0 bg:color_bg1)]($style)";
        disabled = false;
        style = "bg:color_bg1";
        show_notifications = false;
        min_time_to_notify = 60000;
      };

      line_break = {
        disabled = false;
      };

      character = {
        disabled = false;
        success_symbol = "[](bold fg:color_green)";
        error_symbol = "[](bold fg:color_red)";
        vimcmd_symbol = "[](bold fg:color_green)";
        vimcmd_replace_one_symbol = "[](bold fg:color_purple)";
        vimcmd_replace_symbol = "[](bold fg:color_purple)";
        vimcmd_visual_symbol = "[](bold fg:color_yellow)";
      };

      hostname = {
        ssh_symbol = " ";
      };

      docker_context = {
        symbol = " ";
        style = "bg:color_blue";
        format = "[[ $symbol](fg:#83a598 bg:color_bg3)]($style)";
      };

      python = {
        symbol = " ";
        style = "bg:color_blue";
        format = "[[ $symbol($virtualenv) ](fg:color_fg0 bg:color_blue)]($style)";
      };

      dart = {
        symbol = " ";
        style = "bg:color_blue";
        format = "[[ $symbol](fg:color_fg0 bg:color_blue)]($style)";
      };

      lua = {
        symbol = " ";
        style = "bg:color_blue";
        format = "[[ $symbol](fg:color_fg0 bg:color_blue)]($style)";
      };
    };
  };
}
