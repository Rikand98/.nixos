{pkgs, lib,...}:
{
  programs.nixvim = {
      config = {
    extraConfigLuaPre =
      # lua
      ''
        local slow_format_filetypes = {}

        vim.api.nvim_create_user_command("FormatDisable", function(args)
           if args.bang then
            -- FormatDisable! will disable formatting just for this buffer
            vim.b.disable_autoformat = true
          else
            vim.g.disable_autoformat = true
          end
        end, {
          desc = "Disable autoformat-on-save",
          bang = true,
        })
        vim.api.nvim_create_user_command("FormatEnable", function()
          vim.b.disable_autoformat = false
          vim.g.disable_autoformat = false
        end, {
          desc = "Re-enable autoformat-on-save",
        })
        vim.api.nvim_create_user_command("FormatToggle", function(args)
          if args.bang then
            -- Toggle formatting for current buffer
            vim.b.disable_autoformat = not vim.b.disable_autoformat
          else
            -- Toggle formatting globally
            vim.g.disable_autoformat = not vim.g.disable_autoformat
          end
        end, {
          desc = "Toggle autoformat-on-save",
          bang = true,
        })
      '';
    plugins.conform-nvim = {
      enable = true;
      settings = {
        log_level = "warn";
    notify_on_error = false;
    notify_no_formatters = false;
        formatters_by_ft= {
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
          "nixfmt-rfc-style"
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
          "toml-sort"
        ];
        yaml = [
          "prettier"
          "yamlfmt"
        ];
        "_" = [
          # "squeeze_blanks"
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
        # squeeze_blanks = {
        #   command = lib.getExe pkgs.coreutils "cat";
        # };
        dart_format = {
          command = "${pkgs.dart}/bin/dart format";
        };
        gitlint = {
          command = lib.getExe pkgs.gitlint;
        };
        prettier = {
          command = lib.getExe pkgs.prettierd;
        };
        nixfmt-rfc-style = {
          command = lib.getExe pkgs.nixfmt-rfc-style;
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
          command = "${pkgs.texlivePackages.latexindent}/bin/latexindent";
        };
        toml-sort = {
          command = lib.getExe pkgs.toml-sort;
        };
        yamlfmt = {
          command = lib.getExe pkgs.yamlfmt;
        };
      };
    };
  };
    keymaps = [
      {
        mode = ["n"];
        key = "<leader>cf";
        action = "<cmd>ConformFormat<CR>";
        options = { silent = true; desc = "Format File with Conform"; };
      }
      {
        mode = ["n"];
        key = "<leader>cF";
        action = "<cmd>ConformFix<CR>";
        options = { silent = true; desc = "Auto Fix with Conform"; };
      }
    ];
};};
}
