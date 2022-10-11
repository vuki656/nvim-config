-- Name: Scrollview
-- Description: Scrollbar
-- Link: https://github.com/dstein64/nvim-scrollview

local set_highlight = require("utils.set-highlight")
local colors = require("utils.colors")

------------------------------------------------------------------------------------------
----------------------------------- CONFIG -----------------------------------------------
------------------------------------------------------------------------------------------

-- Don't display in following filetypes
vim.g.scrollview_excluded_filetypes = {
    "NvimTree",
    "alpha",
}

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({ group = "ScrollView", background = colors.background_light })
