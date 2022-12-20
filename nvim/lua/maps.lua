local map = vim.api.nvim_set_keymap

-- Remap leader to space
--vim.g.mapleader = "<Space>"
vim.g.mapleader = " "

local options = { noremap = true }

-- split navigation
map('n', '<C-J>', '<C-W><C-J>', options)
map('n', '<C-K>', '<C-W><C-K>', options)
map('n', '<C-L>', '<C-W><C-L>', options)
map('n', '<C-H>', '<C-W><C-H>', options)

-- tab creation
map('n', '<Leader>t', ':tabe<CR>', options)
map('n', '<Leader>w', ':tabc<CR>', options)

-- jump to search AND center the screen
map('n', 'n', 'nzz', options)
map('n', 'N', 'Nzz', options)

--remove highlights
map('n', '<C-n>', ':nohlsearch<CR>', options)
