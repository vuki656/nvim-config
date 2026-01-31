-- Name: Split Join
-- Description: Allows splitting or joining line with args
-- Link: https://github.com/nvim-mini/mini.splitjoin

local split_join = require("mini.splitjoin")

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- CONFIG -----------------------------------------------
------------------------------------------------------------------------------------------

split_join.setup()

--------------------------------------------------------------------------------------------
------------------------------------- KEYMAPS ----------------------------------------------
--------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>lt",
    actions = function()
        split_join.toggle()
    end,
    description = "[SplitJoin] Toggle args single/multi line",
})
