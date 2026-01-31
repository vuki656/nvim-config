-- Name: Close Buffers
-- Description: Kill inactive buffers
-- Link: https://github.com/kazhala/close-buffers.nvim

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
    key = "<LEADER>kb",
    actions = function()
        close_buffers.delete({ type = "hidden" })
    end,
    description = "[BufClose] Kill all inactive buffers",
})
