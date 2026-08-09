-- Name: Mason
-- Description: Neovim everything installer
-- Link: https://github.com/mason-org/mason.nvim

local lsp = require("lsp")
local get_mason_registry = require("utils.get-mason-registry")
local set_keymap = require("utils.set-keymap")

local installer = require("mason")
local installer_lsp = require("mason-lspconfig")
local installer_tools = require("mason-tool-installer")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

installer.setup({
    registries = { get_mason_registry() },
    ui = {
        border = "single",
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    },
})

installer_lsp.setup({
    ensure_installed = lsp.servers,
    automatic_enable = {
        exclude = {
            "tailwindcss",
            "vtsls",
            "vue_ls",
        },
    },
})

installer_tools.setup({
    ensure_installed = {
        "js-debug-adapter",
        "protolint",
        "actionlint",
        "cspell",
        "eslint_d",
        "fixjson",
        "hadolint",
        "luacheck",
        "prettier",
        "rust-analyzer",
        "shellcheck",
        "shfmt",
        "stylelint",
        "terraform",
        "stylua",
        "yamllint",
        "sqlfluff",
        "buf",
        "tflint",
        "php-cs-fixer",
        "phpstan",
        "phpcs",
        "ruff",
        "uv",
    },
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>ls",
    actions = function()
        vim.cmd("Mason")
    end,
    description = "[Mason] Open LSP installer",
})
