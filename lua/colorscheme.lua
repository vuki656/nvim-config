local ICONS = require("utils.icons")

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
        { name = "DiagnosticSignError", sign = ICONS.ERROR, highlight_group = "DiagnosticSignError" },
        { name = "DiagnosticSignWarn", sign = ICONS.WARNING, highlight_group = "DiagnosticSignWarn" },
        { name = "DiagnosticSignInfo", sign = ICONS.INFO, highlight_group = "DiagnosticSignInfo" },
        { name = "DiagnosticSignHint", sign = ICONS.HINT, highlight_group = "DiagnosticSignHint" },
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
        { group = "VisualNOS", foreground = red, background = blue },
        { group = "TooLong", foreground = red, background = blue },
        { group = "WildMenu", foreground = red, background = blue },
        { group = "TabLineFill", foreground = red, background = orange },
        { group = "Debug", foreground = red, background = blue },

        -- Editor
        { group = "NonText", foreground = background_light, background = "NONE" },
        { group = "Define", foreground = red, background = "NONE" },
        { group = "PreCondit", foreground = blue },
        { group = "Repeat", foreground = purple },
        { group = "Italic", foreground = red, background = background },
        { group = "StorageClass", foreground = red },
        { group = "conceal", foreground = orange, background = "NONE" },
        -- { group = "bold", foreground = red },
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
        { group = "SpecialComment", foreground = orange },
        { group = "Quote", foreground = orange },
        { group = "Constant", foreground = green },
        { group = "Keyword", foreground = purple },
        { group = "Boolean", foreground = purple },
        { group = "Character", foreground = purple },
        { group = "Conditional", foreground = purple },
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
        { group = "String", foreground = green },
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
        { group = "DiagnosticUnderlineError", foreground = red, options = "bold,undercurl" },
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
        { group = "DiffChange", foreground = blue, background = background_light },
        { group = "DiffDelete", foreground = red, background = background_light },
        { group = "DiffAdd", foreground = green, background = background_light },
        { group = "DiffText", background = background_light },
        { group = "diffRemoved", foreground = red },
        { group = "diffAdded", foreground = green },

        -- Documentation
        { group = "Statement", foreground = purple, options = "NONE" },
        { group = "PreProc", foreground = grey },
        { group = "HelpExample", foreground = orange },
        { group = "Special", foreground = purple },
        { group = "helpSectionDelim", foreground = orange },
        { group = "helpHeader", foreground = blue },
        { group = "helpCommand", foreground = blue },
        { group = "healthSuccess", foreground = green },

        -- Treesitter
        { group = "@constant", foreground = white },
        { group = "@constant.builtin", foreground = purple },
        { group = "@number", foreground = orange },
        { group = "@string", foreground = green },
        { group = "@string.special.url.comment", foreground = blue },
        { group = "@function.method", foreground = blue },
        { group = "@function.builtin", foreground = blue },
        { group = "@keyword.conditional", foreground = purple },
        { group = "@keyword.lifetime", foreground = purple },
        { group = "@keyword.exception", foreground = purple },
        { group = "@keyword.repeat", foreground = purple },
        { group = "@keyword.include", foreground = purple },
        { group = "@keyword.modifier", foreground = purple },
        { group = "@function", foreground = blue },
        { group = "@type.builtin", foreground = purple },
        { group = "@type", foreground = yellow },
        { group = "@variable", foreground = white },
        { group = "@variable.builtin", foreground = purple },
        { group = "@variable.member", foreground = red },
        { group = "@constructor", foreground = yellow, background = background },
        { group = "@variable.parameter", foreground = orange },
        { group = "@property", foreground = red },
        { group = "@punctuation.bracket", foreground = red },
        { group = "@punctuation.delimiter", foreground = orange },
        { group = "@punctuation.special.tsx", foreground = orange },
        { group = "@tag", foreground = yellow },
        { group = "@tag.delimiter", foreground = white },
        { group = "@tag.attribute", foreground = red },
        { group = "@tag.tsx", foreground = yellow },
        { group = "@tag.builtin", foreground = yellow },
        { group = "@tag.builtin.tsx", foreground = yellow },
        { group = "@tag.vue", foreground = yellow },
        { group = "@attribute", foreground = yellow },
        { group = "@attribute.graphql", foreground = purple },
        { group = "@markup.heading", foreground = red },
        { group = "@markup.link.url", foreground = blue },
        { group = "@markup.raw", foreground = green },
        { group = "@markup.link", foreground = orange },
        { group = "@comment.todo.unchecked", foreground = red },
        { group = "@comment.todo.checked", foreground = green },
        { group = "@module", foreground = yellow },
        { group = "@text.literal.markdown_inline", foreground = green },
        { group = "@bash.argumentFlag", foreground = green },
        { group = "@bash.specialKeyword", foreground = blue },

        -- HTML
        { group = "htmlTagName", foreground = yellow },
        { group = "htmlArg", foreground = red },
    },
})
