-- Name: Nvim Tree
-- Description: File tree
-- Link: https://github.com/kyazdani42/nvim-tree.lua

local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")
local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- CONFIG -----------------------------------------------
------------------------------------------------------------------------------------------

-- Display git status in file names
vim.g.nvim_tree_git_hl = 1

-- Custom icons
vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    folder = {
        default = "",
        open = "ﱮ",
        empty_open = "ﱮ",
        empty = "",
        symlink = "",
    },
}

-- Set where git appears
vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1,
}

-- Don't highlight any files
vim.g.nvim_tree_special_files = {}

require("nvim-tree").setup({
    view = {
        width = 60,
    },
    renderer = {
        indent_markers = {
            enable = true,
        },
    },
    git = {
        ignore = false,
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
