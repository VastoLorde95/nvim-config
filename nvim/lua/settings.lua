-- global = vim.o
-- window = vim.wo
-- buffer = vim.bo

-- Set completopt style to menu. 
vim.o.completeopt = 'menu'

-- Set the delay for vim escape key
vim.o.ttimeoutlen = 5

--ignore case when searching
vim.o.ic = true

--line numbers
vim.o.nu = true
vim.o.rnu = true

-- global status line
vim.o.laststatus = 3

vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.shiftwidth = 4
vim.o.autoindent = true
vim.bo.smartindent = true

-- colorcolumn
vim.wo.colorcolumn = ""
vim.wo.cursorline = true

-- disable diagnostics in the signcolumn
vim.diagnostic.config {
    signs = false,
}

-- Disable mouse mode
vim.o.mouse = ""

-- Open splits on the right.
vim.o.splitright = true

-- Disable swap files
vim.opt.swapfile = false

-- Sync with system clipboard
vim.opt.clipboard = "unnamedplus"

