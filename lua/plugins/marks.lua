-- Name: Marks
-- Description: Better marks ui and utils
-- Link: https://github.com/chentoast/marks.nvim

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
    list = {
        {
            key = "<LEADER>rma",
            actions = function()
                vim.cmd("delmarks!")
                vim.cmd("wshada!")
            end,
            description = "Delete all marks in the current buffer",
        },
        {
            key = "<LEADER>rml",
            actions = function()
                vim.api.nvim_input("dm-")
            end,
            description = "Delete mark on the current line",
        },
    },
})
