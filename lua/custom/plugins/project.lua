return {
  'ahmedkhalf/project.nvim',
  config = function()
    require('project_nvim').setup {}
  end,
  vim.keymap.set('n', '<leader>sp', function()
    require('telescope').extensions.projects.projects {}
  end, { desc = '[S]earch [P]rojects' }),
}
