-- Name: Markdown Preview
-- Description: Markdown file preview in the browser
-- Link: https://github.com/iamcco/markdown-preview.nvim

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>mp",
    actions = "<CMD>MarkdownPreviewToggle<CR>",
    description = "Toggle markdown preview in browse",
})
