local colors = require("utils.colors")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    signs = false, -- Disable LSP signs
    underline = true, -- Underline diagnostics
    virtual_text = false, -- Hide virtual text
})

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
