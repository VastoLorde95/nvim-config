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

    -- Mappings.
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
    -- TODO(apaliwal): Consider remapping <CTRL>-] to go to definition too?
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)

    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, bufopts)
    vim.keymap.set('n', '<Leader>ca', vim.lsp.buf.code_action, bufopts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
    vim.keymap.set('n', '<Leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)

    -- I don't know what these do yet
    -- vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, bufopts)
    -- vim.keymap.set('n', '<Leader>k', vim.lsp.buf.signature_help, bufopts)
    -- vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
    -- vim.keymap.set('n', '<Leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<Leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    -- vim.keymap.set('n', '<Leader>wl', function()
    --      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    -- end, bufopts)
end


require('lspconfig').pyright.setup {
    on_attach = on_attach,
}

require('lspconfig').sumneko_lua.setup {
    on_attach = on_attach,
}
