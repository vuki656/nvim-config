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
})

installer_tools.setup({
    ensure_installed = {
        "actionlint",
        "bash-language-server",
        "cspell",
        "css-lsp",
        "cssmodules-language-server",
        "docker-compose-language-service",
        "dockerfile-language-server",
        "eslint_d",
        "fixjson",
        "graphql-language-service-cli",
        "hadolint",
        "html-lsp",
        "json-lsp",
        "lemminx",
        "lua-language-server",
        "luacheck",
        "prettier",
        "prisma-language-server",
        "rust-analyzer",
        "shellcheck",
        "shfmt",
        "stylelint-lsp",
        "stylua",
        "taplo",
        "typescript-language-server",
        "vim-language-server",
        "yaml-language-server",
        "yamllint",
    },
})

-- Has to be after lsp_installer as it prepares the server before they can be started
require("lsp.servers")

-- Setup server diagnostics
vim.diagnostic.config({
    signs = false, -- Disable LSP signs
    underline = true, -- Underline diagnostics
    virtual_text = false, -- Hide virtual text diagnostics
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
