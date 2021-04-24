local remap = vim.api.nvim_set_keymap 

-- Format file
remap('n', '<leader>ef', ':lua vim.lsp.buf.formatting()<CR>', { noremap = true, silent = true })

-- Remap Q to q
remap('c', 'Q', 'q', { noremap = true, silent = true })

-- Remap W to w 
remap('c', 'W', 'w', { noremap = true, silent = true })

-- Go to normal mode with jj
remap('i', 'jj', '<ESC>', { noremap = true, silent = true })

-- Rotate between last 2 opened files
remap('n', '<leader>8', '<C-^>', { noremap = true, silent = true })

-- Buffer navigation with hjkl
remap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
remap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })
remap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
remap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })

-- Display treesitter highlight group
remap('n', '<leader>1', ':TSHighlightCapturesUnderCursor<CR>', { noremap = true, silent = true })

