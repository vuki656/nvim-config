local set_highlight = require("utils.set-highlight")
local set_sign = require("utils.set-sign")
local colors = require("utils.colors")
local LSP_ICONS = require("lsp.utils.icons")

local background = colors.background
local background_light = colors.background_light
local purple = colors.purple
local red = colors.red
local white = colors.white
local yellow = colors.yellow
local orange = colors.orange
local blue = colors.blue
local green = colors.green
local grey = colors.grey
local grey_light = colors.grey_light
local grey_lighter = colors.grey_lighter

set_sign({
    list = {
        { name = "DiagnosticSignError", sign = LSP_ICONS.ERROR, highlight_group = "DiagnosticSignError" },
        { name = "DiagnosticSignWarn", sign = LSP_ICONS.WARNING, highlight_group = "DiagnosticSignWarn" },
        { name = "DiagnosticSignInfo", sign = LSP_ICONS.INFO, highlight_group = "DiagnosticSignInfo" },
        { name = "DiagnosticSignHint", sign = LSP_ICONS.HINT, highlight_group = "DiagnosticSignHint" },
    },
})

set_highlight({
    list = {
        -- Editor
        { group = "Search", foreground = background, background = orange },
        { group = "Comment", foreground = grey },
        { group = "Constant", foreground = green },
        { group = "Type", foreground = orange },
        { group = "Operator", foreground = white },
        { group = "CursorLine", background = grey_lighter },
        { group = "CursorLineNr", foreground = white },
        { group = "Normal", background = background },
        { group = "StatusLineNC", foreground = background },
        { group = "SignColumn", background = background },
        { group = "EndOfBuffer", foreground = background },
        { group = "SpellBad", options = "undercurl,bold" },
        { group = "PMenu", foreground = white, background = grey_lighter },
        { group = "PmenuSel", background = green, foreground = background },
        { group = "LineNr", background = background, foreground = grey },
        { group = "VertSplit", background = background_light, foreground = background },
        { group = "Visual", background = grey_light },
        { group = "MatchParen", foreground = red, background = background },
        { group = "ErrorMsg", foreground = red, background = background },
        { group = "WarningMsg", foreground = orange, background = background },
        { group = "Whitespace", foreground = background_light },
        { group = "Label", foreground = red },
        { group = "Question", foreground = green, background = background },
        { group = "SpecialKey", foreground = orange, background = background },

        -- Diagnostics
        { group = "DiagnosticUnderlineError", foreground = red },
        { group = "DiagnosticUnderlineWarning", foreground = yellow },
        { group = "DiagnosticUnderlineInformation", foreground = blue },
        { group = "DiagnosticUnderlineHint", foreground = orange },
        { group = "DiagnosticFloatingError", foreground = red },
        { group = "DiagnosticFloatingWarn", foreground = yellow },
        { group = "DiagnosticFloatingInfo", foreground = blue },
        { group = "DiagnosticFloatingHint", foreground = orange },
        { group = "DiagnosticError", foreground = red },
        { group = "DiagnosticWarn", foreground = yellow },
        { group = "DiagnosticInfo", foreground = blue },
        { group = "DiagnosticHint", foreground = orange },

        -- Git
        { group = "diffAdded", foreground = green },
        { group = "diffRemoved", foreground = red },
        { group = "diffLine", foreground = blue },

        -- Documentation
        { group = "Statement", foreground = purple, options = "NONE" },
        { group = "PreProc", foreground = grey },
        { group = "Identifier", foreground = red },
        { group = "HelpExample", foreground = orange },
        { group = "Special", foreground = blue },

        -- Treesitter
        { group = "TSFuncBuiltin", foreground = blue },
        { group = "TSConstant", foreground = orange },
        { group = "TSNumber", foreground = orange },
        { group = "TSString", foreground = green },
        { group = "TSMethod", foreground = blue },
        { group = "TSField", foreground = red },
        { group = "TSKeywordFunction", foreground = red },
        { group = "TSTitle", foreground = red },
        { group = "TSConditional", foreground = purple },
        { group = "TSRepeat", foreground = purple },
        { group = "TSKeyword", foreground = purple },
        { group = "TSFunction", foreground = blue },
        { group = "TSInclude", foreground = purple },
        { group = "TSKeywordOperator", foreground = purple },
        { group = "TSBoolean", foreground = purple },
        { group = "TSConstBuiltin", foreground = purple },
        { group = "TSTypeBuiltin", foreground = purple },
        { group = "TSType", foreground = yellow },
        { group = "TSVariable", foreground = white },
        { group = "TSNamespace", foreground = white },
        { group = "TSConstructor", foreground = yellow },
        { group = "TSParameter", foreground = orange },
        { group = "TSProperty", foreground = red },
        { group = "TSLabel", foreground = red },
        { group = "TSPunctBracket", foreground = white },
        { group = "TSOperator", foreground = white },
        { group = "TSPunctDelimiter", foreground = white },
        { group = "TSPunctSpecial", foreground = orange },
        { group = "TSTagDelimiter", foreground = white },
        { group = "TSTag", foreground = red },
    },
})
