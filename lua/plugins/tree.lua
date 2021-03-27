------------------------------------------------------------------------------------------
----------------------------------- CONFIGURATION ----------------------------------------
------------------------------------------------------------------------------------------

vim.g.nvim_tree_indent_markers = 1                                   -- Display indent markers
vim.g.nvim_tree_git_hl = 1                                           -- Display git status in file names

-- Don't show listed dirs
vim.g.nvim_tree_ignore = {
    ".git",
    "node_modules",
    ".cache"
}    

-- Custom icons 
vim.g.nvim_tree_icons = {
    default = "",
    symlink = "",
    git = {
        unstaged = "✗",
        staged = "✓",
        unmerged = "",
        renamed = "➜",
        untracked = "★"
    },
    folder = {
        default = "",
        open = "",
        empty_open = "",
        empty = "",
        symlink = "",
    }
}

-- Set where git appears
vim.g.nvim_tree_show_icons = {
    git = 0,
    folders = 1,
    files = 1
}

vim.cmd([[
    highlight NvimTreeGitNew guifg=#98c379
    highlight NvimTreeGitRenamed guifg=#ff8f00
    highlight NvimTreeGitDirty guifg=#60aae0
    highlight NvimTreeFolderName guifg=#a5afbe
    highlight NvimTreeEmptyFolderName guifg=#a5afbe
    highlight NvimTreeFolderIcon guifg=#a5afbe
]])

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------


