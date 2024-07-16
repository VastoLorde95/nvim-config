-- Configure nvim-treesitter modules.
-- See :h nvim-treesitter-modules for a list of available modules
require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "c", "cpp", "lua", "python", "bash", "rust", "cuda", "proto", "html", "javascript", "css", "helm", "yaml" },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = true,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = false,

    indent = {
        enable = true,
    },

    highlight = { enable = true , additional_vim_regex_highlighting = false },
}
