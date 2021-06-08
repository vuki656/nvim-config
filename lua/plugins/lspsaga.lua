-- Name: LSP Saga
-- Description: LSP utils wrapper 
-- Link: https://github.com/glepnir/lspsaga.nvim
local colors = require("utils.colors")
local lsp_saga = require("lspsaga")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

lsp_saga.init_lsp_saga {
    use_saga_diagnostic_sign = false,
    code_action_icon = "",
    border_style = "round",
    finder_action_keys = { open = "<CR>" },
}

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Show code actions
vim.api.nvim_set_keymap("n", "<leader>ca", ":Lspsaga code_action<CR>", { noremap = true })
vim.api.nvim_set_keymap("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", { noremap = true })

-- Show doc
vim.api.nvim_set_keymap("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", { noremap = true })

-- Show line diagnostics
vim.api.nvim_set_keymap(
    "n", "J", "<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>", { noremap = true }
)

-- Scroll doc
vim.api.nvim_set_keymap(
    "n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", { noremap = true }
)
vim.api.nvim_set_keymap(
    "n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", { noremap = true }
)

-- Rename
vim.api.nvim_set_keymap("n", "<leader>rn", " <cmd>lua require('lspsaga.rename').rename()<CR>", { noremap = true })

-- Go to next/previous diagnostic
vim.api.nvim_set_keymap("n", "]d", ":Lspsaga diagnostic_jump_prev<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "[d", ":Lspsaga diagnostic_jump_next<CR>", { noremap = true })

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

vim.cmd([[highlight LspSagaCodeActionBorder              guifg=]] .. colors.blue)
vim.cmd([[highlight LspSagaCodeActionTitle               guifg=]] .. colors.red .. " gui='bold'")
vim.cmd([[highlight DiagnosticError                      guifg=]] .. colors.red)
