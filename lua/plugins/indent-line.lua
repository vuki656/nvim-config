-- Name: Indent Blank Line
-- Description: Indent guidelines
-- Link: https://github.com/lukas-reineke/indent-blankline.nvim

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

require("indent_blankline").setup({
    char = "▏",
    filetype_exclude = { "NvimTree", "alpha", "packer" },
})
