-- Name: Formatter
-- Description: Linter/formatter invoker
-- Link: https://github.com/mhartington/formatter.nvim

local formatter = require("formatter")

local remap = vim.api.nvim_set_keymap

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

formatter.setup({
    filetype = {
        sh = {
            function()
                return {
                    exe = "beautysh",
                    args = { vim.api.nvim_buf_get_name(0) },
                    stdin = false,
                }
            end,
        },
        lua = {
            function()
                return {
                    exe = "stylua",
                    args = { "-" },
                    stdin = true,
                }
            end,
        },
        json = {
            function()
                vim.lsp.buf.range_formatting({}, { 0, 0 }, { vim.fn.line("$"), 0 })
            end,
        },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Format code
remap("n", "<leader>ff", ":FormatWrite<CR>", { silent = true, noremap = true })
