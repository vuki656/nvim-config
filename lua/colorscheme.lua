local LSP_ICONS = require("lsp.utils.icons")

local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")
local set_sign = require("utils.set-sign")

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
        { group = "VisualNOS", foreground = red, background = blue },
        { group = "TooLong", foreground = red, background = blue },
        { group = "WildMenu", foreground = red, background = blue },
        { group = "Repeat", foreground = red, background = blue },
        { group = "Define", foreground = red, background = blue },
        { group = "PreCondit", foreground = red, background = blue },
        { group = "TabLineFill", foreground = red, background = orange },
        { group = "Debug", foreground = red, background = blue },

        -- Editor
        { group = "NonText", foreground = background_light, background = "NONE" },
        { group = "StorageClass", foreground = red },
        { group = "conceal", foreground = orange, background = "NONE" },
        { group = "bold", foreground = red },
        { group = "Search", foreground = background, background = orange },
        { group = "Tag", foreground = white },
        { group = "Function", foreground = blue },
        { group = "Exception", foreground = white },
        { group = "Comment", foreground = grey },
        { group = "Title", foreground = red },
        { group = "Include", foreground = blue },
        { group = "Typedef", foreground = yellow },
        { group = "SpecialChar", foreground = orange, background = background },
        { group = "Macro", foreground = orange, background = background },
        { group = "Repeat", foreground = blue, background = background },
        { group = "SpecialComment", foreground = orange },
        { group = "Constant", foreground = green },
        { group = "Keyword", foreground = purple },
        { group = "Boolean", foreground = purple },
        { group = "Character", foreground = purple },
        { group = "Conditional", foreground = red },
        { group = "Directory", foreground = blue, background = background },
        { group = "Type", foreground = yellow, options = "NONE" },
        { group = "Float", foreground = blue },
        { group = "Ignore", foreground = red },
        { group = "Structure", foreground = yellow },
        { group = "Underlined", foreground = white },
        { group = "Number", foreground = orange },
        {
            group = "TabLine",
            foreground = white,
            background = background,
            options = "NONE",
        },
        { group = "TabLineSel", foreground = red, background = background },
        { group = "Operator", foreground = white },
        { group = "String", foreground = red },
        { group = "CursorLine", background = grey_lighter },
        { group = "Delimiter", foreground = orange },
        { group = "Identifier", foreground = white },
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
        { group = "ModeMsg", foreground = white },
        { group = "PMenu", foreground = white, background = grey_lighter },
        { group = "PMenuThumb", foreground = red, background = grey },
        { group = "PMenuSbar", background = grey_light },
        { group = "PmenuSel", background = green, foreground = background },
        { group = "LineNr", background = background, foreground = grey },
        { group = "WinSeparator", foreground = background_light },
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
        { group = "HelpExample", foreground = orange },
        { group = "Special", foreground = blue },
        { group = "helpSectionDelim", foreground = grey_light },
        { group = "helpHeader", foreground = blue },
        { group = "helpCommand", foreground = blue },
        { group = "healthSuccess", foreground = green },

        -- Treesitter
        { group = "@exception", foreground = purple },
        { group = "@constant", foreground = white },
        { group = "@constant.builtin", foreground = purple },
        { group = "@number", foreground = orange },
        { group = "@string", foreground = green },
        { group = "@method", foreground = blue },
        { group = "@conditional", foreground = purple },
        { group = "@function", foreground = blue },
        { group = "@include", foreground = purple },
        { group = "@type.builtin", foreground = purple },
        { group = "@type.qualifier", foreground = purple },
        { group = "@type", foreground = yellow },
        { group = "@variable", foreground = white },
        { group = "@variable.builtin", foreground = purple },
        { group = "@constructor", foreground = yellow, background = background },
        { group = "@parameter", foreground = orange },
        { group = "@property", foreground = red },
        { group = "@punctuation.bracket", foreground = red },
        { group = "@punctuation.delimiter", foreground = orange },
        { group = "@repeat", foreground = purple },
        { group = "@tag", foreground = red },
        { group = "@tag.delimiter", foreground = white },
        { group = "@tag.attribute", foreground = red },
        { group = "@attribute", foreground = purple },
        { group = "@text.title", foreground = red },
        { group = "@text.uri", foreground = blue },
        { group = "@text.literal", foreground = green },
        { group = "@text.reference", foreground = orange },
        { group = "@text.todo.unchecked", foreground = red },
        { group = "@text.todo.checked", foreground = green },
        { group = "@storageclass.lifetime ", foreground = purple },
        { group = "@namespace", foreground = yellow },

        -- LSP Semantic Highlighting
        { group = "@lsp.type.parameter", foreground = orange },
        { group = "@lsp.type.property", foreground = red },

        -- Plugins
        { group = "packerHash", foreground = red },
    },
})
