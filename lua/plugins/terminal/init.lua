-- Name: Toggleterm
-- Description: Builtin terminal navigator
-- Link: https://github.com/akinsho/nvim-toggleterm.lua

local toggleterm = require("toggleterm")

local set_keymap = require("utils.set-keymap")

require("plugins.terminal.keymaps.toggle-git-buffer")
require("plugins.terminal.keymaps.toggle-docker-buffer")
require("plugins.terminal.keymaps.toggle-terminal-buffer")

------------------------------------------------------------------------------------------
------------------------------------ SETUP -----------------------------------------------
------------------------------------------------------------------------------------------

toggleterm.setup({
    shade_terminals = false,
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>lg",
            actions = "<CMD>lua toggle_git_buffer()<CR>",
            description = "Open a floating buffer with lazygit",
        },
        {
            key = "<LEADER>ld",
            actions = "<CMD>lua toggle_docker_buffer()<CR>",
            description = "Open a floating buffer with lazydocker",
        },
        {
            key = "<LEADER>tm",
            actions = "<CMD>lua toggle_terminal_buffer()<CR>",
            description = "Open a floating buffer with a blank terminal",
        },
    },
})
