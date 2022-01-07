-- Name: Refactoring
-- Description: Helps with printing and code refactoring
-- Link: https://github.com/dstein64/nvim-scrollview

local refactoring = require("refactoring")

local set_keymap = require("utils.set-keymap")

local display_refactor_actions = require("plugins.refactoring.keymaps.menu")

------------------------------------------------------------------------------------------
----------------------------------- CONFIG -----------------------------------------------
------------------------------------------------------------------------------------------

refactoring.setup({})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            modes = { "v" },
            key = "<LEADER>rp",
            actions = function()
                refactoring.debug.print_var({})
            end,
            description = "Put the highlighted statement in a print statement",
        },
        {
            key = "<LEADER>rk",
            actions = function()
                refactoring.debug.cleanup({})
            end,
            description = "Clear all refactoring plugin print statements",
        },
        {
            modes = { "v" },
            key = "<LEADER>rl",
            actions = display_refactor_actions,
            description = "Display refactoring actions",
        },
    },
})
