local nvim_lsp = require "lspconfig"
local ts_utils = require("nvim-lsp-ts-utils")

nvim_lsp.tsserver.setup {
    on_attach = function(client, bufnr)
        client.resolved_capabilities.document_formatting = false

        ts_utils.setup {
            eslint_bin = "eslint_d",
            eslint_args = {"-f", "json", "--stdin", "--stdin-filename", "$FILENAME"},
            eslint_enable_disable_comments = true,
            eslint_enable_diagnostics = true,
            enable_formatting = true,
            formatter = "eslint_d",
            formatter_args = {
                "--fix-to-stdout",
                "--stdin",
                "--stdin-filename",
                "$FILENAME"
            },
            format_on_save = false,
        }

        -- no default maps, so you may want to define some here
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", {silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, "n", "qq", ":TSLspFixCurrent<CR>", {silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", {silent = true})
        vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", {silent = true})
    end
}

vim.lsp.buf_request = ts_utils.buf_request
