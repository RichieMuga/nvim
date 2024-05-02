-- Import packer.nvim
return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- LSP and Completion
  use {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup()
    end
  }

  use {
    'williamboman/mason-lspconfig.nvim',
    config = function()
      require('mason-lspconfig').setup()
    end
  }

  use {
    'neovim/nvim-lspconfig',
    config = function()
      local nvim_lsp = require('lspconfig')
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Configure TypeScript Language Server
      nvim_lsp.tsserver.setup {
        capabilities = capabilities,
        on_attach = function(client, bufnr)
          -- Enable completion triggered by <c-x><c-o>
          vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

          -- Use the client in the on_attach function
          client.server_capabilities.definitionProvider = true
          client.server_capabilities.documentFormattingProvider = true
        end
      }

      -- Set up nvim-cmp
      local cmp = require('cmp')
      cmp.setup {
        sources = {
          { name = 'nvim_lsp' },
          { name = 'buffer' },
        },
        mapping = {
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.close(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        },
      }

      -- Set global keymaps for LSP
      vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { buffer = true })
      vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = true })
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = true })
      vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { buffer = true })
      vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { buffer = true })
    end
  }

  -- Autocompletion and snippets
  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',
      'rafamadriz/friendly-snippets'
    }
  }
end)
