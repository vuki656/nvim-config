local lsp = require("feline.providers.lsp")

local colors = require("utils.colors")

return {
    errors = {
        provider = "diagnostic_errors",
        enabled = function()
            return lsp.diagnostics_exist("Error")
        end,
        hl = {
            bg = colors.background,
            fg = colors.red,
        },
    },
    warnings = {
        icon = "  ",
        provider = "diagnostic_warnings",
        enabled = function()
            return lsp.diagnostics_exist("Warn")
        end,
        hl = {
            bg = colors.background,
            fg = colors.yellow,
        },
    },
    hints = {
        icon = "  ",
        provider = "diagnostic_hints",
        enabled = function()
            return lsp.diagnostics_exist("Hint")
        end,
        hl = {
            fg = colors.blue,
            bg = colors.background,
        },
    },
    info = {
        provider = "diagnostic_info",
        enabled = function()
            return lsp.diagnostics_exist("Info")
        end,
        hl = {
            bg = colors.background,
            fg = colors.blue,
        },
    },
}
