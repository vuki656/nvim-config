-- Name: Marks
-- Description: Better marks ui and utils
-- Link: https://github.com/chentau/marks.nvim

local marks = require("marks")

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

marks.setup({})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>rm",
    actions = function()
        vim.cmd("delmarks!")
        vim.cmd("wshada!")
    end,
    description = "Delete all marks in the current buffer",
})
