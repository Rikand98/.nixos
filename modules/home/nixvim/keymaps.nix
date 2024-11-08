{
  config,
  lib,
  ...
}: {
  programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = let
      normal =
        lib.mapAttrsToList
        (key: action: {
          mode = "n";
          inherit action key;
        })
        {
          "<Space>" = "<NOP>";
	  
	  #New line below cursor
	  "<CR>" = "m`o<Esc>``";
          # Esc to clear search results
          "<esc>" = ":noh<CR>";

          # fix Y behaviour
          Y = "y$";

          # back and fourth between the two most recent files
          "<C-c>" = ":b#<CR>";

          # close by Ctrl+x
          "<C-x>" = ":close<CR>";

          # save by Space+s or Ctrl+s
          "<leader>s" = ":w<CR>";
          "<C-s>" = ":w<CR>";

          # navigate to left/right window
          "<C-h>" = "<C-w>h";
          "<C-l>" = "<C-w>l";

          # navigate to start/end line
          "<M-h>" = "$";
          "<M-l>" = "^";

          # move current line up/down
          # M = Alt key
          "<M-k>" = ":move-2<CR>";
          "<M-j>" = ":move+<CR>";

	  # Redo
	  U = "<C-r>";

          # resize with arrows
          "<C-Up>" = ":resize -2<CR>";
          "<C-Down>" = ":resize +2<CR>";
          "<C-Left>" = ":vertical resize +2<CR>";
          "<C-Right>" = ":vertical resize -2<CR>";

          "<leader>rp" = ":!remi push<CR>";

	  #open link under cursor
	  gx = ":sil !open <cWORD><cr>";
        };
      visual =
        lib.mapAttrsToList
        (key: action: {
          mode = "v";
          inherit action key;
        })
        {
          # better indenting
          ">" = ">gv";
          "<" = "<gv";
          "<TAB>" = ">gv";
          "<S-TAB>" = "<gv";

          # move selected line / block of text in visual mode
          "K" = ":m '<-2<CR>gv=gv";
          "J" = ":m '>+1<CR>gv=gv";

          # navigate to start/end line
          "<M-h>" = "$";
          "<M-l>" = "^";

        };
      terminal =
        lib.mapAttrsToList
        (key: action: {
          mode = "t";
          inherit action key;
        })
        {
	"<space>" = "<space>";
	
	# exit to normal mode
	"<esc>" =  [[<C-\><C-n>]];
	
	#move between windows
	"<C-h>" = [[<Cmd>wincmd h<CR>]];
	"<C-j>" = [[<Cmd>wincmd j<CR>]];
	"<C-k>" = [[<Cmd>wincmd k<CR>]];
	"<C-l>" = [[<Cmd>wincmd l<CR>]];
	"<C-w>" = [[<C-\><C-n><C-w>]];
        };
    in
      config.lib.nixvim.keymaps.mkKeymaps
      {options.silent = true;}
      (normal ++ visual);
  };
}
