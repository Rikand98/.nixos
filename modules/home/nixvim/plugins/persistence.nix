{
    programs.nixvim = {
        plugins.persistence = {
            enable = true;
            dir = {
              __raw = "vim.fn.expand(vim.fn.stdpath(\"state\") .. \"/sessions/\")";
            };
            options =
                [
                  "buffers"
                  "curdir"
                  "tabpages"
                  "winsize"
                  "skiprtp"
                ];
        };
    keymaps = [
      {
        mode = "n";
        key = "<leader>qs";
        action = {
            __raw = "require(\"persistence\").load()";
            };
        options = {
           desc = "Load Session for Current Directory";
        };
      }
      {
        mode = "n";
        key = "<leader>qS";
        action = {
                __raw = "require(\"persistence\").select()";
                };
        options = {
          desc = "Select a Session to Load";
        };
      }
      {
        mode = "n";
        key = "<leader>ql";
        action = {
                __raw = "require(\"persistence\").load({ last = true })";
                };
        options = {
          desc = "Load Last Session";
        };
      }
      {
        mode = "n";
        key = "<leader>qd";
        action = {
                __raw = "require(\"persistence\").stop()";
                };
        options = {
          desc = "Stop Persistence (No Save on Exit)";
        };
      }
    ];
    };
}
