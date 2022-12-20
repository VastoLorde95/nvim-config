-- global, window and buffer options	
local o = vim.o
local wo = vim.wo
local bo = vim.bo


-- Set completopt style to menu. 
-- If you use the default, for some reason omnifunc completion will open a split pane 
-- everytime you use it.
o.completeopt = 'menu'

o.background = 'dark'

-- Set the delay for vim escape key
o.ttimeoutlen = 5

-- Search through subdirs
-- o.path += **

--ignore case when searching
o.ic = true

--line numbers
o.nu = true
o.rnu = true

-- status line
o.laststatus = 2

o.expandtab = true
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.autoindent = true

-- colorcolumn
wo.colorcolumn = "88"
