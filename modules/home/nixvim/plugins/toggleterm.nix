{
  programs.nixvim = {
    plugins.toggleterm = {
      enable = true;
      opts = { open_mapping = [[<c-t>]], auto_scroll = false },
    };
  };
}

