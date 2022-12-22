-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- tokyonight colorscheme.
  use 'folke/tokyonight.nvim'

  -- LSP config
  use 'neovim/nvim-lspconfig'
  -- LSP installer
  use 'williamboman/mason.nvim'

  -- Statusline
  --use {'nvim-lualine/lualine.nvim'}

  -- Treesitter
  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }

end)
