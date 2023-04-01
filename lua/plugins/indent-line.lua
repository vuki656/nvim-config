-- Name: Indent Blank Line
-- Description: Indent guidelines
-- Link: https://github.com/lukas-reineke/indent-blankline.nvim

local indent_blankline = require("indent_blankline")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")

indent_blankline.setup({
    char = "▏",
    filetype_exclude = {
        "NvimTree",
        "alpha",
        "packer",
        "code-action-menu-menu",
        "lsp-installer",
        "toggleterm",
        "help",
        "null-ls-info",
        "",
    },
})
