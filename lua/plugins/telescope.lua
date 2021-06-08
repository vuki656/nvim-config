-- Name: Telescope
-- Description: Finder
-- Link: https://github.com/nvim-telescope/telescope.nvim
local telescope = require("telescope")

local remap = vim.api.nvim_set_keymap

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

telescope.setup {
    -- FIXME: Currently doesent work when setup here => https://github.com/nvim-telescope/telescope.nvim/issues/895#issuecomment-855367980
    -- Should be fixed here: https://github.com/nvim-telescope/telescope.nvim/pull/839
    -- When fixed, remove shorten_path = true sufix from git files and text pickers below
    shorten_path = true,
}

telescope.load_extension("fzy_native")

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

----------------------------------- FIND -------------------------------------------------

-- Find git files in project
remap("n", "<leader>pf", ":Telescope git_files shorten_path=true<CR>", { noremap = true, silent = true })

-- Find text in project
remap("n", "<leader>ps", ":Telescope live_grep shorten_path=true<CR>", { noremap = true, silent = true })

----------------------------------- LSP --------------------------------------------------

-- Find document diagnostics
remap("n", "<leader>pd", ":Telescope lsp_document_diagnostics<CR>", { noremap = true, silent = true })

-- Find project diagnostics
remap("n", "<leader>pad", ":Telescope lsp_workspace_diagnostics<CR>", { noremap = true, silent = true })

-- Find references
remap("n", "<leader>pr", ":Telescope lsp_references<CR>", { noremap = true, silent = true })

-- Find definitions
remap("n", "<leader>pi", ":Telescope lsp_definitions<CR>", { noremap = true, silent = true })

----------------------------------- GIT --------------------------------------------------

-- List branches
remap("n", "<leader>gb", ":Telescope git_branches<CR>", { noremap = true, silent = true })

-- List branch commits
remap("n", "<leader>gc", ":Telescope git_commits<CR>", { noremap = true, silent = true })

-- List file commits
remap("n", "<leader>gfc", ":Telescope git_bcommits<CR>", { noremap = true, silent = true })
