return {
  {
    'ldelossa/vimdark',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme 'vimdark'
      vim.api.nvim_set_hl(0, "ColorColumn", { ctermbg=0, bg='#262626' })
    end
  }
}
