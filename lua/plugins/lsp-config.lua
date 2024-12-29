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
      ensure_installed = {
        "ts_ls",
        "pyright",
        "jedi_language_server",
        "pylsp",
        "lua_ls",
        "gopls",
        "cssls",
        "tailwindcss",
        "sqlls",
        "dockerls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")
      -- Configure each LSP separately
      local servers = {
        ts_ls = {},
        pyright = {
          settings = {
            python = {
              analysis = { typeCheckingMode = "basic" },
            },
          },
        },
        lua_ls = {},
        gopls = {},
        cssls = {},
        tailwindcss = {},
        dockerls = { filetypes = { "Dockerfile", "docker-compose" } },
        sqlls = {},
      }
      -- Setup all servers
      for server, config in pairs(servers) do
        config.capabilities = capabilities
        lspconfig[server].setup(config)
      end
      -- Emmet setup
      lspconfig.emmet_ls.setup({
        capabilities = capabilities,
        filetypes = {
          "css", "eruby", "html", "javascript", "javascriptreact",
          "less", "sass", "scss", "typescriptreact", "vue",
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
    end,
  },
}
