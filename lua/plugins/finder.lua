-- Name: Telescope
-- Description: Everything finder
-- Link: https://github.com/nvim-telescope/telescope.nvim

local actions = require("telescope.builtin")
local telescope = require("telescope")

local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")
local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

telescope.setup({
    extensions = {
        fzf = {},
    },
    pickers = {
        live_grep = {
            additional_args = function()
                return { "--hidden", "--smart-case", "--trim", "--max-columns=200" }
            end,
        },
    },
    defaults = {
        mappings = {
            i = {
                ["<C-f>"] = require("telescope.actions").to_fuzzy_refine,
            },
        },
        path_display = { "filename_first" },
        file_ignore_patterns = {
            "package-lock.json",
            "yarn.lock",
            ".next",
            ".idea",
            ".yarn",
            ".git/",
        },
    },
})

telescope.load_extension("fzf")

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>pg",
            actions = actions.git_status,
            description = "[Telescope] Find changed git files",
        },
        {
            key = "<LEADER>pc",
            actions = actions.git_bcommits,
            description = "[Telescope] Browse buffer commits",
        },
        {
            key = "<LEADER>pf",
            actions = function()
                actions.find_files({
                    hidden = true,
                })
            end,
            description = "[Telescope] Find files in project",
        },
        {
            key = "<LEADER>ps",
            actions = actions.live_grep,
            description = "[Telescope] Search text in project",
        },
        {
            key = "<LEADER>pr",
            actions = actions.lsp_references,
            description = "[Telescope] Find LSP references",
        },
        {
            key = "<LEADER>pi",
            actions = actions.lsp_implementations,
            description = "[Telescope] Find LSP implementations",
        },
        {
            key = "<LEADER>pd",
            actions = actions.lsp_definitions,
            description = "[Telescope] Find LSP definitions",
        },
        {
            key = "<LEADER>pa",
            actions = actions.help_tags,
            description = "[Telescope] Find in help pages",
        },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({
    list = {
        { group = "TelescopePromptCounter", foreground = colors.orange },
        { group = "TelescopeResultsLineNr", foreground = colors.white },
    },
})
