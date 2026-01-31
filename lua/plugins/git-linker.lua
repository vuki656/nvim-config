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
    actions = git_linker.get_buf_range_url,
    description = "[GitLinker] Copy git permalink to clipboard",
})
