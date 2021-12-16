local nvim_lsp = require("lspconfig")

local capabilities = require("lsp.capabilities")

local vars = require("utils.vars")

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
vars.remap.fn("n", "<leader>qf", ":TSLspFixCurrent<CR>",vars.remap.opts)

-- Rename file
vars.remap.fn("n", "<leader>fr", ":TSLspRenameFile<CR>", vars.remap.opts)

-- Import all
vars.remap.fn("n", "<leader>fi", ":TSLspImportAll<CR>", vars.remap.opts)
