{pkgs, lib,...}:
{
  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;
      settings = {
    formatters = {
        bash = [
          "shellcheck"
          "shellharden"
          "shfmt"
        ];
        cpp = [
          "clang_format"
        ];
        dart = [
          "dart_format"
        ];
        git = [
          "gitlint"
        ];
        javascript = {
          __unkeyed-1 = "prettierd";
          __unkeyed-2 = "prettier";
          timeout_ms = 2000;
          stop_after_first = true;
        };
        json = [
          "prettier"
        ];
        nix = [
          "nixfmt"
        ];
        python = [
          "black"
          "autopep8"
        ];
        rust = [
          "rustfmt"
        ];
        tex = [
          "latexindent"
        ];
        toml = [
          "tomlsort"
        ];
        yaml = [
          "prettier"
          "yamlfix"
        ];
        "_" = [
          "squeeze_blanks"
          "trim_whitespace"
          "trim_newlines"
        ];
      };

      # Format on save Lua function
      format_on_save = ''
        function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end

          if slow_format_filetypes[vim.bo[bufnr].filetype] then
            return
          end

          local function on_format(err)
            if err and err:match("timeout$") then
              slow_format_filetypes[vim.bo[bufnr].filetype] = true
            end
          end

          return { timeout_ms = 200, lsp_fallback = true }, on_format
        end
      '';

      # Format after save Lua function
      format_after_save = ''
        function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end

          if not slow_format_filetypes[vim.bo[bufnr].filetype] then
            return
          end

          return { lsp_fallback = true }
        end
      '';

      # Define formatters' commands
      formatters_commands = {
        shellcheck = {
          command = lib.getExe pkgs.shellcheck;
        };
        shfmt = {
          command = lib.getExe pkgs.shfmt;
        };
        shellharden = {
          command = lib.getExe pkgs.shellharden;
        };
        squeeze_blanks = {
          command = lib.getExe pkgs.coreutils "cat";
        };
        dart_format = {
          command = lib.getExe pkgs.dartPackages.dartfmt;
        };
        gitlint = {
          command = lib.getExe pkgs.gitlint;
        };
        prettier = {
          command = lib.getExe pkgs.prettier;
        };
        nixfmt = {
          command = lib.getExe pkgs.nixfmt;
        };
        black = {
          command = lib.getExe pkgs.python3Packages.black;
        };
        autopep8 = {
          command = lib.getExe pkgs.python3Packages.autopep8;
        };
        rustfmt = {
          command = lib.getExe pkgs.rustPackages.rustfmt;
        };
        latexindent = {
          command = lib.getExe pkgs.latexindent;
        };
        tomlsort = {
          command = lib.getExe pkgs.tomlsort;
        };
        yamlfix = {
          command = lib.getExe pkgs.yamlfix;
        };
      };
    };
  };
    keymaps = [
      {
        mode = ["n"];
        key = "<leader>cf";
        action = ":ConformFormat<CR>";
        options = { silent = true; desc = "Format File with Conform"; };
      }
      {
        mode = ["n"];
        key = "<leader>cF";
        action = ":ConformFix<CR>";
        options = { silent = true; desc = "Auto Fix with Conform"; };
      }
    ];
};
}
