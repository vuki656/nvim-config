-- Name: Git linker
-- Description: Get a repository file link from the editor
-- Link: https://github.com/ruifm/gitlinker.nvim

local git_linker = require("gitlinker")

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

git_linker.setup()

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>gl",
    actions = "<CMD>lua require('gitlinker').get_buf_range_url(mode, user_opts)<CR>",
    description = "Get a repository link to the currently opened buffer",
})
