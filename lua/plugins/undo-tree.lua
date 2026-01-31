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
    key = "<LEADER>ou",
    actions = function()
        local undotree_open = vim.fn.undotree().seq_cur ~= nil and vim.g.undotree_isopen == 1

        if undotree_open then
            vim.cmd("UndotreeToggle")
            vim.cmd("NvimTreeOpen")
        else
            vim.cmd("NvimTreeClose")
            vim.cmd("UndotreeToggle")
        end
    end,
    description = "[UndoTree] Toggle undo tree",
})
