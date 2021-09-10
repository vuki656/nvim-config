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
        file_ignore_patterns = { "node_modules", "yarn.lock", ".next", ".idea", ".yarn" },
    },
})

telescope.load_extension("fzy_native")

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

----------------------------------- FIND -------------------------------------------------

-- Find git files in project
vars.remap.fn("n", "<leader>pf", ":Telescope find_files<CR>", vars.remap.opts)

-- Find text in project
vars.remap.fn("n", "<leader>ps", ":Telescope live_grep<CR>", vars.remap.opts)

----------------------------------- LSP --------------------------------------------------

-- Find project diagnostics
vars.remap.fn("n", "<leader>pad", ":Telescope lsp_workspace_diagnostics<CR>", vars.remap.opts)

-- Find references
vars.remap.fn("n", "<leader>pr", ":Telescope lsp_references<CR>", vars.remap.opts)

-- Find definitions
vars.remap.fn("n", "<leader>pi", ":Telescope lsp_definitions<CR>", vars.remap.opts)

----------------------------------- GIT --------------------------------------------------

-- Find file commits
vars.remap.fn("n", "<leader>fh", ":Telescope git_bcommits<CR>", vars.remap.opts)

----------------------------------- MISC --------------------------------------------------

-- Find vim man pages
vars.remap.fn("n", "<leader>gh", ":Telescope help_tags<CR>", vars.remap.opts)

-- Find neovim remaps
vars.remap.fn("n", "<leader>gr", ":Telescope keymaps<CR>", vars.remap.opts)
