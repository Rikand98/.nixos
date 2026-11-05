{
  programs.nixvim = {
    config.extraConfigLuaPre = ''
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
      autoInstall.enable = true;
      settings = {
        log_level = "warn";
        notify_on_error = false;
        notify_no_formatters = false;
        formatters_by_ft = {
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
          javascript = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            timeout_ms = 2000;
            stop_after_first = true;
          };
          javascriptreact = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            timeout_ms = 2000;
            stop_after_first = true;
          };
          typescript = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            timeout_ms = 2000;
            stop_after_first = true;
          };
          typescriptreact = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            timeout_ms = 2000;
            stop_after_first = true;
          };
          json = [
            "prettier"
          ];
          markdown = [
            "prettier"
          ];
          sql = [
            "sqlfluff"
          ];
          nix = [
            "nixfmt"
          ];
          python = [
            "ruff_format"
            "ruff_organize_imports"
          ];
          rust = [
            "rustfmt"
          ];
          tex = [
            "latexindent"
          ];
          toml = [
            "taplo"
          ];
          yaml = [
            "prettier"
            "yamlfmt"
          ];
          "_" = [
            "squeeze_blanks"
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
      };
    };
  };
}
