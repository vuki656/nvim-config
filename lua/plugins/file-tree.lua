-- Name: Nvim Tree
-- Description: File tree
-- Link: https://github.com/kyazdani42/nvim-tree.lua

local colors = require("utils.colors")
local vars = require("utils.vars")

------------------------------------------------------------------------------------------
----------------------------------- CONFIG -----------------------------------------------
------------------------------------------------------------------------------------------

-- Display indent markers
vim.g.nvim_tree_indent_markers = 1

-- Display git status in file names
vim.g.nvim_tree_git_hl = 1

-- Don't show listed dirs
vim.g.nvim_tree_ignore = {
    ".git",
}

-- Set file tree width
vim.g.nvim_tree_width = 40

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
vim.g.nvim_tree_show_icons = { git = 0, folders = 1, files = 1 }

-- Don't highlight any files
vim.g.nvim_tree_special_files = {}

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

vim.cmd([[highlight NvimTreeGitNew              guifg=]] .. colors.green)
vim.cmd([[highlight NvimTreeGitRenamed          guifg=]] .. colors.yellow)
vim.cmd([[highlight NvimTreeGitDirty            guifg=]] .. colors.yellow)
vim.cmd([[highlight NvimTreeIndentMarker        guifg=]] .. colors.transparent)
vim.cmd([[highlight NvimTreeFolderName          guifg=]] .. colors.white)
vim.cmd([[highlight NvimTreeEmptyFolderName     guifg=]] .. colors.white)
vim.cmd([[highlight NvimTreeFolderIcon          guifg=]] .. colors.white)
vim.cmd([[highlight NvimTreeOpenedFolderName    guifg=]] .. colors.white)

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Toggle file tree
vars.remap.fn("n", "<C-n>", ":NvimTreeToggle<CR>", vars.remap.opts)

-- Find opened file in tree
vars.remap.fn("n", "<leader>to", ":NvimTreeFindFile<CR>", vars.remap.opts)

-- Refresh tree
vars.remap.fn("n", "<leader>tr", ":NvimTreeRefresh<CR>", vars.remap.opts)
