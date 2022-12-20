-- Configure nvim-treesitter modules.
-- See :h nvim-treesitter-modules for a list of available modules
require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "c", "cpp", "lua", "python", },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = false,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  -- `false` will disable the whole extension
  indent = { enable = true },
  highlight = { enable = true },
  -- Select scopes based on which node you are on as per the tree sitter, expand this
  -- scope by going up to the parent or going down into the child
  incremental_selection = {
      enable = true,
      keymaps = {
          init_selection = '<CR>',
          scope_incremental = '<CR>',
          node_incremental = '<TAB>',
          node_decremental = '<S-TAB>',
      },
  },
}

-- TODO(apaliwal): Need to experiment with this a bit more before I get it working.
-- vim.wo.foldmethod = "expr"
-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
