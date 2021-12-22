-- Name: Nvim LSP Installer
-- Description: Language server installer
-- Link: https://github.com/williamboman/nvim-lsp-installer

local lsp_installer = require("nvim-lsp-installer")

local capabilities = require("lsp.utils.capabilities")
local set_keymap = require("utils.set-keymap")
local SERVERS = require("lsp.utils.servers")

local setup_lua_server = require("lsp.servers.lua")
local setup_json_server = require("lsp.servers.json")
local setup_typescript_server = require("lsp.servers.typescript")
local setup_yaml_server = require("lsp.servers.yaml")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

-- Install all servers not yet installed
for _, name in pairs(SERVERS) do
    local is_server_found, server = lsp_installer.get_server(name)

    if is_server_found then
        if not server:is_installed() then
            print("Installing LSP: " .. name)

            server:install()
        end
    end
end

-- Setup each server individually
lsp_installer.on_server_ready(function(server)
    local options = {
        capabilities = capabilities,
    }

    options = setup_json_server(options, server.name)
    options = setup_lua_server(options, server.name)
    options = setup_typescript_server(options, server.name)
    options = setup_yaml_server(options, server.name)

    server:setup(options)
end)

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>ls",
    actions = "<CMD>LspInstallInfo<CR>",
    description = "Open lsp installer popup buffer",
})
