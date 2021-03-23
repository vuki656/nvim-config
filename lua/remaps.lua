local remap = vim.api.nvim_set_keymap 

------------------------------------------------------------------------------------------
----------------------------------- GENERAL ----------------------------------------------
------------------------------------------------------------------------------------------

-- Go to normal mode with jj
remap('i', 'jj', '<ESC>', { noremap = true, silent = true })

-- Buffer navigation
remap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
remap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
remap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
remap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })


------------------------------------------------------------------------------------------
----------------------------------- FILE TREE --------------------------------------------
------------------------------------------------------------------------------------------

-- Toggle file tree
remap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

