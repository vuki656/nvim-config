local remap = vim.api.nvim_set_keymap 

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

require("todo-comments").setup {
    signs = false
}

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Open todos in telescope picker
remap('n', '<leader>t', ':TodoTelescope<CR>', { noremap = true, silent = true })
