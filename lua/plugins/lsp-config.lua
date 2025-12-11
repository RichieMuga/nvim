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
      
      -- Define server configurations
      local servers = {
        ts_ls = {
          capabilities = capabilities,
        },
        pyright = {
          capabilities = capabilities,
          settings = {
            python = {
              analysis = { typeCheckingMode = "basic" },
            },
          },
        },
        lua_ls = {
          capabilities = capabilities,
        },
        gopls = {
          capabilities = capabilities,
          cmd = { "gopls" },
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          root_dir = vim.fs.dirname(vim.fs.find({ "go.mod", "go.work", ".git" }, { upward = true })[1]),
          settings = {
            gopls = {
              analyses = {
                unusedparams = true,
              },
              staticcheck = true,
            },
          },
        },
        cssls = {
          capabilities = capabilities,
        },
        tailwindcss = {
          capabilities = capabilities,
        },
        dockerls = {
          capabilities = capabilities,
          filetypes = { "Dockerfile", "docker-compose" },
        },
        sqlls = {
          capabilities = capabilities,
        },
        intelephense = {
          capabilities = capabilities,
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
        emmet_ls = {
          capabilities = capabilities,
          filetypes = {
            "css", "eruby", "html", "javascript", "javascriptreact",
            "less", "sass", "scss", "typescriptreact", "vue",
          },
          init_options = {
            html = { options = { ["output.selfClosingStyle"] = "xhtml" } },
          },
        },
      }
      
      -- Setup all servers using the new API
      for server_name, config in pairs(servers) do
        vim.lsp.config[server_name] = config
        vim.lsp.enable(server_name)
      end
      
      -- Keybindings for LSP
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
