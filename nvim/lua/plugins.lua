-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself --
    use 'wbthomason/packer.nvim'

    -- Plenary --
    use 'nvim-lua/plenary.nvim'

    -- Colorschmes --
    -- sonokai colorscheme. --
    --use 'sainnhe/sonokai'
    use 'folke/tokyonight.nvim'
    use 'navarasu/onedark.nvim'
    use { "scottmckendry/cyberdream.nvim" }
    use 'judaew/ronny.nvim'

    -- Indentation
    use 'lukas-reineke/indent-blankline.nvim'

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
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-context'

    -- Telescope --
    use { 'nvim-telescope/telescope.nvim', tag = '0.1.8', }
    use { 'nvim-telescope/telescope-fzy-native.nvim' , run = 'make' }

    -- Diffview.nvim
    use 'sindrets/diffview.nvim'

    -- Git signs
    use 'lewis6991/gitsigns.nvim'

    -- nerdcommenter
    use 'preservim/nerdcommenter'

    --use 'xiyaowong/transparent.nvim'

    -- Tmux and Nvim integration
    use { 'alexghergh/nvim-tmux-navigation', config = function()

        local nvim_tmux_nav = require('nvim-tmux-navigation')

        nvim_tmux_nav.setup {
            disable_when_zoomed = true -- defaults to false
        }

        vim.keymap.set('n', "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
        vim.keymap.set('n', "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
        vim.keymap.set('n', "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
        vim.keymap.set('n', "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)

    end

}

end)
