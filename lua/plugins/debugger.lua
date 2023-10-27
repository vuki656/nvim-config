-- Name: DAP
-- Description: Debugger
-- Link: https://github.com/mfussenegger/nvim-dap, https://github.com/rcarriga/nvim-dap-ui

local dap = require("dap")
local dap_ui = require("dapui")

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

dap_ui.setup()

dap.listeners.after.event_initialized["dapui_config"] = function()
    dap_ui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dap_ui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dap_ui.close()
end

dap.adapters["pwa-node"] = {
    type = "server",
    host = "127.0.0.1",
    port = 8123,
    executable = {
        command = "js-debug-adapter",
    },
}

for _, language in ipairs({ "typescript", "javascript" }) do
    dap.configurations[language] = {
        {
            type = "pwa-node",
            request = "launch",
            name = "Launch file",
            program = "${file}",
            cwd = "${workspaceFolder}",
            runtimeExecutable = "ts-node",
        },
    }
end

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>db",
            actions = function()
                vim.cmd("DapToggleBreakpoint")
            end,
            description = "Add debugger breakpoint on current line",
        },
        {
            key = "<LEADER>dc",
            actions = function()
                vim.cmd("DapContinue")
            end,
            description = "Run/Continue debugger",
        },
    },
})
