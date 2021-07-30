-- Name: Telescope
-- Description: Finder
-- Link: https://github.com/nvim-telescope/telescope.nvim

local telescope = require("telescope")
local vars = require("utils.vars")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

telescope.setup({
    defaults = {
        path_display = { "tail" },
    },
})

telescope.load_extension("fzy_native")

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

----------------------------------- FIND -------------------------------------------------

-- Find git files in project
vars.remap.fn("n", "<leader>pf", ":Telescope git_files<CR>", vars.remap.opts)

-- Find text in project
vars.remap.fn("n", "<leader>ps", ":Telescope live_grep<CR>", vars.remap.opts)

----------------------------------- LSP --------------------------------------------------

-- Find document diagnostics
vars.remap.fn("n", "<leader>pd", ":Telescope lsp_document_diagnostics<CR>", vars.remap.opts)

-- Find project diagnostics
vars.remap.fn("n", "<leader>pad", ":Telescope lsp_workspace_diagnostics<CR>", vars.remap.opts)

-- Find references
vars.remap.fn("n", "<leader>pr", ":Telescope lsp_references<CR>", vars.remap.opts)

-- Find definitions
vars.remap.fn("n", "<leader>pi", ":Telescope lsp_definitions<CR>", vars.remap.opts)

----------------------------------- GIT --------------------------------------------------

-- List branches
vars.remap.fn("n", "<leader>gba", ":Telescope git_branches<CR>", vars.remap.opts)

-- List branch commits
vars.remap.fn("n", "<leader>gbc", ":Telescope git_commits<CR>", vars.remap.opts)

-- List file commits
vars.remap.fn("n", "<leader>gfc", ":Telescope git_bcommits<CR>", vars.remap.opts)
