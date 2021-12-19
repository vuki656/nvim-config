-- Name: Telescope
-- Description: Finder
-- Link: https://github.com/nvim-telescope/telescope.nvim

local telescope = require("telescope")

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

telescope.setup({
    defaults = {
        path_display = { "tail" },
        file_ignore_patterns = { "node_modules", "yarn.lock", ".next", ".idea", ".yarn" },
    },
})

telescope.load_extension("fzy_native")

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>pf",
            actions = "<CMD>Telescope find_files<CR>",
            description = "Find git files in project",
        },
        {
            key = "<LEADER>ps",
            actions = "<CMD>Telescope live_grep<CR>",
            description = "Find text in projects",
        },
        {
            key = "<LEADER>pad",
            actions = "<CMD>Telescope diagnostics<CR>",
            description = "Find project diagnostics (errors, warnings...)",
        },
        {
            key = "<LEADER>pr",
            actions = "<CMD>Telescope lsp_references<CR>",
            description = "Find variable references in project",
        },
        {
            key = "<LEADER>pi",
            actions = "<CMD>Telescope lsp_definitions<CR>",
            description = "Find variable definitions/implementations in project",
        },
        {
            key = "<LEADER>gh",
            actions = "<CMD>Telescope help_tags<CR>",
            description = "Find vim manual pages",
        },
    },
})
