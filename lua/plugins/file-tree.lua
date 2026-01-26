-- Name: Nvim Tree
-- Description: File tree
-- Link: https://github.com/nvim-tree/nvim-tree.lua

local tree = require("nvim-tree")

local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")
local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- CONFIG -----------------------------------------------
------------------------------------------------------------------------------------------

local function on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    vim.keymap.set("n", "<C-]>", api.tree.change_root_to_node, opts("CD"))
    vim.keymap.set("n", "-", api.tree.change_root_to_parent, opts("Up"))
    vim.keymap.set("n", "<C-k>", api.node.show_info_popup, opts("Info"))
    vim.keymap.set("n", "<C-r>", api.fs.rename_sub, opts("Rename: Omit Filename"))
    vim.keymap.set("n", "<BS>", api.node.navigate.parent_close, opts("Close Directory"))
    vim.keymap.set("n", "<CR>", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", ".", api.node.run.cmd, opts("Run Command"))
    vim.keymap.set("n", "a", api.fs.create, opts("Create"))
    vim.keymap.set("n", "c", api.fs.copy.node, opts("Copy"))
    vim.keymap.set("n", "e", api.fs.rename_basename, opts("Rename: Basename"))
    vim.keymap.set("n", "g?", api.tree.toggle_help, opts("Help"))
    vim.keymap.set("n", "gy", api.fs.copy.absolute_path, opts("Copy Absolute Path"))
    vim.keymap.set("n", "I", api.tree.toggle_gitignore_filter, opts("Toggle Filter: Git Ignore"))
    vim.keymap.set("n", "p", api.fs.paste, opts("Paste"))
    vim.keymap.set("n", "r", api.fs.rename, opts("Rename"))
    vim.keymap.set("n", "R", api.tree.reload, opts("Refresh"))
    vim.keymap.set("n", "W", api.tree.collapse_all, opts("Collapse"))
    vim.keymap.set("n", "x", api.fs.cut, opts("Cut"))
    vim.keymap.set("n", "<2-LeftMouse>", api.node.open.edit, opts("Open"))
    vim.keymap.set("n", "<2-RightMouse>", api.tree.change_root_to_node, opts("CD"))
    vim.keymap.set("n", "bd", api.marks.bulk.delete, opts("Delete Bookmarked"))
    vim.keymap.set("n", "bmv", api.marks.bulk.move, opts("Move Bookmarked"))
    vim.keymap.set("n", "m", api.marks.toggle, opts("Toggle Bookmark"))
    vim.keymap.set("n", "d", api.fs.trash, opts("Trash"))
end

tree.setup({
    on_attach = on_attach,
    view = {
        width = 60,
    },
    respect_buf_cwd = false,
    renderer = {
        special_files = {},
        highlight_git = true,
        icons = {
            show = {
                git = false,
                folder = true,
                file = true,
                folder_arrow = false,
            },
        },
        indent_markers = {
            enable = true,
        },
    },
    git = {
        ignore = false,
        show_on_dirs = true,
    },
    sort_by = "case_sensitive",
    notify = {
        threshold = vim.log.levels.ERROR,
    },
    trash = {
        cmd = "trash-put ",
    },
})

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({
    list = {
        { group = "NvimTreeGitFileNewHl", foreground = colors.green },
        { group = "NvimTreeGitStaged", foreground = colors.green },
        { group = "NvimTreeGitFileRenamedHL", foreground = colors.yellow },
        { group = "NvimTreeGitFileDirtyHl", foreground = colors.yellow },
        { group = "NvimTreeGitFolderDeletedHl", foreground = colors.red },
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
                vim.cmd("NvimTreeCollapse")
                vim.cmd("NvimTreeFindFile")
            end,
            description = "Collapse all tree nodes and focus opened buffer",
        },
    },
})
