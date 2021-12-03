local colors = require("utils.colors")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

vim.diagnostic.config({
    signs = false, -- Disable LSP signs
    underline = true, -- Underline diagnostics
    virtual_text = false, -- Hide virtual text
})

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

-- In code colors
vim.cmd([[highlight DiagnosticUnderlineError            guifg=]] .. colors.red)
vim.cmd([[highlight DiagnosticUnderlineWarning          guifg=]] .. colors.yellow)
vim.cmd([[highlight DiagnosticUnderlineInformation      guifg=]] .. colors.blue)
vim.cmd([[highlight DiagnosticUnderlineHint             guifg=]] .. colors.orange)

-- Float colors
vim.cmd([[highlight DiagnosticFloatingError            guifg=]] .. colors.red)
vim.cmd([[highlight DiagnosticFloatingWarn             guifg=]] .. colors.yellow)
vim.cmd([[highlight DiagnosticFloatingInfo             guifg=]] .. colors.blue)
vim.cmd([[highlight DiagnosticFloatingHint             guifg=]] .. colors.orange)
