local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")

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

set_highlight({
    list = {
        -- In code colors
        { group = "DiagnosticUnderlineError", foreground = colors.red },
        { group = "DiagnosticUnderlineWarning", foreground = colors.yellow },
        { group = "DiagnosticUnderlineInformation", foreground = colors.blue },
        { group = "DiagnosticUnderlineHint", foreground = colors.orange },

        -- Floating window colors
        { group = "DiagnosticFloatingError", foreground = colors.red },
        { group = "DiagnosticFloatingWarn", foreground = colors.yellow },
        { group = "DiagnosticFloatingInfo", foreground = colors.blue },
        { group = "DiagnosticFloatingHint", foreground = colors.orange },

        -- General purpose colors
        { group = "DiagnosticError", foreground = colors.red },
        { group = "DiagnosticWarn", foreground = colors.yellow },
        { group = "DiagnosticInfo", foreground = colors.blue },
        { group = "DiagnosticHint", foreground = colors.orange },
    },
})
