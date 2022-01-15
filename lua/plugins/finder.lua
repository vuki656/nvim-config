-- Name: Telescope
-- Description: Everything finder
-- Link: https://github.com/nvim-telescope/telescope.nvim

local telescope = require("telescope")
local actions = require("telescope.builtin")

local set_highlight = require("utils.set-highlight")
local set_keymap = require("utils.set-keymap")
local colors = require("utils.colors")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

telescope.setup({
    defaults = {
        path_display = { "tail" },
        file_ignore_patterns = {
            "package-lock.json",
            "node_modules",
            "yarn.lock",
            ".next",
            ".idea",
            ".yarn",
        },
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
            actions = actions.find_files,
            description = "Find git files in project",
        },
        {
            key = "<LEADER>ps",
            actions = actions.live_grep,
            description = "Find text in project",
        },
        {
            key = "<LEADER>pad",
            actions = actions.diagnostics,
            description = "Find project diagnostics (errors, warnings...)",
        },
        {
            key = "<LEADER>pr",
            actions = actions.lsp_references,
            description = "Find variable references in project",
        },
        {
            key = "<LEADER>pi",
            actions = actions.lsp_definitions,
            description = "Find variable definitions/implementations in project",
        },
        {
            key = "<LEADER>hl",
            actions = actions.highlights,
            description = "See all registered highlight groups",
        },
        {
            key = "<LEADER>gh",
            actions = actions.help_tags,
            description = "Find in manual pages",
        },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({ group = "TelescopePromptCounter", foreground = colors.orange })
