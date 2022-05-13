-- Name: Markdown Preview
-- Description: Markdown file preview in the browser
-- Link: https://github.com/davidgranstrom/nvim-markdown-preview
local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>mp",
    actions = function()
        vim.cmd("MarkdownPreview")
    end,
    description = "Toggle markdown preview in browse",
})
