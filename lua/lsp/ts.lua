local nvim_lsp = require "lspconfig"
local ts_utils = require("nvim-lsp-ts-utils")

local remap = vim.api.nvim_set_keymap

nvim_lsp.tsserver.setup {
    on_attach = function(client)
        ts_utils.setup {
            eslint_bin = "eslint_d",
            eslint_args = { "-f", "json", "--stdin", "--stdin-filename", "$FILENAME" },
            eslint_enable_disable_comments = true,
            eslint_enable_diagnostics = true,
            enable_formatting = true,
            formatter = "eslint_d",
            formatter_args = {
                "--fix-to-stdout",
                "--stdin",
                "--stdin-filename",
                "$FILENAME",
            },
            format_on_save = false,
        }

        client.resolved_capabilities.document_formatting = false
        ts_utils.setup_client(client)
    end,
}

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Apply first lsp fix
remap("n", "<leader>qf", ":TSLspFixCurrent<CR>", { noremap = true, silent = true })

-- Rename file
remap("n", "<leader>fr", ":TSLspRenameFile<CR>", { noremap = true, silent = true })

