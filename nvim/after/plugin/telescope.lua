-- All telescope mappings start with <Leader>f
-- 'f' stands for fuzzy
--
-- Run :Telescope builtin to list all builtins and their documentation

local builtin = require('telescope.builtin')
local options = { noremap = true }

-- Vim pickers

-- find files
vim.keymap.set('n', '<leader>ff', builtin.find_files, options)

-- find grep. Will respect .gitignore
vim.keymap.set('n', '<leader>fg', builtin.live_grep, options)

-- find buffer 
vim.keymap.set('n', '<leader>fb', builtin.buffers, options)

-- find help
vim.keymap.set('n', '<leader>fh', builtin.help_tags, options)

-- TODO(apaliwal): Implement fuzzy search for any pattern within the current buffer 
-- and jump to that location on <cr>

-- LSP related keymappings
-- find references
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, options)

-- find definitions
vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, options)

-- find errors
vim.keymap.set('n', '<leader>fe', builtin.diagnostics, options)

-- Treesitter related keymappings
-- find treesitter - search for function names and variables through treesitter
vim.keymap.set('n', '<leader>ft', builtin.treesitter, options)
