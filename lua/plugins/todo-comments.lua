-- Name: Todo Comments
-- Description: Finder 
-- Link: https://github.com/nvim-telescope/telescope.nvim

local remap = vim.api.nvim_set_keymap 

local todo_comments = require('todo-comments')

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

todo_comments.setup {
    signs = false
}

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Open todos in telescope picker
remap('n', '<leader>pt', ':TodoTelescope<CR>', { noremap = true, silent = true })
