-- Name: Todo Comments
-- Description: Finder
-- Link: https://github.com/nvim-telescope/telescope.nvim

local todo_comments = require("todo-comments")

local set_keymap = require("utils.set_keymap")

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
