print("Hello from mydashboard.lua")

local my_dashboard = {
[[                     ,   ,                                 ]],
[[                     $,  $,     ,                          ]],
[[                     "ss.$ss. .s'                          ]],
[[             ,     .ss$$$$$$$$$$s,                         ]],
[[             $. s$$$$$$$$$$$$$$`$$Ss                       ]],
[[             "$$$$$$$$$$$$$$$$$$o$$$       ,               ]],
[[            s$$$$$$$$$$$$$$$$$$$$$$$$s,  ,s                ]],
[[           s$$$$$$$$$"$$$$$$""""$$$$$$"$$$$$,              ]],
[[           s$$$$$$$$$$s""$$$$ssssss"$$$$$$$$"              ]],
[[          s$$$$$$$$$$'         `"""ss"$"$s""               ]],
[[          s$$$$$$$$$$,              `"""""$  .s$$s         ]],
[[          s$$$$$$$$$$$$s,...               `s$$'  `        ]],
[[      `ssss$$$$$$$$$$$$$$$$$$$$####s.     .$$"$.   , s-    ]],
[[        `""""$$$$$$$$$$$$$$$$$$$$#####$$$$$$"     $.$'     ]],
[[              "$$$$$$$$$$$$$$$$$$$$$####s""     .$$$|      ]],
[[               "$$$$$$$$$$$$$$$$$$$$$$$$##s    .$$" $      ]],
[[                $$""$$$$$$$$$$$$$$$$$$$$$$$$$$$$$"   `     ]],
[[               $$"  "$"$$$$$$$$$$$$$$$$$$$$S""""'          ]],
[[          ,   ,"     '  $$$$$$$$$$$$$$$$####s              ]],
}

local function should_create_dashboard()
    -- don't start when opening a file
    if vim.fn.argc() > 0 then return false end

    -- skip stdin
    if vim.fn.line2byte("$") ~= -1 then return false end

    -- Handle nvim -M
    if not vim.o.modifiable then return false end

    for _, arg in pairs(vim.v.argv) do
        -- whitelisted arguments
        -- always open
        if arg == "--startuptime"
        then return true
        end

        -- blacklisted arguments
        -- always skip
        if arg == "-b"
            -- commands, typically used for scripting
            or arg == "-c" or vim.startswith(arg, "+")
            or arg == "-S"
        then return false
        end
    end

    -- base case: don't skip
    return true
end


local function create_my_dashboard()
    if not should_create_dashboard() then
        return
    end

    print("Creating my dashboard.")
    local buffer = vim.api.nvim_get_current_buf()

    vim.api.nvim_buf_set_lines(buffer, 0, -1, false, my_dashboard)

end


local group_id = vim.api.nvim_create_augroup("mydashboard", { clear = true })
vim.api.nvim_create_autocmd("VimEnter", {
    group=group_id,
    pattern = "*",
    nested = true,
    callback =  create_my_dashboard,
})
