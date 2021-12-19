local lsp = require("feline.providers.lsp")

local colors = require("utils.colors")

local diagnostics = {
    {
        provider = "diagnostic_errors",
        enabled = function()
            return lsp.diagnostics_exist("Error")
        end,
        hl = {
            bg = colors.background,
            fg = colors.red,
        },
    },
    {
        provider = "diagnostic_warnings",
        enabled = function()
            return lsp.diagnostics_exist("Warning")
        end,
        hl = {
            bg = colors.background,
            fg = colors.yellow,
        },
    },
    {
        provider = "diagnostic_hints",
        enabled = function()
            return lsp.diagnostics_exist("Hint")
        end,
        hl = {
            fg = colors.orange,
            bg = colors.background,
        },
    },
    {
        provider = "diagnostic_info",
        enabled = function()
            return lsp.diagnostics_exist("Information")
        end,
        hl = {
            bg = colors.background,
            fg = colors.blue,
        },
    },
}

return unpack(diagnostics)
