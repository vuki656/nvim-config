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
        "stylua",
        "shfmt",
        "prettier",
        "eslint_d",
        "shellcheck",
        "hadolint",
        "yamllint",
        "luacheck",
        "cspell",
        "actionlint",
        "fixjson",
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
