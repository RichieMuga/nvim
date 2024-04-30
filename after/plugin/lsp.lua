require("mason").setup()
require("mason-lspconfig").setup {
    auto_install = true
}

-- Keybindings configarations

local lspconfig = require("lspconfig")

-- Bindings for lua
lspconfig.lua_ls.setup({})
lspconfig.tsserver.setup({})


local on_attach = function(client, bufnr)
  -- Enable 'tagfunc' for "go to definition" capabilities
  client.server_capabilities.definitionProvider = true
  vim.lsp.handlers["textDocument/definition"] = vim.lsp.with(
    vim.lsp.handlers.definition, {
      tagfunc = "lsp#tagfunc"
    }
  )

  -- Enable 'omnifunc' for manual omni mode completion
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Enable 'formatexpr' for LSP formatting with 'gq'
  client.server_capabilities.documentFormattingProvider = true
  vim.lsp.handlers["textDocument/formatting"] = vim.lsp.with(
    vim.lsp.handlers.formatting, {
      formatexpr = "lsp#formatexpr()"
    }
  )

  -- Keymaps
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('i', '<C-S>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, bufopts)
  vim.keymap.set('n', ']d', vim.diagnostic.goto_next, bufopts)
  vim.keymap.set('n', '<leader>dl', vim.diagnostic.open_float, bufopts)
end

-- Setup LSP servers with on_attach callback
require('lspconfig').pyright.setup { on_attach = on_attach }
require('lspconfig').tsserver.setup { on_attach = on_attach }
-- TODO: Add more server setups here
