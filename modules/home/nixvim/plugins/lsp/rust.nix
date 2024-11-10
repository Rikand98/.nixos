{
  programs.nixvim.plugins.lsp.servers = {
    rust_analyzer = {
      enable = true;
      installCargo = true;
      installRustc = true;
      settings = {
      	cargo = { allFeatures = true; };
      };
      };
    };
}

