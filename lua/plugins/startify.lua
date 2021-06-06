-- Name: Startify
-- Description: Start screen
-- Link: https://github.com/mhinz/vim-startify

local remap = vim.api.nvim_set_keymap 

vim.g.startify_lists = {
    { 
        type= 'dir',
        header= {'   MRU - Project'}
    },
    { 
        type= 'files',
        header= {'   MRU'}
    },
}

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Open startify
remap('n', '<leader>b', ':Startify<CR>', { noremap = true, silent = true })


