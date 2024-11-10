{
  programs.nixvim.plugins.which-key = {
    enable = true;

    settings = {
      spec = [
        {
          __unkeyed = "<leader>b";
          group = "Buffers";
        }
        {
          __unkeyed = "<leader>bs";
          group = "󰒺 Sort";
          icon = "";
        }
        {
          __unkeyed = "<leader>g";
          group = "Git";
        }
        {
          __unkeyed = "<leader>f";
          group = "Find";
        }
        {
          __unkeyed = "<leader>r";
          group = "Refactor";
          icon = " ";
        }
        {
          __unkeyed = "<leader>t";
          group = "Terminal";
        }
        {
          __unkeyed = "<leader>u";
          group = "UI/UX";
        }
      ];

      replace = {
        # key = [
        #   [
        #     "<Space>"
        #     "SPC"
        #   ]
        # ];

        desc = [
          [
            "<space>"
            "SPACE"
          ]
          [
            "<leader>"
            "SPACE"
          ]
          [
            "<[cC][rR]>"
            "RETURN"
          ]
          [
            "<[tT][aA][bB]>"
            "TAB"
          ]
          [
            "<[bB][sS]>"
            "BACKSPACE"
          ]
        ];
      };
      win = {
        border = "single";
      };

      # preset = "helix";
    };
  };
    keymaps = [
    # Which-Key Keymaps
    {
      mode = ["n"];
      key = "<c-w><space>";
      action = ":WhichKey '<space>'<CR>";
      options = { silent = true; desc = "Window Hydra Mode (which-key)"; };
    }
    {
      mode = ["n"];
      key = "<leader>?";
      action = ":WhichKey '?'<CR>";
      options = { silent = true; desc = "Buffer Keymaps (which-key)"; };
    }
  ];
}
