-- Name: nvim-dap
-- Description: Debug Adapter Protocol client
-- Link: https://github.com/mfussenegger/nvim-dap

-- Plugins:
-- https://github.com/rcarriga/nvim-dap-ui
-- https://github.com/theHamsta/nvim-dap-virtual-text
-- https://github.com/jay-babu/mason-nvim-dap.nvim

local dap = require("dap")
local dapui = require("dapui")

local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")
local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- MASON DAP --------------------------------------------
------------------------------------------------------------------------------------------

require("mason-nvim-dap").setup({
    ensure_installed = { "js" },
    automatic_installation = true,
})

------------------------------------------------------------------------------------------
----------------------------------- VIRTUAL TEXT -----------------------------------------
------------------------------------------------------------------------------------------

require("nvim-dap-virtual-text").setup({
    enabled = true,
    enabled_commands = true,
    highlight_changed_variables = true,
    highlight_new_as_changed = false,
    show_stop_reason = true,
    commented = false,
    virt_text_pos = "eol",
})

------------------------------------------------------------------------------------------
----------------------------------- DAP UI -----------------------------------------------
------------------------------------------------------------------------------------------

dapui.setup({
    icons = {
        expanded = "",
        collapsed = "",
        current_frame = "",
    },
    mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
    },
    layouts = {
        {
            elements = {
                { id = "scopes", size = 0.4 },
                { id = "breakpoints", size = 0.2 },
                { id = "stacks", size = 0.2 },
                { id = "watches", size = 0.2 },
            },
            size = 40,
            position = "left",
        },
        {
            elements = {
                { id = "repl", size = 0.5 },
                { id = "console", size = 0.5 },
            },
            size = 12,
            position = "bottom",
        },
    },
    floating = {
        max_height = nil,
        max_width = nil,
        border = "rounded",
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    controls = {
        enabled = true,
        element = "repl",
        icons = {
            pause = "",
            play = "",
            step_into = "",
            step_over = "",
            step_out = "",
            step_back = "",
            run_last = "",
            terminate = "",
        },
    },
    render = {
        max_type_length = nil,
        max_value_lines = 100,
    },
})

-- Auto open/close UI
dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end

------------------------------------------------------------------------------------------
----------------------------------- ADAPTER ----------------------------------------------
------------------------------------------------------------------------------------------

dap.adapters["pwa-node"] = {
    type = "server",
    host = "localhost",
    port = "${port}",
    executable = {
        command = vim.fn.stdpath("data") .. "/mason/bin/js-debug-adapter",
        args = { "${port}" },
    },
}

------------------------------------------------------------------------------------------
----------------------------------- CONFIGURATIONS ---------------------------------------
------------------------------------------------------------------------------------------

local js_configs = {
    {
        type = "pwa-node",
        request = "launch",
        name = "Launch Current File",
        program = "${file}",
        cwd = "${workspaceFolder}",
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
    },
    {
        type = "pwa-node",
        request = "launch",
        name = "Launch TS File (ts-node)",
        program = "${file}",
        cwd = "${workspaceFolder}",
        runtimeExecutable = "npx",
        runtimeArgs = { "ts-node" },
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
        resolveSourceMapLocations = {
            "${workspaceFolder}/**",
            "!**/node_modules/**",
        },
    },
    {
        type = "pwa-node",
        request = "attach",
        name = "Attach (port 9229)",
        cwd = "${workspaceFolder}",
        port = 9229,
        sourceMaps = true,
        resolveSourceMapLocations = {
            "${workspaceFolder}/**",
            "!**/node_modules/**",
        },
    },
    {
        type = "pwa-node",
        request = "attach",
        name = "Attach (custom port)",
        processId = require("dap.utils").pick_process,
        cwd = "${workspaceFolder}",
        port = function()
            return vim.fn.input("Port: ", "9229")
        end,
        sourceMaps = true,
    },
    {
        type = "pwa-node",
        request = "launch",
        name = "Launch NPM Script",
        cwd = "${workspaceFolder}",
        runtimeExecutable = "npm",
        runtimeArgs = function()
            local script = vim.fn.input("NPM script: ", "start")
            return { "run", script }
        end,
        sourceMaps = true,
        protocol = "inspector",
        console = "integratedTerminal",
    },
}

dap.configurations.javascript = js_configs
dap.configurations.typescript = js_configs
dap.configurations.javascriptreact = js_configs
dap.configurations.typescriptreact = js_configs

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>db",
            actions = dap.toggle_breakpoint,
            description = "Toggle breakpoint",
        },
        {
            key = "<LEADER>dB",
            actions = function()
                dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
            end,
            description = "Set conditional breakpoint",
        },
        {
            key = "<LEADER>dc",
            actions = dap.continue,
            description = "Start/Continue debugging",
        },
        {
            key = "<LEADER>dq",
            actions = dap.terminate,
            description = "Terminate debug session",
        },
        {
            key = "<LEADER>dn",
            actions = dap.step_over,
            description = "Step over",
        },
        {
            key = "<LEADER>di",
            actions = dap.step_into,
            description = "Step into",
        },
        {
            key = "<LEADER>do",
            actions = dap.step_out,
            description = "Step out",
        },
        {
            key = "<LEADER>du",
            actions = dapui.toggle,
            description = "Toggle DAP UI",
        },
        {
            key = "<LEADER>de",
            actions = dapui.eval,
            modes = { "n", "v" },
            description = "Evaluate expression",
        },
        {
            key = "<LEADER>dh",
            actions = function()
                require("dap.ui.widgets").hover()
            end,
            description = "Hover variable",
        },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- SIGNS ------------------------------------------------
------------------------------------------------------------------------------------------

vim.fn.sign_define("DapBreakpoint", {
    text = "",
    texthl = "DapBreakpoint",
    linehl = "",
    numhl = "",
})

vim.fn.sign_define("DapBreakpointCondition", {
    text = "",
    texthl = "DapBreakpointCondition",
    linehl = "",
    numhl = "",
})

vim.fn.sign_define("DapLogPoint", {
    text = "",
    texthl = "DapLogPoint",
    linehl = "",
    numhl = "",
})

vim.fn.sign_define("DapStopped", {
    text = "",
    texthl = "DapStopped",
    linehl = "DapStoppedLine",
    numhl = "",
})

vim.fn.sign_define("DapBreakpointRejected", {
    text = "",
    texthl = "DapBreakpointRejected",
    linehl = "",
    numhl = "",
})

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({
    list = {
        -- Signs
        { group = "DapBreakpoint", foreground = colors.red },
        { group = "DapBreakpointCondition", foreground = colors.yellow },
        { group = "DapLogPoint", foreground = colors.blue },
        { group = "DapStopped", foreground = colors.green },
        { group = "DapStoppedLine", background = colors.grey_lighter },
        { group = "DapBreakpointRejected", foreground = colors.grey },

        -- Virtual text
        { group = "NvimDapVirtualText", foreground = colors.grey },
        { group = "NvimDapVirtualTextChanged", foreground = colors.yellow },
        { group = "NvimDapVirtualTextError", foreground = colors.red },
        { group = "NvimDapVirtualTextInfo", foreground = colors.blue },

        -- DAP UI
        { group = "DapUIScope", foreground = colors.blue },
        { group = "DapUIType", foreground = colors.purple },
        { group = "DapUIValue", foreground = colors.white },
        { group = "DapUIModifiedValue", foreground = colors.yellow },
        { group = "DapUIDecoration", foreground = colors.blue },
        { group = "DapUIThread", foreground = colors.green },
        { group = "DapUIStoppedThread", foreground = colors.yellow },
        { group = "DapUIFrameName", foreground = colors.white },
        { group = "DapUISource", foreground = colors.purple },
        { group = "DapUILineNumber", foreground = colors.blue },
        { group = "DapUIFloatBorder", foreground = colors.grey },
        { group = "DapUIWatchesEmpty", foreground = colors.grey },
        { group = "DapUIWatchesValue", foreground = colors.green },
        { group = "DapUIWatchesError", foreground = colors.red },
        { group = "DapUIBreakpointsPath", foreground = colors.blue },
        { group = "DapUIBreakpointsInfo", foreground = colors.green },
        { group = "DapUIBreakpointsCurrentLine", foreground = colors.yellow },
        { group = "DapUIBreakpointsLine", foreground = colors.blue },
        { group = "DapUIBreakpointsDisabledLine", foreground = colors.grey },

        -- Control icons
        { group = "DapUIPlayPause", foreground = colors.green },
        { group = "DapUIStop", foreground = colors.red },
        { group = "DapUIRestart", foreground = colors.yellow },
        { group = "DapUIStepOver", foreground = colors.blue },
        { group = "DapUIStepInto", foreground = colors.blue },
        { group = "DapUIStepOut", foreground = colors.blue },
        { group = "DapUIStepBack", foreground = colors.blue },
    },
})
