{
  programs.nixvim.plugins = {
    blink-cmp = {
      enable = true;
      settings = {
        keymap.preset = "enter";
        sources = {
          default = [ "lsp" "path" "snippets" "buffer" "dadbod" ];
          providers.dadbod = {
            name = "Dadbod";
            module = "vim_dadbod_completion.blink";
          };
        };
        completion = {
          documentation.auto_show = true;
          ghost_text.enabled = true;
        };
      };
    };
    friendly-snippets.enable = true;
  };
}
