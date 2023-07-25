-- Name: Highlight undo
-- Description: Highlights undo when triggered
-- Link: https://github.com/tzachar/highlight-undo.nvim

local highlight = require("highlight-undo")

local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

highlight.setup()

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({ group = "HighlightUndo", foreground = colors.background, background = colors.red })
