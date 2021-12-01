local colors = require("utils.colors")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

-- TODO: remove
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = false, -- Disable LSP signs
    underline = true, -- Underline diagnostics
    virtual_text = false, -- Hide virtual text
})

vim.diagnostic.config({
    signs = false, -- Disable LSP signs
    underline = true, -- Underline diagnostics
    virtual_text = false, -- Hide virtual text
})

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

vim.cmd([[highlight DiagnosticDefaultError              guifg=]] .. colors.red)
vim.cmd([[highlight DiagnosticDefaultWarning            guifg=]] .. colors.yellow)
vim.cmd([[highlight DiagnosticDefaultInformation        guifg=]] .. colors.blue)
vim.cmd([[highlight DiagnosticDefaultHint               guifg=]] .. colors.orange)

vim.cmd([[highlight DiagnosticUnderlineError            guifg=]] .. colors.red)
vim.cmd([[highlight DiagnosticUnderlineWarning          guifg=]] .. colors.yellow)
vim.cmd([[highlight DiagnosticUnderlineInformation      guifg=]] .. colors.blue)
vim.cmd([[highlight DiagnosticUnderlineHint             guifg=]] .. colors.orange)
