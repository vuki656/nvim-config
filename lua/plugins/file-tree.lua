-- Name: Neo tree
-- Description: File tree
-- Link: https://github.com/nvim-neo-tree/neo-tree.nvim

local file_tree = require("neo-tree")

local set_keymap = require("utils.set-keymap")
local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")
------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

file_tree.setup({
    default_component_configs = {
        git_status = {
            symbols = {
                added = "",
                modified = "",
                deleted = "",
                renamed = "",
                untracked = "",
                ignored = "",
                unstaged = "",
                staged = "",
                conflict = "",
            },
        },
        window = {
            filesystem = {
                filtered_items = {
                    use_libuv_file_watcher = true,
                },
            },
        },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- HIGHLIGHTS -------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({
    list = {
        { group = "NeoTreeDirectoryIcon", foreground = colors.white },
        { group = "NeoTreeDirectoryName", foreground = colors.white },
        { group = "NeoTreeGitModified", foreground = colors.orange },
        { group = "NeoTreeTitleBar", foreground = colors.white },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<C-n>",
            actions = function()
                vim.cmd("NeoTreeShowToggle")
            end,
            description = "Toggle file tree",
        },
        {
            key = "<LEADER>to",
            actions = function()
                vim.cmd.Neotree("reveal")
            end,
            description = "Find opened file in tree",
        },
        {
            key = "<LEADER>tk",
            actions = function()
                vim.cmd.Neotree("focus")
                vim.api.nvim_input("C")
                vim.api.nvim_input("C")
                vim.api.nvim_input("C")
                vim.api.nvim_input("C")
                vim.api.nvim_input("C")
                vim.api.nvim_input("C")
                vim.api.nvim_input("C")
                vim.api.nvim_input("C")
                vim.api.nvim_input("C")
                vim.api.nvim_input("C")
            end,
            description = "Collapse all tree nodes",
        },
    },
})
