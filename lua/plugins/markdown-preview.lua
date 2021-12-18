-- Name: Markdown Preview
-- Description: Markdown preview
-- Link: https://github.com/iamcco/markdown-preview.nvim

local set_keymap = require("utils.set_keymap")

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>mp",
    actions = "<CMD>MarkdownPreviewToggle<CR>",
    description = "Toggle markdown preview in browse",
})
