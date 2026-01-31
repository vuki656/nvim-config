-- Name: Todo Comments
-- Description: todo/other comment finder/highlighter
-- Link: https://github.com/folke/todo-comments.nvim

local todo_comments = require("todo-comments")

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

todo_comments.setup({
    signs = false,
    merge_keywords = false,
    keywords = {
        FIXME = {
            icon = "",
            color = "error",
        },
        TODO = {
            color = "info",
            icon = "",
        },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>pt",
    actions = function()
        vim.cmd("TodoTelescope")
    end,
    description = "[Telescope] Find TODOs in project",
})
