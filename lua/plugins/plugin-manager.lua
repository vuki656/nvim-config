-- Name: Packer
-- Description: Plugin manager
-- Link: https://github.com/wbthomason/packer.nvim

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>pas",
            actions = "<CMD>PackerSync<CR>",
            description = "Validate/Install all plugins",
        },
        {
            key = "<LEADER>pal",
            actions = "<CMD>PackerStatus<CR>",
            description = "List all installed plugins",
        },
    },
})
