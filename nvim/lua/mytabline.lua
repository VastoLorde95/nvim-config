-- Written with reference to  
-- https://github.com/crispgm/nvim-tabline 
-- `:h tabpage`
-- `:h tabline`
-- `:h setting-tabline`


local function get_tab_label(tab_index)
    -- Returns the label for a tab index:
    -- {Tab Index} {Buffer Name} {+ if is modified}
    local tab_label = "%" .. tab_index .. "T"

    local buflist = vim.fn.tabpagebuflist(tab_index)
    local bufnr = buflist[vim.fn.tabpagewinnr(tab_index)]
    local bufname = vim.fn.bufname(bufnr)

    -- Use the highlight group TabLineSel for the currently selected tab.
    if tab_index == vim.fn.tabpagenr() then
        tab_label = tab_label .. "%#TabLineSel#"
    else
        tab_label = tab_label .. "%#TabLine#"
    end

    -- tab index
    tab_label = tab_label .. " " .. tab_index .. " "

    -- buffer name
    if bufname ~= "" then
        tab_label = tab_label .. " " .. vim.fn.fnamemodify(bufname, ":t") .. " "
    else
        tab_label = tab_label .. "[No Name]" .. " "
    end

    -- modified indicator
    if vim.fn. getbufvar(bufnr, "&mod") == 1 then
        tab_label = tab_label .. "[+]" .. " "
    end

    return tab_label
end


local function get_closing_label()
    -- Returns the label for the end of the tabline
    -- {Full path of the current buffer}
    return  "%#TabLineFill#" .. "%=%#TabLine#%999X%f%X"
end


local function get_my_tabline_string()
    local tabline_str = ""
    for index = 1, vim.fn.tabpagenr("$") do
        tabline_str = tabline_str .. get_tab_label(index)
    end
    tabline_str = tabline_str .. get_closing_label()
    return tabline_str
end


function _G.my_tabline()
    return get_my_tabline_string()
end


vim.o.tabline = "%!v:lua.my_tabline()"
vim.o.showtabline = 2
