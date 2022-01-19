-- Name: Scrollbar
-- Description: Scrollbar with diagnostics
-- Link: https://github.com/petertriho/nvim-scrollbar
--
-- local scrollbar = require("scrollbar")
--
-- local colors = require("utils.colors")
--
-- ------------------------------------------------------------------------------------------
-- ----------------------------------- CONFIG -----------------------------------------------
-- ------------------------------------------------------------------------------------------
--
-- scrollbar.setup({
--     excluded_filetypes = {
--         "NvimTree",
--         "alpha",
--         "docker-term",
--         "git-term",
--         "TelescopePropmt",
--         "",
--     },
--     handle = {
--         color = colors.background_light,
--     },
--     marks = {
--         Error = { text = { "▀" }, color = colors.red },
--         Warn = { text = { "▀" }, color = colors.orange },
--         Info = { text = { "▀" }, color = colors.blue },
--         Hint = { text = { "▀" }, color = colors.yellow },
--         Misc = { text = { "▀" }, color = colors.green },
--     },
-- })
--

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
