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
        { group = "CursorIM", foreground = red, background = blue },
        { group = "ColorColumn", foreground = red, background = blue },
        { group = "Cursor", foreground = red, background = blue },
        { group = "CursorColumn", foreground = red, background = blue },
        { group = "Folded", foreground = red, background = blue },
        { group = "FoldColumn", foreground = red, background = blue },
        { group = "Italic", foreground = red, background = blue },
        { group = "NonText", foreground = red, background = blue },
        { group = "PMenuSbar", foreground = red, background = blue },
        { group = "PMenuThumb", foreground = red, background = blue },
        { group = "VisualNOS", foreground = red, background = blue },
        { group = "TooLong", foreground = red, background = blue },
        { group = "WildMenu", foreground = red, background = blue },
        { group = "Conditional", foreground = red, background = blue },
        { group = "Repeat", foreground = red, background = blue },
        { group = "Exception", foreground = red, background = blue },
        { group = "Include", foreground = red, background = blue },
        { group = "Define", foreground = red, background = blue },
        { group = "Macro", foreground = red, background = blue },
        { group = "PreCondit", foreground = red, background = blue },
        { group = "TabLineFill", foreground = red, background = orange },
        { group = "StorageClass", foreground = red, background = blue },
        { group = "Structure", foreground = red, background = blue },
        { group = "Character", foreground = red },
        { group = "Typedef", foreground = red, background = blue },
        { group = "SpecialChar", foreground = red, background = blue },
        { group = "Tag", foreground = red, background = blue },
        { group = "Debug", foreground = red, background = blue },
        { group = "conceal", foreground = green, background = blue },

        -- Editor
        { group = "bold", foreground = red },
        { group = "Search", foreground = background, background = orange },
        { group = "Function", foreground = blue },
        { group = "Comment", foreground = grey },
        { group = "Title", foreground = blue },
        { group = "SpecialComment", foreground = orange },
        { group = "Constant", foreground = green },
        { group = "Keyword", foreground = green },
        { group = "Boolean", foreground = purple },
        { group = "Directory", foreground = white, background = background },
        { group = "Type", foreground = orange },
        { group = "Float", foreground = blue },
        { group = "Ignore", foreground = red },
        { group = "Underlined", foreground = white },
        { group = "Number", foreground = orange },
        { group = "TabLine", foreground = white, background = background, options = "NONE" },
        { group = "TabLineSel", foreground = red, background = background },
        { group = "Operator", foreground = white },
        { group = "String", foreground = red },
        { group = "CursorLine", background = grey_lighter },
        { group = "Delimiter", foreground = orange },
        { group = "Todo", background = blue, foreground = background },
        { group = "IncSearch", foreground = "NONE", background = "NONE" },
        { group = "MoreMsg", foreground = orange, background = background },
        { group = "CursorLineNr", foreground = white },
        { group = "Normal", background = background },
        { group = "StatusLine", foreground = background_light, background = background },
        { group = "StatusLineNC", foreground = background },
        { group = "SignColumn", background = background },
        { group = "EndOfBuffer", foreground = background },
        { group = "SpellBad", options = "undercurl,bold" },
        { group = "PMenu", foreground = white, background = grey_lighter },
        { group = "ModeMsg", foreground = white },
        { group = "PmenuSel", background = green, foreground = background },
        { group = "LineNr", background = background, foreground = grey },
        { group = "VertSplit", background = background_light, foreground = background },
        { group = "Visual", background = grey_light },
        { group = "MatchParen", foreground = red, background = background },
        { group = "ErrorMsg", foreground = red, background = background },
        { group = "Error", foreground = red, background = background },
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
        { group = "helpSectionDelim", foreground = grey_light },
        { group = "helpHeader", foreground = blue },
        { group = "helpCommand", foreground = blue },
        { group = "healthSuccess", foreground = green },

        -- Treesitter
        { group = "TSFuncBuiltin", foreground = blue },
        { group = "TSConstant", foreground = orange },
        { group = "TSNumber", foreground = orange },
        { group = "TSString", foreground = green },
        { group = "TSStringSpecial", foreground = green },
        { group = "TSFuncMacro", foreground = red },
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
        { group = "TSURI", foreground = blue, options = "undercurl" },
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
