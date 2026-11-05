{
  programs.nixvim.plugins.lsp.servers = {
    ruff.enable = true;
    pyrefly.enable = true;
  };

  programs.nixvim.plugins.venv-selector.enable = true;

  programs.nixvim.keymaps = [
    {
      mode = [ "n" ];
      key = "<leader>cv";
      action = "<cmd>VenvSelect<cr>";
      options = {
        desc = "Select VirtualEnv";
      };
    }
  ];
}
