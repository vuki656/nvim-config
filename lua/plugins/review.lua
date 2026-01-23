-- Name: Review
-- Description: Code review tool for Neovim
-- Link: https://github.com/georgeguimaraes/review.nvim

local review = require("review")
local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

review.setup()

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

print("Review.nvim loaded")

-- TODO: think of better keymaps
set_keymap({
    list = {
        {
            key = "<LEADER>t9",
            description = "Review open/close",
            actions = function()
                vim.cmd("Review")
            end,
        },
        {
            key = "<LEADER>t0",
            actions = function()
                vim.cmd("Review close")
            end,
            description = "Review close",
        },
    },
})
