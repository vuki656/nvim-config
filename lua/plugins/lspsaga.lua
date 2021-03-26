require('lspsaga').init_lsp_saga {}

-- Find references
vim.api.nvim_set_keymap("n", "gh", ":Lspsaga lsp_finder<CR>", { noremap = true, })

-- Code actions
vim.api.nvim_set_keymap("n", "<leader>ca", ":Lspsaga code_action<CR>", { noremap = true, })
vim.api.nvim_set_keymap("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", { noremap = true, })

-- Signature
vim.api.nvim_set_keymap("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", { noremap = true, })

-- Scroll signature
vim.api.nvim_set_keymap("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", { noremap = true, })
vim.api.nvim_set_keymap("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", { noremap = true, })

-- Signature help
vim.api.nvim_set_keymap("n", "gr", " <cmd>lua require('lspsaga.rename').rename()<CR>", { noremap = true, })

-- Show line diagnostics
vim.api.nvim_set_keymap("n", "<leader>cd", ":Lspsaga show_line_diagnostics<CR>", { noremap = true, })

-- Go to next/previous diagnostic
vim.api.nvim_set_keymap("n", "[e", ":Lspsaga diagnostic_jump_next<CR>", { noremap = true, })
vim.api.nvim_set_keymap("n", "]e", ":Lspsaga diagnostic_jump_prev<CR>", { noremap = true, })

