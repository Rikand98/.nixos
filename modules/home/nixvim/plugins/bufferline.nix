{
  programs.nixvim.plugins.bufferline = {
    enable = true;
    settings.options = {
      mode = "buffers";
      diagnostics = "nvim_lsp";
      always_show_bufferline = false;
    };
  };
}
