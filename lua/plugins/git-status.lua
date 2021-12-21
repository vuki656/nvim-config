-- Name: Git Signs
-- Description: Git line status in sidebar
-- Link: https://github.com/lewis6991/gitsigns.nvim

local git_signs = require("gitsigns")

local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

git_signs.setup({
    signs = {
        add = {
            hl = "GitSignsAdd",
            text = "█",
            numhl = "GitSignsAddNr",
            linehl = "GitSignsAddLn",
        },
        change = {
            hl = "GitSignsChange",
            text = "█",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
        },
        delete = {
            hl = "GitSignsDelete",
            text = "█",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
        },
        topdelete = {
            hl = "GitSignsDelete",
            text = "█",
            numhl = "GitSignsDeleteNr",
            linehl = "GitSignsDeleteLn",
        },
        changedelete = {
            hl = "GitSignsChange",
            text = "█",
            numhl = "GitSignsChangeNr",
            linehl = "GitSignsChangeLn",
        },
    },
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = "eol",
        delay = 300,
    },
})

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({
    list = {
        { group = "GitSignsAdd", foreground = colors.green },
        { group = "GitSignsChange", foreground = colors.orange },
        { group = "GitSignsDelete", foreground = colors.red },
        {
            group = "GitSignsCurrentLineBlame",
            foreground = colors.grey,
            background = colors.grey_lighter,
        },
    },
})
