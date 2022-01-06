-- Name: Packer
-- Description: Nvim plugin manager
-- Link: https://github.com/wbthomason/packer.nvim

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>pas",
            actions = function()
                vim.cmd("PackerSync")
            end,
            description = "Validate/Install all plugins",
        },
        {
            key = "<LEADER>pal",
            actions = function()
                vim.cmd("PackerStatus")
            end,
            description = "List all installed plugins",
        },
    },
})
