-- Name: Toggleterm
-- Description: Builtin terminal navigator
-- Link: https://github.com/akinsho/nvim-toggleterm.lua

local toggleterm = require("toggleterm")

local set_keymap = require("utils.set-keymap")

local toggle_git_buffer = require("plugins.terminal.keymaps.toggle-git-buffer")
local toggle_docker_buffer = require("plugins.terminal.keymaps.toggle-docker-buffer")
local toggle_terminal_buffer = require("plugins.terminal.keymaps.toggle-terminal-buffer")
local toggle_script_runner_buffer = require("plugins.terminal.keymaps.toggle-script-runner-buffer")

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
            actions = toggle_git_buffer,
            description = "Open a floating buffer with lazygit",
        },
        {
            key = "<LEADER>ld",
            actions = toggle_docker_buffer,
            description = "Open a floating buffer with lazydocker",
        },
        {
            key = "<LEADER>tm",
            actions = toggle_terminal_buffer,
            description = "Open a floating buffer with a blank terminal",
        },
        {
            key = "<LEADER>ras",
            actions = toggle_script_runner_buffer,
            description = "Choose a package.json script to run",
        },
    },
})
