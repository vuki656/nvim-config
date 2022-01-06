-- Name: Close Buffers
-- Description: Kill inactive buffers
-- Link: https://github.com/numToStr/Comment.nvim

local close_buffers = require("close_buffers")

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

close_buffers.setup({
    filetype_ignore = { "NvimTree" },
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>ki",
    actions = function()
        close_buffers.delete({ type = "hidden" })
    end,
    description = "Delete/kill all inactive buffers",
})
