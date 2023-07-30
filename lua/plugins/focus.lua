-- Name: Zen
-- Description: Distraction free coding
-- Link: https://github.com/folke/zen-mode.nvim

local set_keymap = require("utils.set-keymap")
local zen_mode = require("zen-mode")

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>fm",
            actions = function()
                zen_mode.toggle({
                    window = {
                        width = 0.70,
                    },
                })
            end,
            description = "Toggle zen mode",
        },
    },
})
