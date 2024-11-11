{config, lib,...}:
{
  programs.nixvim = {
    plugins.yazi = {
      enable = true;
    };
keymaps =  [
    {
      mode = "n";
      key = "<leader>e";
      action = "<cmd>Yazi<CR>";
      options = {
        desc = "Yazi toggle";
        silent = true;
      };
    }
  ];
  };
}
