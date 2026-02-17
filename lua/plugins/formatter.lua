-- Name: Conform
-- Description: Formatter
-- Link: https://github.com/stevearc/conform.nvim

local conform = require("conform")
local fidget_progress = require("fidget.progress")
local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

conform.setup({
    formatters_by_ft = {
        html = { "prettier" },
        yaml = { "prettier" },
        markdown = { "prettier" },
        xml = { "prettier" },
        vue = { "prettier" },
        prisma = { "prettier" },
        liquid = { "prettier" },
        json = { "fixjson", "prettier" },
        jsonc = { "fixjson", "prettier" },
        graphql = { "prettier" },
        css = { "stylelint", "prettier" },
        javascript = { "prettier" },
        typescript = { "prettier" },
        javascriptreact = { "prettier" },
        typescriptreact = { "prettier" },
        lua = { "stylua" },
        proto = { "buf" },
        sh = { "shfmt" },
        sql = { "sqlfluff" },
        toml = { "taplo" },
        python = { "isort", "black" },
        go = { "gofmt" },
        php = { "php_cs_fixer" },
        twig = { "prettier" },
        dotenv = { "trim_leading_whitespace", "trim_whitespace", "trim_newlines" },
    },

    formatters = {
        prettier = {
            prepend_args = {
                "--tab-width",
                "4",
                "--no-semi",
                "--ignore-path=''",
                "--config-precedence=prefer-file",
            },
        },
        black = {
            prepend_args = { "-l", "120", "-q" },
        },
        stylelint = {
            args = { "--fix", "$FILENAME" },
            stdin = false,
        },
        trim_leading_whitespace = {
            command = "sed",
            args = { "s/^[[:space:]]*//" },
            stdin = true,
        },
    },
    default_format_opts = {
        timeout_ms = 1000,
        lsp_format = "fallback",
    },
    notify_on_error = false,
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>lf",
            actions = function()
                local handle = fidget_progress.handle.create({
                    title = "Formatting",
                    lsp_client = { name = "conform" },
                })

                conform.format({ async = true }, function(error)
                    if error then
                        handle.message = "Failed"
                    else
                        handle.message = "Done"
                    end

                    handle:finish()
                end)
            end,
            description = "[Conform] Format current buffer",
        },
        {
            key = "<LEADER>le",
            actions = function()
                local handle = fidget_progress.handle.create({
                    title = "Formatting (eslint)",
                    lsp_client = { name = "conform" },
                })

                conform.format({ async = true, formatters = { "eslint_d" } }, function(error)
                    if error then
                        handle.message = "Failed"
                    else
                        handle.message = "Done"
                    end

                    handle:finish()
                end)
            end,
            description = "[Conform] Format with eslint_d",
        },
    },
})
