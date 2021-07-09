local colors = require("utils.colors")
local null_ls = require("null-ls")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = false, -- Disable LSP signs
    underline = true, -- Underline diagnostics
    virtual_text = false, -- Hide virtual text
})

null_ls.setup({})

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

vim.cmd([[highlight LspDiagnosticsDefaultError              guifg=]] .. colors.red)
vim.cmd([[highlight LspDiagnosticsDefaultWarning            guifg=]] .. colors.yellow)
vim.cmd([[highlight LspDiagnosticsDefaultInformation        guifg=]] .. colors.blue)
vim.cmd([[highlight LspDiagnosticsDefaultHint               guifg=]] .. colors.orange)

vim.cmd([[highlight LspDiagnosticsUnderlineError            guifg=]] .. colors.red)
vim.cmd([[highlight LspDiagnosticsUnderlineWarning          guifg=]] .. colors.yellow)
vim.cmd([[highlight LspDiagnosticsUnderlineInformation      guifg=]] .. colors.blue)
vim.cmd([[highlight LspDiagnosticsUnderlineHint             guifg=]] .. colors.orange)
