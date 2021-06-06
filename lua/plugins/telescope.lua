local actions = require('telescope.actions')
local trouble = require("trouble.providers.telescope")
local telescope = require("telescope")

local remap = vim.api.nvim_set_keymap

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

require('telescope').setup{
    -- FIXME: Currently doesent work when setup here => https://github.com/nvim-telescope/telescope.nvim/issues/895#issuecomment-855367980
    -- Should be fixed here: https://github.com/nvim-telescope/telescope.nvim/pull/839
    -- When fixed, remove shorten_path = true sufix from git files and text pickers below
    shorten_path=true 
}

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Find git files in project
remap("n", "<leader>pf", "<cmd>Telescope git_files shorten_path=true<cr>", { noremap = true, silent = true })

-- Find text in project
remap("n", "<leader>pt", "<cmd>Telescope live_grep shorten_path=true<cr>", { noremap = true, silent = true })

-- Find document diagnostics
remap("n", "<leader>pd", "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<CR>", { noremap = true, silent = true })

-- Find project diagnostics
remap("n", "<leader>pad", "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>", { noremap = true, silent = true })

-- Find references
remap("n", "<leader>pr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", { noremap = true, silent = true })

-- Find definitions
remap("n", "<leader>pi", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", { noremap = true, silent = true })

-- TODO: git pickerrs
-- TODO: vim pickers
