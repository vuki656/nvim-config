-- Name: Startify
-- Description: Start screen
-- Link: https://github.com/mhinz/vim-startify

local remap = vim.api.nvim_set_keymap

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

-- Catefories to display
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
remap("n", "<leader>b", ":Startify<CR>", { noremap = true, silent = true })
