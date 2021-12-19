-- Name: Comment
-- Description: Commenting plugin
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
    actions = "<CMD>lua require('close_buffers').delete({ type = 'hidden' })<CR>",
    description = "Delete/kill all inactive buffers",
})
