-- lsp-config.lua
return {
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    lazy = false,
    opts = {
      auto_install = true,
      ensure_installed = { "ts_ls" },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      -- Configure each LSP separately for single responsibility
      local servers = {
        ts_ls = {},
        unocss = {},
        solargraph = {},
        lua_ls = {},
        gopls = {},
        dockerls = { filetypes = { "Dockerfile", "docker-compose" } },
        pyright = { venv = vim.env.VIRTUAL_ENV, filetypes = { "python" } },
        sqlls = {},
        cssls = {},          -- CSS Language Server
        tailwindcss = {},    -- TailwindCSS Language Server
      }
      -- Setup all defined servers with default capabilities
      for server, config in pairs(servers) do
        config.capabilities = capabilities
        lspconfig[server].setup(config)
      end
      -- Emmet setup for front-end filetypes
      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = {
          "css", "eruby", "html", "javascript", "javascriptreact",
          "less", "sass", "scss", "svelte", "pug", "typescriptreact", "vue",
        },
        init_options = {
          html = { options = { ["output.selfClosingStyle"] = "xhtml" } },
        },
      })
      -- Keybindings for LSP
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
      vim.keymap.set("i", "<C-e>", "<cmd>EmmetExpandAbbreviation<CR>", { noremap = true })
    end,
  },
}
