return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
      require("nvim-treesitter.configs").setup({
        -- Install only specific parsers instead of "all"
        ensure_installed = {
          "lua",
          "vim",
          "vimdoc",
          "python",
          "javascript",
          "typescript",
          "bash",
          "json",
          "markdown",
          "markdown_inline",
        },
        -- Auto-install parsers when entering a buffer
        auto_install = true,
        highlight = { 
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
      })
    end,
  },
}
