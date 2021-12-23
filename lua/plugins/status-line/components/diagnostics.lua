local lsp = require("feline.providers.lsp")

local LSP_ICONS = require("lsp.utils.icons")
local colors = require("utils.colors")

return {
    errors = {
        icon = " " .. LSP_ICONS.ERROR .. " ",
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
        icon = " " .. LSP_ICONS.WARNING .. " ",
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
        icon = " " .. LSP_ICONS.HINT .. " ",
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
        icon = " " .. LSP_ICONS.INFO .. " ",
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
