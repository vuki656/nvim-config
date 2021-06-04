require('utils.colors')

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

require('lspsaga').init_lsp_saga {
    use_saga_diagnostic_sign = false,
    code_action_icon = '',
    border_style = "round"
}

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

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

-- Show line diagnostics on hover
vim.cmd([[
    autocmd CursorHold * lua require'lspsaga.diagnostic'.show_line_diagnostics()
    autocmd CursorHoldI * lua require'lspsaga.diagnostic'.show_line_diagnostics()
]])

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

vim.cmd([[highlight LspSagaCodeActionBorder              guifg=]] .. colors.blue)
vim.cmd([[highlight LspSagaCodeActionTitle               guifg=]] .. colors.red .. " gui='bold'")
vim.cmd([[highlight DiagnosticError                      guifg=]] .. colors.red)
