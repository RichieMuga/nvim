return {
  'mbbill/undotree',
  config = function()
    vim.g.undotree_WindowLayout = 1
    vim.keymap.set('n', '<leader>u', ':UndotreeToggle<CR>')
  end
}
