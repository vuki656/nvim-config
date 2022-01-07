-- Name: Scrolbar
-- Description: Scrollbar with diagnostics
-- Link: https://github.com/petertriho/nvim-scrollbar

local scrollbar = require("scrollbar")

local colors = require("utils.colors")

------------------------------------------------------------------------------------------
----------------------------------- CONFIG -----------------------------------------------
------------------------------------------------------------------------------------------

scrollbar.setup({
    excluded_filetypes = {
        "NvimTree",
        "alpha",
    },
    handle = {
        color = colors.background_light,
    },
    marks = {
        Error = { color = colors.red },
        Warn = { color = colors.orange },
        Info = { color = colors.blue },
        Hint = { color = colors.yellow },
        Misc = { color = colors.green },
    },
})
