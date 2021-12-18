-- Name: Nvim Tree
-- Description: File tree
-- Link: https://github.com/kyazdani42/nvim-tree.lua

local colors = require("utils.colors")
local vars = require("utils.vars")
local set_highlight = require("utils.set_highlight")

------------------------------------------------------------------------------------------
----------------------------------- CONFIG -----------------------------------------------
------------------------------------------------------------------------------------------

-- Display indent markers
vim.g.nvim_tree_indent_markers = 1

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
vim.g.nvim_tree_show_icons = { git = 0, folders = 1, files = 1 }

-- Don't highlight any files
vim.g.nvim_tree_special_files = {}

-- Has to be imported here because of the compatibility with the old config
require("nvim-tree").setup({
    view = {
        width = 40,
    },
    filters = {
        custom = { ".git" },
    },
    update_cwd = true,
    update_focused_file = {
        enable = true,
        update_cwd = true,
    },
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
    },
})

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Toggle file tree
vars.remap.fn("n", "<C-n>", ":NvimTreeToggle<CR>", vars.remap.opts)

-- Find opened file in tree
vars.remap.fn("n", "<leader>to", ":NvimTreeOpen<CR> :NvimTreeFindFile<CR>", vars.remap.opts)

-- Refresh tree
vars.remap.fn("n", "<leader>tr", ":NvimTreeRefresh<CR>", vars.remap.opts)

----------------------------------- TREE COLLAPSE ----------------------------------------------

local function collapse_tree_node(node)
    local entries = node.entries

    if not entries then
        return
    end

    for _, entry in pairs(entries) do
        collapse_tree_node(entry)
    end

    node.open = false
end

function collapse_tree()
    local lib = require("nvim-tree.lib")

    collapse_tree_node(lib.Tree)

    lib.refresh_tree()
end

vim.api.nvim_set_keymap("n", "<leader>tk", ":lua collapse_tree()<CR>", { noremap = true, silent = true })
