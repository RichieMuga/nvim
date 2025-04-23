-- null-ls-config.lua
return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")
    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    null_ls.setup({
      sources = {
        -- Lua
        formatting.stylua,

        -- JavaScript/TypeScript/HTML/CSS
        formatting.prettier,

        -- PHP formatters
        formatting.pint,

        -- PHP linters
        diagnostics.phpcs.with({
          command = "phpcs",
          args = { "--standard=PSR12", "-" },
        }),

        diagnostics.phpstan.with({
          command = "phpstan",
          args = { "analyse", "--error-format=raw", "--memory-limit=512M", "-" },
        }),

        -- GO
        formatting.gofmt,
        formatting.goimports,
        diagnostics.golangci_lint,
        diagnostics.revive,

        -- Python
        formatting.black,
        formatting.isort,

        -- SQL
        formatting.sql_formatter,
        diagnostics.sqlfluff,

        -- CSS
        formatting.stylelint,
        diagnostics.stylelint,
      },
    })

    vim.keymap.set("n", "<leader>gf", function()
      vim.lsp.buf.format({ async = true })
    end, { desc = "Format buffer" })
  end,
}

