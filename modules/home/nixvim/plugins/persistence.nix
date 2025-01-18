{
    programs.nixvim = {
        plugins.persistence = {
            enable = true;
            settings = {
                dir = {
                  __raw = "vim.fn.expand(vim.fn.stdpath(\"state\") .. \"/sessions/\")";
                };
            };
        };
    keymaps = [
      {
        mode = "n";
        key = "<leader>qs";
        action = {
            __raw = "function(path) require('persistence').load() end";
            };
        options = {
           desc = "Load Session for Current Directory";
        };
      }
      {
        mode = "n";
        key = "<leader>qS";
        action = {
                __raw = "function(path) require('persistence').select() end";
                };
        options = {
          desc = "Select a Session to Load";
        };
      }
      {
        mode = "n";
        key = "<leader>ql";
        action = {
                __raw = "function(path) require('persistence').load({ last = true }) end";
                };
        options = {
          desc = "Load Last Session";
        };
      }
      {
        mode = "n";
        key = "<leader>qd";
        action = {
                __raw = "function(path) require('persistence').stop() end";
                };
        options = {
          desc = "Stop Persistence (No Save on Exit)";
        };
      }
    ];
    };
}
