-- Name: Markdown Preview
-- Description: Markdown preview
-- Link: https://github.com/iamcco/markdown-preview.nvim

local vars = require("utils.vars")

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Toggle preview
vars.remap.fn("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", vars.remap.opts)
