-- Name: Review
-- Description: Code review tool
-- Link: https://github.com/vuki656/review.nvim

local review = require("review")
local quick_comments = require("review.quick_comments")

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

review.setup()

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>ov",
            actions = review.toggle,
            description = "[Review] Toggle review panel",
        },
        {
            key = "<LEADER>oq",
            actions = quick_comments.toggle_panel,
            description = "[Review] Toggle comment panel",
        },
        {
            key = "<LEADER>lc",
            actions = quick_comments.add,
            description = "[Review] Add quick comment",
        },
    },
})
