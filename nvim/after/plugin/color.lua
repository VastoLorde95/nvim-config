--vim.cmd[[colorscheme tokyonight]]
--vim.cmd[[colorscheme tokyonight-storm]]


--require('onedark').setup {
    ----style = 'darker'
    --style = 'deep'
--}
--require('onedark').load()

require("cyberdream").setup({
    transparent = true,
})
vim.cmd("colorscheme cyberdream")

--vim.cmd[[colorscheme ronny]]

--require("ronny").setup({
    --display = {
        ---- Enable original Monokai colors
        --monokai_original  = false,
        ---- Highlight only LineNr (current line number) for cursorline
        ---- option. This also enables cursorline (:set cursorline)
        --only_CursorLineNr = false,
        ---- Highlight LineNr for relativenumbers. This also enables
        ---- relativenumbers option (:set relativenumbers)
        --hi_relativenumber = true,
        ---- Highlight unfocused windows when using :split or :vsplit
        --hi_unfocus_window = false,
        ---- Highlight formatted @text (e.g., italic, strong) in yellow
        ---- in addition to font attributes to make the text more visible
        --hi_formatted_text = true,
        ---- Highlight comment in italics
        --hi_comment_italic = true
    --}
--})
