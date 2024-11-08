{
  imports = [
 	./dart.nix 
	./git.nix
	./json.nix
	./markdown.nix
	./nix.nix
	./python.nix
	./rust.nix
	./tex.nix
	./toml.nix
	./yaml.nix
  ];

  programs.nixvim = {
    plugins = {
      lsp-format = {
        enable = true;
        lspServersToEnable = "all";
      };

      lsp = {
        enable = true;

        keymaps = {
          silent = true;
          diagnostic = {
            # Navigate in diagnostics
            "<leader>k" = "goto_prev";
            "<leader>j" = "goto_next";
          };

          lspBuf = {
            gd = "definition";
            gD = "references";
            gt = "type_definition";
            gi = "implementation";
            K = "hover";
            "<F2>" = "rename";
          };
        };
      };
    };
  };
}
