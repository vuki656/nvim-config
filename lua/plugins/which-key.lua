-- Name: Which Key
-- Description: Displays pending keybinds in popup
-- Link: https://github.com/folke/which-key.nvim

local which_key = require("which-key")

local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

which_key.setup({
    delay = 300,
    icons = {
        mappings = false,
        keys = {},
    },
    win = {
        border = "rounded",
    },
    spec = {
        { "<leader>p", group = "Project" },
        { "<leader>l", group = "Language" },
        { "<leader>h", group = "Hunk" },
        { "<leader>m", group = "Mark" },
        { "<leader>i", group = "Inspect" },
        { "<leader>o", group = "Open" },
        { "<leader>u", group = "Utility" },
        { "<leader>k", group = "Kill" },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({
    list = {
        { group = "WhichKey", foreground = colors.blue },
        { group = "WhichKeyGroup", foreground = colors.purple },
        { group = "WhichKeyDesc", foreground = colors.white },
        { group = "WhichKeySeparator", foreground = colors.grey },
        { group = "WhichKeyNormal", background = colors.background },
        { group = "WhichKeyBorder", foreground = colors.grey },
        { group = "WhichKeyTitle", foreground = colors.orange },
        { group = "WhichKeyValue", foreground = colors.green },
    },
})
