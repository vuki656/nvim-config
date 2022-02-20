-- Name: Scrollbar
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
        "docker-term",
        "git-term",
        "TelescopePrompt",
        "",
    },
    handle = {
        color = colors.background_light,
    },
    marks = {
        Error = { text = { "▀" }, color = colors.red },
        Warn = { text = { "▀" }, color = colors.orange },
        Info = { text = { "▀" }, color = colors.blue },
        Hint = { text = { "▀" }, color = colors.yellow },
        Misc = { text = { "▀" }, color = colors.green },
    },
})
