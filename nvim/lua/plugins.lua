-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself --
    use 'wbthomason/packer.nvim'

    -- Plenary --
    use 'nvim-lua/plenary.nvim'

    -- sonokai colorscheme. --
    use 'sainnhe/sonokai'

    -- Statusline --
    use { 'nvim-lualine/lualine.nvim' }

    -- LSP --
    -- mason installs lsp
    use 'williamboman/mason.nvim'
    -- nvim-lspconfig provides default configurations for popular language servers.
    use 'neovim/nvim-lspconfig'

    -- Auto-completion  --
    -- nvim-cmp is an engine for autocompletion that will pull in suggestions from
    -- external sources
    use 'hrsh7th/nvim-cmp'
    -- Plugins for nvim-cmp sources
    -- See https://github.com/hrsh7th/nvim-cmp/wiki/List-of-sources
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lua'

    -- Treesitter --
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- Telescope --
    use {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.0',
    }

    -- Diffview.nvim
    use { 'sindrets/diffview.nvim' }

    -- Git signs
    use { 'lewis6991/gitsigns.nvim', }
end)
