return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",  -- Ensures parsers are updated automatically
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        -- Install parsers you need; add more languages if required
        ensure_installed = { "lua", "dockerfile" },  -- Added "lua" to ensure the Lua parser is installed
        -- Automatically install missing parsers when entering buffer
        auto_install = true,
        -- Enable Treesitter-based syntax highlighting
        highlight = {
          enable = true,  -- Enable for all supported languages
          disable = {},   -- You can list languages to disable here if needed
        },
        -- Enable indentation support where applicable
        indent = { enable = true },
      })
    end
  }
}

