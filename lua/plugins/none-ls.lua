-- null-ls-config.lua
return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        -- General formatting and diagnostics
        -- Lua
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.diagnostics.erb_lint,
        -- GO
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.goimports,
        null_ls.builtins.diagnostics.golangci_lint,
        null_ls.builtins.diagnostics.revive,
        -- Python
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.formatting.flake8,
        -- Sql
        null_ls.builtins.formatting.sql_formatter,
        null_ls.builtins.diagnostics.sqlfluff,
        -- CSS-specific formatters and linters
        null_ls.builtins.formatting.stylelint, -- CSS formatter
        null_ls.builtins.diagnostics.stylelint, -- CSS linter
      },
    })

    -- Keybinding for formatting
    vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
  end,
}
