-- Name: Scrollview
-- Description: Scrollbar
-- Link: https://github.com/dstein64/nvim-scrollview

local ICONS = require("utils.icons")
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
    signs_max_per_row = 1,
    search_symbol = "",
    diagnostics_warn_symbol = ICONS.WARNING,
    diagnostics_error_symbol = ICONS.ERROR,
})

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({
    group = "ScrollView",
    background = colors.background_light,
})
