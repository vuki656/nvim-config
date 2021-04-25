------------------------------------------------------------------------------------------

vim.api.nvim_set_keymap("n", "<leader>p", "<cmd>Telescope find_files<cr>", { noremap = true, })
vim.api.nvim_set_keymap("n", "<leader>s", "<cmd>Telescope live_grep<cr>", { noremap = true, })
