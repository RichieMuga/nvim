return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- optional, but recommended for icons
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional: uncomment if you want image support in the preview window
  },
  config = function()
    -- Key mappings for neo-tree
    vim.keymap.set("n", "<C-n>", ":Neotree toggle<CR>", { silent = true, noremap = true })
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", { silent = true, noremap = true })
    vim.keymap.set("n", "<C-l>", ":Neotree filesystem reveal left<CR>", { silent = true, noremap = true })

    -- Additional options for neo-tree if required
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = true, -- This option follows the current file in the tree
        hijack_netrw_behavior = "open_default", -- Replaces netrw with neo-tree
      },
    })
  end,
}
