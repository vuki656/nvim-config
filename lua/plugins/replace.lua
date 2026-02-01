-- Name: Grug Far
-- Description: Global search and replace
-- Link: https://github.com/MagicDuck/grug-far.nvim

local grug_far = require("grug-far")
local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
------------------------------------ SETUP -----------------------------------------------
------------------------------------------------------------------------------------------

grug_far.setup({
    windowCreationCommand = "split",
})

--------------------------------------------------------------------------------------------
------------------------------------- KEYMAPS ----------------------------------------------
--------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>pw",
    actions = function()
        grug_far.open()
    end,
    description = "[Grug Far] Project-wide search and replace",
})
