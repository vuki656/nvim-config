-- Name: Debug Print
-- Descriptions: Prints selection/words in a debug statement depending on the language
-- Link: https://github.com/andrewferrier/debugprint.nvim

local debug_print = require("debugprint")

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

debug_print.setup()

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    key = "g?d",
    actions = function()
        vim.cmd("DeleteDebugPrints")
    end,
    description = "Delete debug prints",
})
