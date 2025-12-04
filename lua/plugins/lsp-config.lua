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
        "intelephense"
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      
      -- Configure each LSP separately using vim.lsp.config
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
        gopls = {
          cmd = { "gopls" },
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
            },
          },
        },
        cssls = {},
        tailwindcss = {},
        dockerls = { 
          filetypes = { "dockerfile", "Dockerfile" } 
        },
        sqlls = {},
        intelephense = {
          settings = {
            intelephense = {
              environment = {
                includePaths = { "vendor" },
              },
              files = {
                maxSize = 1000000,
              },
            },
          },
        },
      }
      
      -- Setup all servers
      for server, config in pairs(servers) do
        config.capabilities = capabilities
        vim.lsp.enable(server)
        
        -- Apply server-specific config
        if next(config) then
          vim.lsp.config[server] = config
        end
      end
      
      -- Emmet setup
      vim.lsp.enable('emmet_ls')
      vim.lsp.config.emmet_ls = {
        capabilities = capabilities,
        filetypes = {
          "css", "eruby", "html", "javascript", "javascriptreact",
          "less", "sass", "scss", "typescriptreact", "vue",
        },
        init_options = {
          html = { options = { ["output.selfClosingStyle"] = "xhtml" } },
        },
      }
      
      -- Keybindings for LSP
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
