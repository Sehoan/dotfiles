return {
  {
    'voldikss/vim-floaterm',
    config = function()
      vim.g.floaterm_title = ' $1/$2 '
      vim.g.floaterm_wintype = 'float'
      vim.g.floaterm_width = 0.8
      vim.g.floaterm_height = 0.8
      vim.g.floaterm_borderchars = '─│─│╭╮╯╰'
      vim.g.floaterm_opener = 'vsplit'

      vim.keymap.set('n', '<leader>t', ':FloatermToggle<cr>', { silent = true })
      vim.keymap.set('t', '<leader>t', '<c-\\><c-n>:FloatermToggle<cr>', { silent = true })
      vim.keymap.set('t', '<leader>d', '<c-\\><c-n>:FloatermKill<cr>', { silent = true })
      vim.keymap.set('t', '<leader><leader>', '<c-\\><c-n>', { silent = true })
    end
  },
}
