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

-- fuzzy search within current buffer
vim.keymap.set('n', '<leader>fp', builtin.current_buffer_fuzzy_find, options)

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


local header_switcher = function(buffer_name)
    local actions = require "telescope.actions"
    local actions_state = require "telescope.actions.state"
    local pickers = require "telescope.pickers"
    local finders = require "telescope.finders"
    local sorters = require "telescope.sorters"
    local dropdown = require "telescope.themes".get_dropdown()

    function enter(prompt_bufnr)
        actions.close(prompt_bufnr)
    end

    --function next_pick(prompt_bufnr)
    --    actions.move_selection_next(prompt_bufnr)
    --    local selected = actions_state.get_selected_entry()
    --end

    --function prev_pick(prompt_bufnr)
    --    actions.move_selection_previous(prompt_bufnr)
    --    local selected = actions_state.get_selected_entry()
    --end

    -- last . in the buffer name
    local index = string.find(buffer_name, ".[^.]*$")
    local res = vim.fn.system("ls " .. string.sub(buffer_name, 1, index) .. "*")

    local finder_table = {}
    local finder_table_idx = 1

    for w in string.gmatch(res, "[^\r\n]+") do
        print(finder_table_idx, w)
        finder_table[finder_table_idx] = w
        finder_table_idx  = finder_table_idx + 1
    end

    local opts = {
        finder = finders.new_table ({unpack(finder_table)}),
        sorter = sorters.get_generic_fuzzy_sorter({}),
        attach_mappings = function(prompt_bufnr, map)
            map("i", "<CR>", enter)
            map("i", "<C-j>", next_pick)
            map("i", "<C-k>", prev_pick)
            return true
        end,
    }

    local picks = pickers.new(dropdown, opts)

    picks:find()
end

-- Use to switch to cycle through header and implementation in c++
vim.keymap.set('n', '<leader>fc', function() header_switcher(vim.api.nvim_buf_get_name(0)) end, options)
