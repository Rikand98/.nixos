{
  programs.nixvim = {
  	plugins.mini = {
		enable = true;
		modules = {
			bracketed = {};
			hipatterns = {};
			indentscope = {};
			notify = {};
			pairs = {};
			surround = {};
		};

	};
    keymaps = [
    # Mini.Surround Keymaps
    {
      mode = ["n" "v"];
      key = "gsa";
      action = "<cmd>lua require('mini.surround').add()<CR>";
      options = { silent = true; desc = "Add Surrounding"; };
    }
    {
      mode = ["n"];
      key = "gsd";
      action = "<cmd>lua require('mini.surround').delete()<CR>";
      options = { silent = true; desc = "Delete Surrounding"; };
    }
    {
      mode = ["n"];
      key = "gsf";
      action = "<cmd>lua require('mini.surround').find_right()<CR>";
      options = { silent = true; desc = "Find Right Surrounding"; };
    }
    {
      mode = ["n"];
      key = "gsF";
      action = "<cmd>lua require('mini.surround').find_left()<CR>";
      options = { silent = true; desc = "Find Left Surrounding"; };
    }
    {
      mode = ["n"];
      key = "gsh";
      action = "<cmd>lua require('mini.surround').highlight()<CR>";
      options = { silent = true; desc = "Highlight Surrounding"; };
    }
    {
      mode = ["n"];
      key = "gsn";
      action = "<cmd>lua require('mini.surround').update_config({ n_lines = 3 })<CR>";  # Change n_lines as needed
      options = { silent = true; desc = "Update MiniSurround.config.n_lines"; };
    }
    {
      mode = ["n" "v"];
      key = "gsr";
      action = "<cmd>lua require('mini.surround').replace()<CR>";
      options = { silent = true; desc = "Replace Surrounding"; };
    }
  ];
  };
}
