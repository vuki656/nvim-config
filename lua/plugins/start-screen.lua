-- Name: Startify
-- Description: Start screen
-- Link: https://github.com/mhinz/vim-startify

local vars = require('utils.vars')

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

-- Categories to display
vim.g.startify_lists = {
    {
        type = "dir",
        header = { "   MRU - Project" },
    },
    {
        type = "files",
        header = { "   MRU" },
    },
}

-- Start list at 1
vim.cmd("let g:startify_custom_indices = map(range(1,100), 'string(v:val)')")

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Open startify
vars.remap.fn("n", "<leader>b", ":Startify<CR>", vars.remap.opts)
