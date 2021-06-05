local remap = vim.api.nvim_set_keymap 

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

require("trouble").setup {}

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Open problems for the whole projects
remap("n", "<leader>xa", "<cmd>Trouble lsp_workspace_diagnostics<cr>", { silent = true, noremap = true })

-- Open projects for the curent buffer
remap("n", "<leader>xw", "<cmd>Trouble lsp_document_diagnostics<cr>",{ silent = true, noremap = true})

-- Open all references of variable under the cursor
remap("n", "<leader>xr", "<cmd>Trouble lsp_references<cr>",{ silent = true, noremap = true})


