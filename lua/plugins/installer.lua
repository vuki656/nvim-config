-- Name: Mason
-- Description: Neovim everything installer
-- Link: https://github.com/williamboman/mason.nvim

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
    automatic_installation = true,
    ensure_installed = {
        "bufls",
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
        "tsserver",
        "vimls",
        "yamlls",
        "eslint",
        "graphql",
    },
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
        "prettier",
        "rust-analyzer",
        "shellcheck",
        "shfmt",
        "stylelint",
        "stylua",
        "yamllint",
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
