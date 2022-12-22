-- All telescope mappings start with <Leader>f
-- 'f' stands for fuzzy
--
-- Run :Telescope builtin to list all builtins and their documentation

local builtin = require('telescope.builtin')

-- Vim pickers

-- find files
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})

-- find grep. Will respect .gitignore
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

-- find buffer 
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

-- find help
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

-- TODO(apaliwal): Implement fuzzy search for any pattern within the current buffer 
-- and jump to that location on <cr>

-- LSP related keymappings
-- find references
vim.keymap.set('n', '<leader>fr', builtin.lsp_references, {})

-- find definitions
vim.keymap.set('n', '<leader>fd', builtin.lsp_definitions, {})

-- find errors
vim.keymap.set('n', '<leader>fe', builtin.diagnostics, {})
