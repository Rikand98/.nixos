{ pkgs, config, ... }:
{
  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    (nerdfonts.override { fonts = [
      "JetBrainsMono"
      "FiraCode"
      "CascadiaCode"
      "NerdFontsSymbolsOnly"
    ]; })
    twemoji-color-font
    noto-fonts-emoji
    fantasque-sans-mono
    maple-mono
  ];

  gtk = {
    enable = true;
    font = {
      name = "JetBrainsMono Nerd Font";
      size = 12;
    };
    theme = {
      name = "Gruvbox-Orange-Dark";
      package = pkgs.gruvbox-gtk-theme.override {
        colorVariants = [ "dark" ];
        themeVariants = [ "orange" ];
      };
    };
    iconTheme = {
      name = "Gruvbox-Plus-Dark";
      package = pkgs.gruvbox-plus-icons;
    };
    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 24;
    };
  };

  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
  };
}
