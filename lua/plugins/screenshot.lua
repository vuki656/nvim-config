-- Name: Silicon
-- Description: Screenshot yanked text
-- Link: https://github.com/narutoxy/silicon.lua

local silicon = require("silicon")

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
------------------------------------ SETUP -----------------------------------------------
------------------------------------------------------------------------------------------

silicon.setup({
    theme = "TwoDark",
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    modes = { "n" },
    key = "<LEADER>ss",
    actions = function()
        silicon.visualise(false, true)
    end,
    description = "Screenshot yanked/copied code",
})
