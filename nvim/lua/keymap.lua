vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

vim.keymap.set('n', '<leader>q', ':q<cr>', { silent = true })
vim.keymap.set('n', '<leader>fq', ':q!<cr>', { silent = true })
vim.keymap.set('n', '<leader>w', ':w<cr>', { silent = true })
vim.keymap.set('n', '<leader>wa', ':wa<cr>', { silent = true })

vim.keymap.set('n', '<c-h>', '<c-w>h', { silent = true })
vim.keymap.set('n', '<c-j>', '<c-w>j', { silent = true })
vim.keymap.set('n', '<c-k>', '<c-w>k', { silent = true })
vim.keymap.set('n', '<c-l>', '<c-w>l', { silent = true })

vim.keymap.set('n', 'gH', '<c-w>H', { silent = true })
vim.keymap.set('n', 'gJ', '<c-w>J', { silent = true })
vim.keymap.set('n', 'gK', '<c-w>K', { silent = true })
vim.keymap.set('n', 'gL', '<c-w>L', { silent = true })

vim.keymap.set('n', '<space>j', '<c-^>zz', { silent = true })

vim.keymap.set('n', 'q', '<nop>', { silent = true })

vim.keymap.set('n', '<up>', '<c-y>', { silent = true })
vim.keymap.set('n', '<down>', '<c-e>', { silent = true })

vim.keymap.set({ 'n', 'v' }, 'mm', '%', { silent = true })

vim.keymap.set({ 'n', 'v' }, 'H', '^', { silent = true })
vim.keymap.set({ 'n', 'v' }, 'L', '$', { silent = true })

vim.keymap.set('n', 'n', 'nzz', { silent = true })
vim.keymap.set('n', 'N', 'Nzz', { silent = true })

vim.keymap.set('n', '<space>l', ':%s/\\<<C-r><C-w>\\>//gc<Left><Left><Left>')

vim.keymap.set('n', '<space>h', ':noh<cr>')

vim.keymap.set('n', '<space>p', '"0p')
