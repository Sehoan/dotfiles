return {
  'ggandor/lightspeed.nvim',
  config = function()
    require 'lightspeed'.setup {
      ignore_case = true,
    }
    -- vim.cmd [[ hi LightspeedLabel guifg=#fb4934]]
    -- vim.cmd [[ hi LightspeedShortcut guifg=#fb4934 guibg=#282828]]
  end
}
