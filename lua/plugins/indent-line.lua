-- Name: Indent Blank Line
-- Description: Indent guidelines
-- Link: https://github.com/lukas-reineke/indent-blankline.nvim

local indent_blankline = require("ibl")

local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

vim.opt.list = true
vim.opt.listchars:append("space:⋅")

indent_blankline.setup({
    scope = {
        enabled = false,
    },
    indent = {
        char = "▏",
    },
    exclude = {
        filetypes = {
            "NvimTree",
            "alpha",
            "lazy",
            "code-action-menu-menu",
            "lsp-installer",
            "toggleterm",
            "help",
            "",
        },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({
    list = {
        { group = "IndentBlanklineChar", foreground = colors.grey_light },
        { group = "IndentBlanklineSpaceChar", foreground = colors.grey_light },
    },
})
