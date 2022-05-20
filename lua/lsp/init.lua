-- Name: Nvim LSP Installer
-- Description: Language server installer
-- Link: https://github.com/williamboman/nvim-lsp-installer

local lsp_installer = require("nvim-lsp-installer")

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

-- Setup preparation for lsp servers to be configured
lsp_installer.setup({
    ui = {
        icons = {
            server_installed = "",
            server_pending = "",
            server_uninstalled = "",
        },
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
        vim.cmd("LspInstallInfo")
    end,
    description = "Open lsp installer popup buffer",
})
