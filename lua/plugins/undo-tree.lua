-- Name: Undotree
-- Description: Multiple undo history viewer and navigator
-- Link: https://github.com/mbbill/undotreelocal

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

-- Set width
vim.g.undotree_SplitWidth = 50

-- Needed for width to be correctly set
vim.g.undotree_ShortIndicators = 0

-- Don't auto open diff view
vim.g.undotree_DiffAutoOpen = 0

-- Auto focus on open
vim.g.undotree_SetFocusWhenToggle = 1

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>uo",
            actions = function()
                vim.cmd("NvimTreeClose")
                vim.cmd("UndotreeToggle")
            end,
            description = "Open undotree",
        },
        {
            key = "<LEADER>uc",
            actions = function()
                vim.cmd("UndotreeToggle")
                vim.cmd("NvimTreeOpen")
            end,
            description = "Close undotree",
        },
    },
})
