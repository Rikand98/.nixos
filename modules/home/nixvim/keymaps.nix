{
programs.nixvim = {
    globals = {
      mapleader = " ";
      maplocalleader = " ";
    };

    keymaps = [
      # Movement and Window Navigation
      { mode = ["n" "x"]; key = "j"; action = "v:count == 0 ? 'gj' : 'j'"; options = { expr = true; silent = true; desc = "Down"; }; }
      { mode = ["n" "x"]; key = "<Down>"; action = "v:count == 0 ? 'gj' : 'j'"; options = { expr = true; silent = true; desc = "Down"; }; }
      { mode = ["n" "x"]; key = "k"; action = "v:count == 0 ? 'gk' : 'k'"; options = { expr = true; silent = true; desc = "Up"; }; }
      { mode = ["n" "x"]; key = "<Up>"; action = "v:count == 0 ? 'gk' : 'k'"; options = { expr = true; silent = true; desc = "Up"; }; }
      { mode = ["n"]; key = "<C-h>"; action = "<C-w>h"; options = { silent = true; desc = "Go to Left Window"; }; }
      { mode = ["n"]; key = "<C-j>"; action = "<C-w>j"; options = { silent = true; desc = "Go to Lower Window"; }; }
      { mode = ["n"]; key = "<C-k>"; action = "<C-w>k"; options = { silent = true; desc = "Go to Upper Window"; }; }
      { mode = ["n"]; key = "<C-l>"; action = "<C-w>l"; options = { silent = true; desc = "Go to Right Window"; }; }
      { mode = ["t"]; key = "<C-h>"; action = "<cmd>wincmd h<CR>"; options = { silent = true; desc = "Go to Left Window"; }; }
      { mode = ["t"]; key = "<C-j>"; action = "<cmd>wincmd j<CR>"; options = { silent = true; desc = "Go to Lower Window"; }; }
      { mode = ["t"]; key = "<C-k>"; action = "<cmd>wincmd k<CR>"; options = { silent = true; desc = "Go to Upper Window"; }; }
      { mode = ["t"]; key = "<C-l>"; action = "<cmd>wincmd l<CR>"; options = { silent = true; desc = "Go to Right Window"; }; }

      # Window Resizing
      { mode = ["n"]; key = "<C-Up>"; action = "<cmd>resize +2<CR>"; options = { silent = true; desc = "Increase Window Height"; }; }
      { mode = ["n"]; key = "<C-Down>"; action = "<cmd>resize -2<CR>"; options = { silent = true; desc = "Decrease Window Height"; }; }
      { mode = ["n"]; key = "<C-Left>"; action = "<cmd>vertical resize -2<CR>"; options = { silent = true; desc = "Decrease Window Width"; }; }
      { mode = ["n"]; key = "<C-Right>"; action = "<cmd>vertical resize +2<CR>"; options = { silent = true; desc = "Increase Window Width"; }; }

      # Moving Lines
      { mode = ["n" "i" "v"]; key = "<A-j>"; action = "<cmd>m .+1<CR>=="; options = { silent = true; desc = "Move Line Down"; }; }
      { mode = ["n" "i" "v"]; key = "<A-k>"; action = "<cmd>m .-2<CR>=="; options = { silent = true; desc = "Move Line Up"; }; }
      { mode = ["n" "i" "v"]; key = "<A-h>"; action = "^"; options = { silent = true; desc = "Move to start of Line"; }; }
      { mode = ["n" "i" "v"]; key = "<A-l>"; action = "$"; options = { silent = true; desc = "Move to end of Line"; }; }
      { mode = ["v"]; key = "<"; action = "<gv"; options = { silent = true; }; }
      { mode = ["v"]; key = ">"; action = ">gv"; options = { silent = true; }; }

      # Clearing Search Highlight
      { mode = ["n" "i" "x"]; key = "<esc>"; action = "<cmd>noh<CR><esc>"; options = { silent = true; desc = "Escape and Clear hlsearch"; }; }
      { mode = ["t"]; key = "<esc>"; action = "<C-\\><C-n>"; options = { silent = true; desc = "Exit Terminal Mode"; }; }

      # Search Navigation
      { mode = ["n" "x" "o"]; key = "n"; action = "nzzzv"; options = { silent = true; desc = "Next Search Result"; }; }
      { mode = ["n" "x" "o"]; key = "N"; action = "Nzzzv"; options = { silent = true; desc = "Prev Search Result"; }; }

      # Saving
      { mode = ["n" "x" "i" "s"]; key = "<C-s>"; action = "<cmd>w<CR><esc>"; options = { silent = true; desc = "Save File"; }; }

      # Various Tools
      { mode = ["n"]; key = "<leader>K"; action = "<cmd>lua vim.lsp.buf.hover()<CR>"; options = { silent = true; desc = "Keywordprg"; }; }
      { mode = ["n"]; key = "<leader>fn"; action = "<cmd>enew<CR>"; options = { silent = true; desc = "New File"; }; }
      { mode = ["n"]; key = "<leader>xl"; action = "<cmd>lopen<CR>"; options = { silent = true; desc = "Location List"; }; }
      { mode = ["n"]; key = "<leader>xq"; action = "<cmd>copen<CR>"; options = { silent = true; desc = "Quickfix List"; }; }
      { mode = ["n"]; key = "[q"; action = "<cmd>cprev<CR>"; options = { silent = true; desc = "Previous Quickfix"; }; }
      { mode = ["n"]; key = "]q"; action = "<cmd>cnext<CR>"; options = { silent = true; desc = "Next Quickfix"; }; }
      { mode = ["n"]; key = "<leader>cf"; action = "<cmd>lua vim.lsp.buf.formatting()<CR>"; options = { silent = true; desc = "Format"; }; }
      { mode = ["n"]; key = "<leader>cd"; action = "<cmd>lua vim.diagnostic.open_float()<CR>"; options = { silent = true; desc = "Line Diagnostics"; }; }

      # Diagnostics Navigation
      { mode = ["n"]; key = "]d"; action = "<cmd>lua vim.diagnostic.goto_next()<CR>"; options = { silent = true; desc = "Next Diagnostic"; }; }
      { mode = ["n"]; key = "[d"; action = "<cmdlua vim.diagnostic.goto_prev()<CR>"; options = { silent = true; desc = "Prev Diagnostic"; }; }
      { mode = ["n"]; key = "]e"; action = "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>"; options = { silent = true; desc = "Next Error"; }; }
      { mode = ["n"]; key = "[e"; action = "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>"; options = { silent = true; desc = "Prev Error"; }; }
      { mode = ["n"]; key = "]w"; action = "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARN})<CR>"; options = { silent = true; desc = "Next Warning"; }; }
      { mode = ["n"]; key = "[w"; action = "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARN})<CR>"; options = { silent = true; desc = "Prev Warning"; }; }

      # Toggles
      { mode = ["n"]; key = "<leader>us"; action = "<cmd>set spell!<CR>"; options = { silent = true; desc = "Toggle Spelling"; }; }
      { mode = ["n"]; key = "<leader>uw"; action = "<cmd>set wrap!<CR>"; options = { silent = true; desc = "Toggle Wrap"; }; }
      { mode = ["n"]; key = "<leader>uL"; action = "<cmd>set relativenumber!<CR>"; options = { silent = true; desc = "Toggle Relative Number"; }; }
      { mode = ["n"]; key = "<leader>ud"; action = "<cmd>lua vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })<CR>"; options = { silent = true; desc = "Toggle Diagnostics"; }; }
      { mode = ["n"]; key = "<leader>ul"; action = "<cmd>set number!<CR>"; options = { silent = true; desc = "Toggle Line Numbers"; }; }
      { mode = ["n"]; key = "<leader>uc"; action = "<cmd>set conceallevel=2<CR>"; options = { silent = true; desc = "Toggle conceallevel"; }; }
      { mode = ["n"]; key = "<leader>uT"; action = "<cmd>TSBufToggle highlight<CR>"; options = { silent = true; desc = "Toggle Treesitter Highlight"; }; }
      { mode = ["n"]; key = "<leader>ub"; action = "<cmd>set background=dark<CR>"; options = { silent = true; desc = "Toggle Dark Background"; }; }
      { mode = ["n"]; key = "<leader>uh"; action = "<cmd>lua vim.lsp.inlay_hint(0)<CR>"; options = { silent = true; desc = "Toggle Inlay Hints"; }; }

      # Window Management
      { mode = ["n"]; key = "<leader>w"; action = "<cmd>wincmd<CR>"; options = { silent = true; desc = "Windows"; }; }
      { mode = ["n"]; key = "<leader>-"; action = "<cmd>split<CR>"; options = { silent = true; desc = "Split Window Below"; }; }
      { mode = ["n"]; key = "<leader>|"; action = "<cmd>vsplit<CR>"; options = { silent = true; desc = "Split Window Right"; }; }
      { mode = ["n"]; key = "<leader>wd"; action = "<cmd>close<CR>"; options = { silent = true; desc = "Delete Window"; }; }
      { mode = ["n"]; key = "<leader>wm"; action = "<cmd>wincmd _<CR><C-w>|<CR>"; options = { silent = true; desc = "Toggle Maximize"; }; }

      # Tab Management
      { mode = ["n"]; key = "<leader><tab>j"; action = "<cmd>tablast<CR>"; options = { silent = true; desc = "Last Tab"; }; }
      { mode = ["n"]; key = "<leader><tab>o"; action = "<cmd>tabonly<CR>"; options = { silent = true; desc = "Close Other Tabs"; }; }
      { mode = ["n"]; key = "<leader><tab>k"; action = "<cmd>tabfirst<CR>"; options = { silent = true; desc = "First Tab"; }; }
      { mode = ["n"]; key = "<leader><tab><tab>"; action = "<cmd>tabnew<CR>"; options = { silent = true; desc = "New Tab"; }; }
      { mode = ["n"]; key = "<leader><tab>l"; action = "<cmd>tabnext<CR>"; options = { silent = true; desc = "Next Tab"; }; }
      { mode = ["n"]; key = "<leader><tab>d"; action = "<cmd>tabclose<CR>"; options = { silent = true; desc = "Close Tab"; }; }
      { mode = ["n"]; key = "<leader><tab>h"; action = "<cmd>tabprevious<CR>"; options = { silent = true; desc = "Previous Tab"; }; }
    ];
 };
}
