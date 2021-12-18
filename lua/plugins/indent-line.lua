-- Name: Indent Blank Line
-- Description: Indent guidelines
-- Link: https://github.com/lukas-reineke/indent-blankline.nvim

local indent_blankline = require("indent_blankline")

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
