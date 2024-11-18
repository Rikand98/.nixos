{
  programs.nixvim = {
    plugins.todo-comments = {
      enable = true;
    };
    keymaps = [
    {
      mode = "n";
      key = "]t";
      action = {
          __raw = "function() jump_next()end";
        };
      options = {
        desc = "Next TODO Comments";
      };
    }
    {
      mode = "n";
      key = "[t";
      action = {
          __raw = "function() jump_prev()end";
        };
      options = {
        desc = "Previous TODO Comments";
      };
    }
    {
      mode = "n";
      key = "<leader>xt";
      action = "<cmd>Trouble todo toggle<cr>";
      options = {
        desc = "Todo (Trouble)";
      };
    }
    {
      mode = "n";
      key = "<leader>xT";
      action = "<cmd>Trouble todo toggle filter = {tag = {TODO,FIX,FIXME}}<cr>";
      options = {
        desc = "Todo/Fix/Fixme (Trouble)";
      };
    }
    {
      mode = "n";
      key = "<leader>st";
      action = "<cmd>TroubleFzflua<cr>";
      options = {
        desc = "Todo";
      };
    }
    {
      mode = "n";
      key = "<leader>sT";
      action = "<cmd>TroubleFzflua keywords=TODO,FIX,FIXME<cr>";
      options = {
        desc = "Todo/Fix/Fixme (Trouble)";
      };
    }
    ];
  };
}
