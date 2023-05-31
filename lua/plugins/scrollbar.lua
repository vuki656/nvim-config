-- Name: Scrollview
-- Description: Scrollbar
-- Link: https://github.com/dstein64/nvim-scrollview

local colors = require("utils.colors")
local scrollview = require("scrollview")
local set_highlight = require("utils.set-highlight")

------------------------------------------------------------------------------------------
----------------------------------- CONFIG -----------------------------------------------
------------------------------------------------------------------------------------------

scrollview.setup({
    excluded_filetypes = {
        "alpha",
        "NvimTree",
    },
})

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({
    group = "ScrollView",
    background = colors.background_light,
})
