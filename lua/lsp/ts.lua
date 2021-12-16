local nvim_lsp = require("lspconfig")

local capabilities = require("lsp.capabilities")

local remap = vim.api.nvim_set_keymap

nvim_lsp.tsserver.setup({
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
    end,
    capabilities = capabilities,
})

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Apply first lsp fix
remap("n", "<leader>qf", ":TSLspFixCurrent<CR>", { noremap = true, silent = true })

-- Rename file
remap("n", "<leader>fr", ":TSLspRenameFile<CR>", { noremap = true, silent = true })

-- Import all
remap("n", "<leader>fi", ":TSLspImportAll<CR>", { noremap = true, silent = true })
