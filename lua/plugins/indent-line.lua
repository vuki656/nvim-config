-- Name: Indent Blank Line
-- Description: Indent guidelines
-- Link: https://github.com/lukas-reineke/indent-blankline.nvim

local indent_blankline = require("indent_blankline")

local set_highlight = require("utils.set_highlight")
local colors = require("utils.colors")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

indent_blankline.setup({
    char = "▏",
    filetype_exclude = {
        "NvimTree",
        "alpha",
        "packer",
        "code-action-menu-menu",
    },
})
