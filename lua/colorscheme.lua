local set_highlight = require("utils.set-highlight")
local colors = require("utils.colors")

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

set_highlight({
    list = {
        -- Editor
        { group = "Search", foreground = background, background = orange },
        { group = "Comment", foreground = grey, background = background },
        { group = "Constant", foreground = green },
        { group = "Type", foreground = orange },
        { group = "Operator", foreground = white },
        { group = "CursorLine", background = grey_lighter },
        { group = "CursorLineNr", foreground = white },
        { group = "Normal", background = background },
        { group = "StatusLineNC", foreground = red },
        { group = "SignColumn", background = background },
        { group = "SpellBad", gui = "undercurl,bold" },
        { group = "PMenu", foreground = white, background = grey_lighter },
        { group = "PmenuSel", background = colors.green, foreground = colors.background },
        { group = "LineNr", background = background, foreground = grey },
        { group = "VertSplit", background = background, foreground = background },
        { group = "Visual", background = grey_light },
        { group = "MatchParen", foreground = red, background = background },
        { group = "ErrorMsg", foreground = red, background = background },
        { group = "Whitespace", foreground = background_light },
        { group = "Label", foreground = background_light },

        -- Vim Documentation
        { group = "Statement", foreground = purple },
        { group = "PreProc", foreground = grey },
        { group = "Identifier", foreground = red },
        { group = "HelpExample", foreground = orange },
        { group = "Special", foreground = blue },

        -- Treesitter
        { group = "TSFuncBuiltin", foreground = blue },
        { group = "TSConstant", foreground = orange },
        { group = "TSNumber", foreground = orange },
        { group = "TSString", foreground = green },
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
