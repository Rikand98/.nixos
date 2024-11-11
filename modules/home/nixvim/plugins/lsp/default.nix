{
  imports = [
 	./dart.nix
	./git.nix
	./json.nix
	./nix.nix
	./python.nix
	./rust.nix
	./tex.nix
	./toml.nix
	./yaml.nix
  ];

  programs.nixvim = {
    plugins = {
      # lsp-format = {
      #   enable = true;
      #   lspServersToEnable = "all";
      # };

      lsp = {
        enable = true;
          inlayHints = true;
      };
      };

     keymaps = [
    {
      mode = ["n"];
      key = "<leader>cl";
      action = "<cmd>LspInfo<CR>";
      options = { silent = true; desc = "LSP Info"; };
    }
    {
      mode = ["n"];
      key = "gd";
      action = "<cmd>lua vim.lsp.buf.definition()<CR>";
      options = { silent = true; desc = "Goto Definition"; };
    }
    {
      mode = ["n"];
      key = "gr";
      action = "<cmd>lua vim.lsp.buf.references()<CR>";
      options = { silent = true; desc = "References"; };
    }
    {
      mode = ["n"];
      key = "gI";
      action = "<cmd>lua vim.lsp.buf.implementation()<CR>";
      options = { silent = true; desc = "Goto Implementation"; };
    }
    {
      mode = ["n"];
      key = "gy";
      action = "<cmd>lua vim.lsp.buf.type_definition()<CR>";
      options = { silent = true; desc = "Goto Type Definition"; };
    }
    {
      mode = ["n"];
      key = "gD";
      action = "<cmd>lua vim.lsp.buf.declaration()<CR>";
      options = { silent = true; desc = "Goto Declaration"; };
    }
    {
      mode = ["n"];
      key = "K";
      action = "<cmd>lua vim.lsp.buf.hover()<CR>";
      options = { silent = true; desc = "Hover"; };
    }
    {
      mode = ["n"];
      key = "gK";
      action = "<cmd>lua vim.lsp.buf.signature_help()<CR>";
      options = { silent = true; desc = "Signature Help"; };
    }
    {
      mode = ["i"];
      key = "<C-k>";
      action = "<cmd>lua vim.lsp.buf.signature_help()<CR>";
      options = { silent = true; desc = "Signature Help"; };
    }
    {
      mode = ["n" "v"];
      key = "<leader>ca";
      action = "<cmd>lua vim.lsp.buf.code_action()<CR>";
      options = { silent = true; desc = "Code Action"; };
    }
    {
      mode = ["n" "v"];
      key = "<leader>cc";
      action = "<cmd>lua vim.lsp.codelens.run()<CR>";
      options = { silent = true; desc = "Run Codelens"; };
    }
    {
      mode = ["n"];
      key = "<leader>cC";
      action = "<cmd>lua vim.lsp.codelens.refresh()<CR>";
      options = { silent = true; desc = "Refresh & Display Codelens"; };
    }
    {
      mode = ["n"];
      key = "<leader>cR";
      action = "<cmd>lua require('nvim-lspconfig').rename_file()<CR>";
      options = { silent = true; desc = "Rename File"; };
    }
    {
      mode = ["n"];
      key = "<leader>cr";
      action = "<cmd>lua vim.lsp.buf.rename()<CR>";
      options = { silent = true; desc = "Rename"; };
    }
    {
      mode = ["n"];
      key = "<leader>cA";
      action = "<cmd>lua vim.lsp.buf.execute_command()<CR>";
      options = { silent = true; desc = "Source Action"; };
    }
    {
      mode = ["n"];
      key = "]]";
      action = "<cmd>lua vim.lsp.buf.references()<CR>";
      options = { silent = true; desc = "Next Reference"; };
    }
    {
      mode = ["n"];
      key = "[[";
      action = "<cmd>lua vim.lsp.buf.references()<CR>";
      options = { silent = true; desc = "Prev Reference"; };
    }
    {
      mode = ["n"];
      key = "<A-n>";
      action = "<cmd>lua vim.lsp.buf.references()<CR>";
      options = { silent = true; desc = "Next Reference"; };
    }
    {
      mode = ["n"];
      key = "<A-p>";
      action = "<cmd>lua vim.lsp.buf.references()<CR>";
      options = { silent = true; desc = "Prev Reference"; };
    }
                ];
    };
}
