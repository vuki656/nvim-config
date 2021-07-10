-- Name: Undotree
-- Description: Multiple undo history view
-- Link: https://github.com/mbbill/undotreelocal

local vars = require("utils.vars")

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
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Close undotree
vars.remap.fn("n", "<leader>uo", ":NvimTreeClose<CR> :UndotreeToggle<CR>", vars.remap.opts)

-- Open undotree
vars.remap.fn("n", "<leader>uc", ":UndotreeToggle<CR> :NvimTreeOpen<CR> ", vars.remap.opts)
