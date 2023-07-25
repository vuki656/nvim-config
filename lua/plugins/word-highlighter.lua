-- Name: Illuminate
-- Description: Highlight same words under cursor
-- Link: https://github.com/RRethy/vim-illuminate

local illuminate = require("illuminate")

local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

illuminate.configure({
    providers = {
        "lsp",
        "treesitter",
        "regex",
    },
    delay = 400,
    filetypes_denylist = {
        "NvimTree",
        "lazy",
        "alpha",
        "qf",
        "help",
    },
})

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({
    list = {
        { group = "IlluminatedWord", background = colors.background_light },
        { group = "IlluminatedCurWord", background = colors.background_light },
        { group = "IlluminatedWordText", background = colors.background_light },
        { group = "IlluminatedWordRead", background = colors.background_light },
        { group = "IlluminatedWordWrite", background = colors.background_light },
    },
})
