-- Name: Neoscroll
-- Description: Smooth scrolling for Neovim
-- Link: https://github.com/karb94/neoscroll.nvim

local neoscroll = require("neoscroll")

------------------------------------------------------------------------------------------
----------------------------------- CONFIG -----------------------------------------------
------------------------------------------------------------------------------------------

neoscroll.setup({
    duration_multiplier = 0.3,
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

local SCROLL_LINES = 15

local setKeymap = require("utils.set-keymap")

setKeymap({
    list = {
        {
            key = "<C-u>",
            actions = function()
                neoscroll.scroll(-SCROLL_LINES, { move_cursor = true, duration = 100 })
            end,
            description = "Scroll up",
        },
        {
            key = "<C-d>",
            actions = function()
                neoscroll.scroll(SCROLL_LINES, { move_cursor = true, duration = 100 })
            end,
            description = "Scroll down",
        },
    },
})
