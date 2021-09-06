local nvim_lsp = require("lspconfig")
local ts_utils = require("nvim-lsp-ts-utils")
local cmp = require("cmp_nvim_lsp")

local remap = vim.api.nvim_set_keymap

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp.update_capabilities(capabilities)
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
        "documentation",
        "detail",
        "additionalTextEdits",
    },
}

nvim_lsp.tsserver.setup({
    on_attach = function(client)
        ts_utils.setup({
            eslint_enable_code_actions = true,
            eslint_enable_disable_comments = true,
            eslint_disable_if_no_config = true,
            eslint_bin = "eslint_d",
            eslint_enable_diagnostics = true,
            eslint_show_rule_id = true,
            enable_formatting = true,
            update_imports_on_move = true,
            formatter = "eslint_d",
            eslint_args = {
                "-f",
                "json",
                "--stdin",
                "--stdin-filename",
                "$FILENAME",
            },
            formatter_args = {
                "--fix-to-stdout",
                "--stdin",
                "--stdin-filename",
                "$FILENAME",
            },
        })

        client.resolved_capabilities.document_formatting = false
        ts_utils.setup_client(client)
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
