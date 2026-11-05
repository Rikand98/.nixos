{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = [ pkgs.vimPlugins.R-nvim ];
    extraConfigLua = ''
      require("r").setup({
        R_args = { "--quiet", "--no-save" },
        hook = {
          on_filetype = function()
            vim.keymap.set("n", "<Enter>", "<Plug>RDSendLine", { buffer = true })
            vim.keymap.set("x", "<Enter>", "<Plug>RSendSelection", { buffer = true })
          end,
        },
      })
    '';
  };
}
