{ pkgs, ... }:
{
  home.packages = (with pkgs; [ fuzzel ]);

  xdg.configFile."fuzzel/fuzzel.ini".text = ''
    dpi-aware=no
    icon-theme=Gruvbox-Plus-Dark
    width=25
    font=JetBrainsMono NF 12
    line-height=30
    fields=name,generic,comment,categories,filename,keywords
    terminal=wezterm
    prompt="❯   "
    show-actions=yes
    exit-on-keyboard-focus-loss=no

    [colors]
    background=282828fa
    selection=3c3836fa
    border=98971afa

    [border]
    radius=20

    [dmenu]
    exit-immediately-if-empty=yes
  '';
}
