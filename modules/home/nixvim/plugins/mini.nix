{
  programs.nixvim = {
  	plugins.mini = {
		enable = true;
		modules = {
			bracketed = {};
			hipatterns = {};
      icons = {};
			indentscope = {};
			pairs = {};
			surround = {};
		};

	};
    keymaps = [
    # Mini.Surround Keymaps
    {
      mode = ["n" "v"];
      key = "gsa";
      action = {
          __raw = "function() require('mini.surround').add()end";
        };
      options = { silent = true; desc = "Add Surrounding"; };
    }
    {
      mode = ["n"];
      key = "gsd";
      action = {
          __raw = "function() require('mini.surround').delete()end";
        };
      options = { silent = true; desc = "Delete Surrounding"; };
    }
    {
      mode = ["n"];
      key = "gsf";
      action = {
          __raw = "function() require('mini.surround').find_right()end";
        };
      options = { silent = true; desc = "Find Right Surrounding"; };
    }
    {
      mode = ["n"];
      key = "gsF";
      action = {
          __raw = "function() require('mini.surround').find_left()end";
        };
      options = { silent = true; desc = "Find Left Surrounding"; };
    }
    {
      mode = ["n"];
      key = "gsh";
      action = {
          __raw = "function() require('mini.surround').highlight()end";
        };
      options = { silent = true; desc = "Highlight Surrounding"; };
    }
    {
      mode = ["n"];
      key = "gsn";
      action = {
          __raw = "function() require('mini.surround').update_config({ n_lines = 3 })end";
        };
      options = { silent = true; desc = "Update MiniSurround.config.n_lines"; };
    }
    {
      mode = ["n" "v"];
      key = "gsr";
      action = {
          __raw = "function() require('mini.surround').replace()end";
        };
      options = { silent = true; desc = "Replace Surrounding"; };
    }
  ];
  };
}
