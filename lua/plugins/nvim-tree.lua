-- Name: Nvim Tree
-- Description: File tree
-- Link: https://github.com/kyazdani42/nvim-tree.lua

local colors = require('utils.colors')

local remap = vim.api.nvim_set_keymap 

------------------------------------------------------------------------------------------
----------------------------------- CONFIG -----------------------------------------------
------------------------------------------------------------------------------------------

vim.g.nvim_tree_indent_markers = 1                                   -- Display indent markers
vim.g.nvim_tree_git_hl = 1                                           -- Display git status in file names
vim.g.nvim_tree_update_cwd = 0                                       -- Don't update cwd on 

-- Don't show listed dirs
vim.g.nvim_tree_ignore = {
    ".git",
    "node_modules",
    ".cache",
    ".idea"
}

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
    }
}

-- Set where git appears
vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1
}

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
remap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })

-- Find opened file in tree
remap('n', '<leader>to', ':NvimTreeFindFile<CR>', { noremap = true, silent = true })
