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

vim.cmd([[
    highlight NvimTreeGitNew guifg=#bfea69
    highlight NvimTreeGitRenamed guifg=#61afef
    highlight NvimTreeGitDirty guifg=#61afef

    highlight NvimTreeIndentMarker guifg=#333840
    highlight NvimTreeFolderName guifg=#a5afbe
    highlight NvimTreeEmptyFolderName guifg=#a5afbe
    highlight NvimTreeFolderIcon guifg=#a5afbe
]])
