-- Name: Nvim Tree
-- Description: File tree
-- Link: https://github.com/kyazdani42/nvim-tree.lua

local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")
local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- CONFIG -----------------------------------------------
------------------------------------------------------------------------------------------

require("nvim-tree").setup({
    view = {
        width = 40,
    },
    respect_buf_cwd = true,
    renderer = {
        special_files = {},
        highlight_git = true,
        icons = {
            show = {
                git = false,
                folder = true,
                file = true,
            },
        },
        indent_markers = {
            enable = true,
        },
    },
    git = {
        ignore = false,
        show_on_dirs = false,
    },
    sort_by = "case_sensitive",
})

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({
    list = {
        { group = "NvimTreeGitNew", foreground = colors.green },
        { group = "NvimTreeGitRenamed", foreground = colors.yellow },
        { group = "NvimTreeGitDirty", foreground = colors.yellow },
        { group = "NvimTreeIndentMarker", foreground = colors.transparent },
        { group = "NvimTreeFolderName", foreground = colors.white },
        { group = "NvimTreeEmptyFolderName", foreground = colors.white },
        { group = "NvimTreeFolderIcon", foreground = colors.white },
        { group = "NvimTreeWinSeparator", foreground = colors.background_light },
        { group = "NvimTreeOpenedFolderName", foreground = colors.white },
        { group = "NvimTreeRootFolder", foreground = colors.grey },
        { group = "NvimTreeExecFile", foreground = colors.red },
        { group = "NvimTreeImageFile", foreground = colors.red },
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
                vim.cmd("NvimTreeToggle")
            end,
            description = "Toggle file tree",
        },
        {
            key = "<LEADER>to",
            actions = function()
                vim.cmd("NvimTreeFindFile")
            end,
            description = "Find opened file in tree",
        },
        {
            key = "<LEADER>tr",
            actions = function()
                vim.cmd("NvimTreeRefresh")
            end,
            description = "Refresh tree (git, nodes...)",
        },
        {
            key = "<LEADER>tk",
            actions = function()
                require("nvim-tree.lib").collapse_all()
                vim.cmd("NvimTreeFindFile")
            end,
            description = "Collapse all tree nodes and focus opened buffer",
        },
    },
})
