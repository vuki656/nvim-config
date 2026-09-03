-- Name: Pointer
-- Description: Claude points at code from the terminal
-- Link: https://github.com/vuki656/pointer.nvim

local colors = require("utils.colors")
local pointer = require("pointer")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

pointer.setup({
    colors = {
        note = colors.green,
        warn = colors.orange,
    },
})
