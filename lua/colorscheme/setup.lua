local set_highlight = require("utils.set_highlight")
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

set_highlight({
    list = {
        -- Editor
        { group = "Search", foreground = background, background = orange },
        { group = "Comment", foreground = grey },
        { group = "CursorLine", background = grey_light },
        { group = "Normal", background = background },
        { group = "StatusLineNC", foreground = red },
        { group = "IndentBlankLineChar", foreground = background_light },
        { group = "SpellBad", gui = "undercurl,bold" },
        { group = "PMenu", foreground = white, background = grey_light },
        { group = "PmenuSel", background = colors.green, foreground = colors.background },

        -- Treesitter
        { group = "TSFuncBuiltin", foreground = blue },
        { group = "TSString", foreground = green },
        { group = "TSField", foreground = red },
        { group = "TSKeyword", foreground = purple },
        { group = "TSFunction", foreground = blue },
        { group = "TSInclude", foreground = purple },
        { group = "TSKeywordOperator", foreground = purple },
        { group = "TSBoolean", foreground = purple },
        { group = "TSConstBuiltin", foreground = purple },
        { group = "TSTypeBuiltin", foreground = purple },
        { group = "TSVariable", foreground = white },
        { group = "TSNamespace", foreground = white },
        { group = "TSConstructor", foreground = yellow },
        { group = "TSParameter", foreground = orange },
        { group = "TSProperty", foreground = red },
        { group = "TSLabel", foreground = red },
        { group = "TSPunctBracket", foreground = white },
        { group = "TSOperator", foreground = white },
        { group = "TSPunctDelimiter", foreground = white },
        { group = "TSPunctSpecial", foreground = white },
        { group = "TSTagDelimiter", foreground = white },
        { group = "TSTag", foreground = red },
    },
})
