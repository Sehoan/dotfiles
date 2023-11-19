-- [[ Setting options ]]
-- See `:help vim.o`
vim.opt.wrap = false
vim.opt.hidden = true
vim.opt.cursorline = true
vim.opt.encoding = 'utf-8'
vim.opt.pumheight = 10
vim.opt.ruler = true
vim.opt.cmdheight = 1
vim.opt.iskeyword:append("-")
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2
vim.opt.smarttab = true
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.number = true
vim.opt.background = 'dark'
vim.opt.scrolloff = 8
vim.opt.showmode = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.updatetime = 250
vim.opt.timeout = true
vim.opt.timeoutlen = 500
vim.opt.formatoptions:remove('cro')
vim.opt.laststatus = 2
vim.opt.mouse = 'a'
vim.opt.hlsearch = true
vim.opt.conceallevel = 0
vim.opt.showtabline = 0
vim.opt.signcolumn = 'yes'
vim.opt.termguicolors = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = 'menu,menuone,noinsert'
vim.opt.fixendofline = false
vim.opt.colorcolumn = "80"

-- Autocommands
vim.cmd([[
  autocmd BufWritePre * :%s/\s\+$//e
  autocmd VimResized * wincmd =
  autocmd! BufWinLeave * let b:winview = winsaveview()
  autocmd! BufWinEnter * if exists('b:winview') | call winrestview(b:winview) | unlet b:winview
]])

local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true }) -- highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
