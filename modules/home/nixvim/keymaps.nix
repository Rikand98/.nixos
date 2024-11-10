{
  globals.mapleader = " ";

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

      # Window Resizing
      { mode = ["n"]; key = "<C-Up>"; action = ":resize +2<CR>"; options = { silent = true; desc = "Increase Window Height"; }; }
      { mode = ["n"]; key = "<C-Down>"; action = ":resize -2<CR>"; options = { silent = true; desc = "Decrease Window Height"; }; }
      { mode = ["n"]; key = "<C-Left>"; action = ":vertical resize -2<CR>"; options = { silent = true; desc = "Decrease Window Width"; }; }
      { mode = ["n"]; key = "<C-Right>"; action = ":vertical resize +2<CR>"; options = { silent = true; desc = "Increase Window Width"; }; }

      # Moving Lines
      { mode = ["n" "i" "v"]; key = "<A-j>"; action = ":m .+1<CR>=="; options = { silent = true; desc = "Move Line Down"; }; }
      { mode = ["n" "i" "v"]; key = "<A-k>"; action = ":m .-2<CR>=="; options = { silent = true; desc = "Move Line Up"; }; }

      # Buffer Navigation
      { mode = ["n"]; key = "<S-h>"; action = ":bprevious<CR>"; options = { silent = true; desc = "Prev Buffer"; }; }
      { mode = ["n"]; key = "<S-l>"; action = ":bnext<CR>"; options = { silent = true; desc = "Next Buffer"; }; }
      { mode = ["n"]; key = "[b"; action = ":bprevious<CR>"; options = { silent = true; desc = "Prev Buffer"; }; }
      { mode = ["n"]; key = "]b"; action = ":bnext<CR>"; options = { silent = true; desc = "Next Buffer"; }; }
      { mode = ["n"]; key = "<leader>bb"; action = ":b#<CR>"; options = { silent = true; desc = "Switch to Other Buffer"; }; }
      { mode = ["n"]; key = "<leader>`"; action = ":b#<CR>"; options = { silent = true; desc = "Switch to Other Buffer"; }; }
      { mode = ["n"]; key = "<leader>bd"; action = ":bdelete<CR>"; options = { silent = true; desc = "Delete Buffer"; }; }
      { mode = ["n"]; key = "<leader>bo"; action = ":bufdo bdelete<CR>"; options = { silent = true; desc = "Delete Other Buffers"; }; }
      { mode = ["n"]; key = "<leader>bD"; action = ":Bdelete!<CR>"; options = { silent = true; desc = "Delete Buffer and Window"; }; }

      # Clearing Search Highlight
      { mode = ["n" "i"]; key = "<esc>"; action = ":noh<CR>"; options = { silent = true; desc = "Escape and Clear hlsearch"; }; }

      # Search Navigation
      { mode = ["n" "x" "o"]; key = "n"; action = "nzzzv"; options = { silent = true; desc = "Next Search Result"; }; }
      { mode = ["n" "x" "o"]; key = "N"; action = "Nzzzv"; options = { silent = true; desc = "Prev Search Result"; }; }

      # Saving
      { mode = ["n" "x" "i" "s"]; key = "<C-s>"; action = ":w<CR>"; options = { silent = true; desc = "Save File"; }; }

      # Commenting
      { mode = ["n"]; key = "gco"; action = ":lua require('Comment.api').insert_linewise_below()<CR>"; options = { silent = true; desc = "Add Comment Below"; }; }
      { mode = ["n"]; key = "gcO"; action = ":lua require('Comment.api').insert_linewise_above()<CR>"; options = { silent = true; desc = "Add Comment Above"; }; }

      # Various Tools
      { mode = ["n"]; key = "<leader>l"; action = ":Lazy<CR>"; options = { silent = true; desc = "Lazy"; }; }
      { mode = ["n"]; key = "<leader>K"; action = ":lua vim.lsp.buf.hover()<CR>"; options = { silent = true; desc = "Keywordprg"; }; }
      { mode = ["n"]; key = "<leader>fn"; action = ":enew<CR>"; options = { silent = true; desc = "New File"; }; }
      { mode = ["n"]; key = "<leader>xl"; action = ":lopen<CR>"; options = { silent = true; desc = "Location List"; }; }
      { mode = ["n"]; key = "<leader>xq"; action = ":copen<CR>"; options = { silent = true; desc = "Quickfix List"; }; }
      { mode = ["n"]; key = "[q"; action = ":cprev<CR>"; options = { silent = true; desc = "Previous Quickfix"; }; }
      { mode = ["n"]; key = "]q"; action = ":cnext<CR>"; options = { silent = true; desc = "Next Quickfix"; }; }
      { mode = ["n"]; key = "<leader>cf"; action = ":lua vim.lsp.buf.formatting()<CR>"; options = { silent = true; desc = "Format"; }; }
      { mode = ["n"]; key = "<leader>cd"; action = ":lua vim.diagnostic.open_float()<CR>"; options = { silent = true; desc = "Line Diagnostics"; }; }

      # Diagnostics Navigation
      { mode = ["n"]; key = "]d"; action = ":lua vim.diagnostic.goto_next()<CR>"; options = { silent = true; desc = "Next Diagnostic"; }; }
      { mode = ["n"]; key = "[d"; action = ":lua vim.diagnostic.goto_prev()<CR>"; options = { silent = true; desc = "Prev Diagnostic"; }; }
      { mode = ["n"]; key = "]e"; action = ":lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>"; options = { silent = true; desc = "Next Error"; }; }
      { mode = ["n"]; key = "[e"; action = ":lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>"; options = { silent = true; desc = "Prev Error"; }; }
      { mode = ["n"]; key = "]w"; action = ":lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.WARN})<CR>"; options = { silent = true; desc = "Next Warning"; }; }
      { mode = ["n"]; key = "[w"; action = ":lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.WARN})<CR>"; options = { silent = true; desc = "Prev Warning"; }; }

      # Toggles
      { mode = ["n"]; key = "<leader>uf"; action = ":lua require('lazyvim.util').toggle_autoformat()<CR>"; options = { silent = true; desc = "Toggle Auto Format (Global)"; }; }
      { mode = ["n"]; key = "<leader>uF"; action = ":lua require('lazyvim.util').toggle_autoformat_buffer()<CR>"; options = { silent = true; desc = "Toggle Auto Format (Buffer)"; }; }
      { mode = ["n"]; key = "<leader>us"; action = ":set spell!<CR>"; options = { silent = true; desc = "Toggle Spelling"; }; }
      { mode = ["n"]; key = "<leader>uw"; action = ":set wrap!<CR>"; options = { silent = true; desc = "Toggle Wrap"; }; }
      { mode = ["n"]; key = "<leader>uL"; action = ":set relativenumber!<CR>"; options = { silent = true; desc = "Toggle Relative Number"; }; }
      { mode = ["n"]; key = "<leader>ud"; action = ":lua vim.diagnostic.config({ virtual_text = not vim.diagnostic.config().virtual_text })<CR>"; options = { silent = true; desc = "Toggle Diagnostics"; }; }
      { mode = ["n"]; key = "<leader>ul"; action = ":set number!<CR>"; options = { silent = true; desc = "Toggle Line Numbers"; }; }
      { mode = ["n"]; key = "<leader>uc"; action = ":set conceallevel=2<CR>"; options = { silent = true; desc = "Toggle conceallevel"; }; }
      { mode = ["n"]; key = "<leader>uT"; action = ":TSBufToggle highlight<CR>"; options = { silent = true; desc = "Toggle Treesitter Highlight"; }; }
      { mode = ["n"]; key = "<leader>ub"; action = ":set background=dark<CR>"; options = { silent = true; desc = "Toggle Dark Background"; }; }
      { mode = ["n"]; key = "<leader>uh"; action = ":lua vim.lsp.inlay_hint(0)<CR>"; options = { silent = true; desc = "Toggle Inlay Hints"; }; }

      # Window Management
      { mode = ["n"]; key = "<leader>w"; action = ":wincmd<CR>"; options = { silent = true; desc = "Windows"; }; }
      { mode = ["n"]; key = "<leader>-"; action = ":split<CR>"; options = { silent = true; desc = "Split Window Below"; }; }
      { mode = ["n"]; key = "<leader>|"; action = ":vsplit<CR>"; options = { silent = true; desc = "Split Window Right"; }; }
      { mode = ["n"]; key = "<leader>wd"; action = ":close<CR>"; options = { silent = true; desc = "Delete Window"; }; }
      { mode = ["n"]; key = "<leader>wm"; action = ":wincmd _<CR><C-w>|<CR>"; options = { silent = true; desc = "Toggle Maximize"; }; }

      # Tab Management
      { mode = ["n"]; key = "<leader><tab>l"; action = ":tablast<CR>"; options = { silent = true; desc = "Last Tab"; }; }
      { mode = ["n"]; key = "<leader><tab>o"; action = ":tabonly<CR>"; options = { silent = true; desc = "Close Other Tabs"; }; }
      { mode = ["n"]; key = "<leader><tab>f"; action = ":tabfirst<CR>"; options = { silent = true; desc = "First Tab"; }; }
      { mode = ["n"]; key = "<leader><tab><tab>"; action = ":tabnew<CR>"; options = { silent = true; desc = "New Tab"; }; }
      { mode = ["n"]; key = "<leader><tab>]"; action = ":tabnext<CR>"; options = { silent = true; desc = "Next Tab"; }; }
      { mode = ["n"]; key = "<leader><tab>d"; action = ":tabclose<CR>"; options = { silent = true; desc = "Close Tab"; }; }
      { mode = ["n"]; key = "<leader><tab>["; action = ":tabprevious<CR>"; options = { silent = true; desc = "Previous Tab"; }; }
    ];
}
