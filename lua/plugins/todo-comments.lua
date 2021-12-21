-- Name: Todo Comments
-- Description: todo/other comment finder/highlighter
-- Link: https://github.com/nvim-telescope/telescope.nvim

local todo_comments = require("todo-comments")

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

todo_comments.setup({ signs = false })

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>pt",
    actions = "<CMD>TodoTelescope<CR>",
    description = "Open TODOs in telescope picker",
})
