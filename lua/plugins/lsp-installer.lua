-- Name: Indent Blank Line
-- Description: Indent guidelines
-- Link: https://github.com/lukas-reineke/indent-blankline.nvim

local lsp_installer = require("nvim-lsp-installer")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "",
            server_uninstalled = "✗",
        },
    },
})
