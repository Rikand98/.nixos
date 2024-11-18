{
    programs.nixvim = {
        plugins.persistence = {
            enable = true;
        };
    keymaps = [
      {
        mode = "n";
        key = "<leader>qs";
        action = {
            __raw = "function() load() end";
            };
        options = {
           desc = "Load Session for Current Directory";
        };
      }
      {
        mode = "n";
        key = "<leader>qS";
        action = {
                __raw = "function() select() end";
                };
        options = {
          desc = "Select a Session to Load";
        };
      }
      {
        mode = "n";
        key = "<leader>ql";
        action = {
                __raw = "function() load({ last = true }) end";
                };
        options = {
          desc = "Load Last Session";
        };
      }
      {
        mode = "n";
        key = "<leader>qd";
        action = {
                __raw = "function() stop() end";
                };
        options = {
          desc = "Stop Persistence (No Save on Exit)";
        };
      }
    ];
    };
}
