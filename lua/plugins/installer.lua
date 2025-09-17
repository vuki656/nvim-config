-- Name: Mason
-- Description: Neovim everything installer
-- Link: https://github.com/mason-org/mason.nvim

local set_keymap = require("utils.set-keymap")

local installer = require("mason")
local installer_lsp = require("mason-lspconfig")
local installer_tools = require("mason-tool-installer")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

installer.setup({
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
    ensure_installed = {
        "buf_ls",
        "bashls",
        "cssls",
        "cssmodules_ls",
        "docker_compose_language_service",
        "dockerls",
        "html",
        "jsonls",
        "lemminx",
        "lua_ls",
        "prismals",
        "stylelint_lsp",
        "taplo",
        "vimls",
        "yamlls",
        "graphql",
        "pyright",
        "groovyls",
        "vtsls",
        "css_variables",
        "terraformls",
        "gopls",
        "tailwindcss",
        "vue_ls",
    },
    automatic_enable = true,
})

installer_tools.setup({
    ensure_installed = {
        "protolint",
        "actionlint",
        "cspell",
        "eslint_d",
        "fixjson",
        "hadolint",
        "luacheck",
        { "prettier", version = "3.6.0" },
        "rust-analyzer",
        "shellcheck",
        "shfmt",
        "stylelint",
        "terraform",
        "stylua",
        "yamllint",
        "black",
        "sqlfluff",
        "buf",
        "tflint"
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
    description = "Open lsp installer popup buffer",
})
