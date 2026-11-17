{ pkgs, ... }:
{
  home.packages = (with pkgs; [
    file-roller # archive manager — xdg archive default
    gnome-text-editor # GUI text editor — xdg text default (nvim has no .desktop)
  ]);

  dconf.settings = {
    "org/gnome/TextEditor" = {
      custom-font = "JetBrainsMono Nerd Font 12";
      highlight-current-line = true;
      indent-style = "space";
      restore-session = false;
      show-grid = false;
      show-line-numbers = true;
      show-right-margin = false;
      style-scheme = "builder-dark";
      style-variant = "dark";
      tab-width = "uint32 4";
      use-system-font = false;
      wrap-text = false;
    };
  };
}
