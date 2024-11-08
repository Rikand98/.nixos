{
  programs.nixvim.plugins.lsp.servers = {
    rust_analyzer = {
      enable = true;
      settings = {
      	cargo = { allFeatures = true; };
      };
      };
    };
}

