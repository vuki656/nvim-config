local lsp = require("feline.providers.lsp")

local ICONS = require("utils.icons")
local colors = require("utils.colors")

return {
    errors = {
        icon = " " .. ICONS.ERROR .. " ",
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
        icon = " " .. ICONS.WARNING .. " ",
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
        icon = " " .. ICONS.HINT .. " ",
        provider = "diagnostic_hints",
        enabled = function()
            return lsp.diagnostics_exist("Hint")
        end,
        hl = {
            fg = colors.yellow,
            bg = colors.background,
        },
    },
    info = {
        icon = " " .. ICONS.INFO .. " ",
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
