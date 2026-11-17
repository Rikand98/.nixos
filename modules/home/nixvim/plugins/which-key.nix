{
  programs.nixvim = {
    plugins.which-key = {
    enable = true;

    settings = {
      spec = [
        {
          __unkeyed = "<leader>b";
          group = "Buffers";
        }
        {
          __unkeyed = "<leader>c";
          group = "Code";
        }
        {
          __unkeyed = "<leader>d";
          group = "Debug";
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
          __unkeyed = "<leader>q";
          group = "Session/Quit";
        }
        {
          __unkeyed = "<leader>s";
          group = "Search";
        }
        {
          __unkeyed = "<leader>t";
          group = "Test";
        }
        {
          __unkeyed = "<leader>T";
          group = "Terminal";
        }
        {
          __unkeyed = "<leader>u";
          group = "UI/UX";
        }
        {
          __unkeyed = "<leader>x";
          group = "Diagnostics/Quickfix";
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
      action = "<cmd>WhichKey '<space>'<CR>";
      options = { silent = true; desc = "Window Hydra Mode (which-key)"; };
    }
    {
      mode = ["n"];
      key = "<leader>?";
      action = "<cmd>WhichKey '?'<CR>";
      options = { silent = true; desc = "Buffer Keymaps (which-key)"; };
    }
  ];
};
}
