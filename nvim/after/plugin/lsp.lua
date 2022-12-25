-- Setup the neovim core LSP client for various language servers using nvim-lspconfig.
--
-- For more info, see:
-- :h lspconfig

-- See `:help vim.diagnostic.*` for documentation on any of the functions below

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts = { noremap = true, silent = true }
    vim.keymap.set('n', '<Leader>e', vim.diagnostic.open_float, opts)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
    vim.keymap.set('n', '<Leader>q', vim.diagnostic.setloclist, opts)


    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    -- An LSP is smart enough to distinguish between a defintion and a declaration,
    -- whether it is global or local. So we can remap gD from jumping to "local"
    -- declaration, to instead go to a defintion.
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<C-]>', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)

    -- I don't have a good use case for these yet.
    -- vim.keymap.set('n', '<Leader>k', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    -- vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<Leader>wl', function()
    --      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, bufopts)
end

-- Add additional capabilities supported by nvim-cmp
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require('lspconfig').pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
}

require('lspconfig').sumneko_lua.setup {
    settings = {
        Lua = {
            diagnostics = {
                globals = {'vim'},
            },
        },
    },
    on_attach = on_attach,
    capabilities = capabilities,
}

-- nvim-cmp setup

local get_bufnrs = function()
    -- Don't use buffers with size > 10 MB for autocompletion
    local buf_list = vim.api.nvim_list_bufs()
    local result = {}
    for _, buf in ipairs(buf_list) do
        local byte_size = vim.api.nvim_buf_get_offset(
            buf, vim.api.nvim_buf_line_count(buf))
        if byte_size < 10 * 1024 * 1024 then
            table.insert(result, buf)
        end
    end
    return result
end


-- `:h nvim-cmp`
local cmp = require 'cmp'
cmp.setup {
    -- Uncomment if you want to autocomplete to be triggered only manually.
    --completion = {
    --    autocomplete = false,
    --},
    mapping = cmp.mapping.preset.insert({
        -- Invoke completion
        -- TODO(apaliwal): Should we map C-n and C-p to this too?
        ['<C-Space>'] = cmp.mapping.complete(),
        -- Confirm selection
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
        -- Select next and previous items
        ['<Tab>'] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_next_item()
                else
                    fallback()
                end
            end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(
            function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                else
                    fallback()
                end
            end, { 'i', 's' }),
        -- Scroll through docuemntation if visible.
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
    }),

    sources = {
        { name = 'nvim_lsp' },
        { name = 'nvim_lua', },
        -- { name = 'treesitter' },
        -- TODO(apaliwal): If LSP and treesitter fail to deliever, might make sense to 
        -- use good 'ol ctrl-p and ctrl-n?  Or is the philosohpy that we won't use them
        -- anymore?
        {
            name = 'buffer' ,
            option = {
                get_bufnrs = get_bufnrs,
            }
        },
    },
}

---- Enable autocomplete for the / and : modes
---- `/` cmdline setup.
--cmp.setup.cmdline('/', {
--    mapping = cmp.mapping.preset.cmdline(),
--    sources = {
--        {
--            name = 'buffer',
--            option = {
--                get_bufnrs = get_bufnrs,
--            }
--        }
--    }
--})
--
---- `:` cmdline setup.
--cmp.setup.cmdline(':', {
--    mapping = cmp.mapping.preset.cmdline(),
--    sources = cmp.config.sources(
--        {
--            { name = 'path' }
--        },
--        {
--            {
--                name = 'cmdline',
--                option = {
--                    ignore_cmds = { 'Man', '!' }
--                }
--            }
--        }
--    )
--})
