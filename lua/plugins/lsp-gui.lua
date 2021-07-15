-- Name: LSP Saga
-- Description: LSP utils wrapper
-- Link: https://github.com/glepnir/lspsaga.nvim

local lsp_saga = require("lspsaga")

local colors = require("utils.colors")
local vars = require("utils.vars")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

lsp_saga.init_lsp_saga({
    use_saga_diagnostic_sign = false,
    code_action_icon = "",
    border_style = "round",
    finder_action_keys = { open = "<CR>" },
})

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Show code actions
vars.remap.fn("n", "<leader>ca", ":Lspsaga code_action<CR>", vars.remap.opts)
vars.remap.fn("v", "<leader>ca", ":<C-U>Lspsaga range_code_action<CR>", vars.remap.opts)

-- Show doc
vars.remap.fn("n", "K", "<cmd>lua require('lspsaga.hover').render_hover_doc()<CR>", vars.remap.opts)

-- Show line diagnostics
vars.remap.fn("n", "J", "<cmd>lua require('lspsaga.diagnostic').show_line_diagnostics()<CR>", vars.remap.opts)

-- Scroll doc
vars.remap.fn("n", "<C-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>", vars.remap.opts)
vars.remap.fn("n", "<C-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>", vars.remap.opts)

-- Rename
vars.remap.fn("n", "<leader>rn", " <cmd>lua require('lspsaga.rename').rename()<CR>", vars.remap.opts)

-- Go to next/previous diagnostic
vars.remap.fn("n", "]d", ":Lspsaga diagnostic_jump_prev<CR>", vars.remap.opts)
vars.remap.fn("n", "[d", ":Lspsaga diagnostic_jump_next<CR>", vars.remap.opts)

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Code action prompt
vim.cmd([[highlight LspSagaCodeActionBorder              guifg=]] .. colors.red)
vim.cmd([[highlight LspSagaCodeActionTitle               guifg=]] .. colors.green .. " gui='bold'")
vim.cmd([[highlight LspSagaCodeActionTruncateLine        guifg=]] .. colors.red)
vim.cmd([[highlight LspSagaCodeActionContent             guifg=]] .. colors.green)

-- Doc prompt
vim.cmd([[highlight LspSagaDocTruncateLine               guifg=]] .. colors.red)

-- Rename prompt
vim.cmd([[highlight LspSagaRenameBorder        guifg=]] .. colors.red)
vim.cmd([[highlight LspSagaRenamePromptPrefix  guifg=]] .. colors.green)
