-- Name: Neotest
-- Description: Test runner
-- Link: https://github.com/nvim-neotest/neotest

-- Plugins:
-- https://github.com/marilari88/neotest-vitest
-- https://github.com/nvim-neotest/neotest-jest

local neotest = require("neotest")

local colors = require("utils.colors")
local set_highlight = require("utils.set-highlight")
local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- HELPERS ----------------------------------------------
------------------------------------------------------------------------------------------

local function find_config_file(dir, prefixes)
    local handle = vim.uv.fs_scandir(dir)

    if not handle then
        return nil
    end

    while true do
        local name, type = vim.uv.fs_scandir_next(handle)

        if not name then
            break
        end

        if type == "file" then
            for _, prefix in ipairs(prefixes) do
                if name:match("^" .. prefix .. ".*%.config%.") then
                    return dir .. "/" .. name
                end
            end
        end
    end

    return nil
end

local function find_nearest_config(file_path, prefixes)
    local current_dir = vim.fs.dirname(file_path)

    while current_dir and current_dir ~= "/" do
        local config_file = find_config_file(current_dir, prefixes)

        if config_file then
            return current_dir, config_file
        end

        current_dir = vim.fs.dirname(current_dir)
    end

    return nil, nil
end

local function is_test_file_pattern(file_path)
    if not file_path then
        return false
    end

    local is_test = file_path:match("%.test%.[jt]sx?$")
        or file_path:match("%.spec%.[jt]sx?$")
        or file_path:match("__tests__/.*%.[jt]sx?$")

    return is_test
end

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

local vitest_prefixes = { "vitest", "vite" }
local jest_prefixes = { "jest" }

neotest.setup({
    floating = {
        border = "rounded",
        max_height = 0.8,
        max_width = 0.8,
    },
    output = {
        open_on_run = false,
    },
    output_panel = {
        open = "botright split | resize 14",
    },
    summary = {
        open = function()
            local width = math.floor(vim.o.columns * 0.25)
            vim.cmd("botright vsplit | vertical resize " .. width)
        end,
    },
    adapters = {
        require("neotest-vitest")({
            is_test_file = function(file_path)
                if not is_test_file_pattern(file_path) then
                    return false
                end

                local vitest_dir = find_nearest_config(file_path, vitest_prefixes)
                local jest_dir = find_nearest_config(file_path, jest_prefixes)

                if vitest_dir and jest_dir then
                    return #vitest_dir >= #jest_dir
                end

                return vitest_dir ~= nil
            end,
            cwd = function(file_path)
                local dir = find_nearest_config(file_path, vitest_prefixes)
                return dir or vim.fn.getcwd()
            end,
            vitestCommand = function(file_path)
                local _, config_file = find_nearest_config(file_path, vitest_prefixes)

                if config_file then
                    return "npx vitest --config " .. config_file
                end

                return "npx vitest"
            end,
            filter_dir = function(name)
                return name ~= "node_modules"
            end,
        }),
        require("neotest-jest")({
            is_test_file = function(file_path)
                if not is_test_file_pattern(file_path) then
                    return false
                end

                local vitest_dir = find_nearest_config(file_path, vitest_prefixes)
                local jest_dir = find_nearest_config(file_path, jest_prefixes)

                if vitest_dir and jest_dir then
                    return #jest_dir > #vitest_dir
                end

                return jest_dir ~= nil
            end,
            jestCommand = function(file_path)
                local _, config_file = find_nearest_config(file_path, jest_prefixes)

                if config_file then
                    return "npx jest --config " .. config_file
                end

                return "npm test --"
            end,
            cwd = function(file_path)
                local dir = find_nearest_config(file_path, jest_prefixes)
                return dir or vim.fn.getcwd()
            end,
        }),
    },
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>jro",
            actions = neotest.summary.toggle,
            description = "Open neotest summary",
        },
        {
            key = "<LEADER>jrr",
            actions = neotest.run.run_last,
            description = "Run last test",
        },
        {
            key = "<LEADER>jrf",
            actions = function()
                neotest.run.run(vim.fn.expand("%"))
            end,
            description = "Run file",
        },
        {
            key = "<LEADER>jrt",
            actions = neotest.run.run,
            description = "Run closest test",
        },
        {
            key = "<LEADER>jrl",
            actions = function()
                neotest.output.open({ enter = true })
            end,
            description = "Open test output",
        },
        {
            key = "<LEADER>jrp",
            actions = neotest.output_panel.toggle,
            description = "Toggle output panel",
        },
    },
})

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

set_highlight({
    list = {
        -- Tree structure
        { group = "NeotestDir", foreground = colors.blue },
        { group = "NeotestFile", foreground = colors.white },
        { group = "NeotestNamespace", foreground = colors.purple },
        { group = "NeotestIndent", foreground = colors.grey },
        { group = "NeotestExpandMarker", foreground = colors.grey },
        { group = "NeotestAdapterName", foreground = colors.orange, bold = true },

        -- Test status
        { group = "NeotestPassed", foreground = colors.green },
        { group = "NeotestFailed", foreground = colors.red },
        { group = "NeotestRunning", foreground = colors.yellow },
        { group = "NeotestSkipped", foreground = colors.grey },
        { group = "NeotestUnknown", foreground = colors.grey },
        { group = "NeotestWatching", foreground = colors.blue },

        -- Markers
        { group = "NeotestMarked", foreground = colors.orange, bold = true },
        { group = "NeotestTarget", foreground = colors.purple },
        { group = "NeotestFocused", foreground = colors.yellow, bold = true },

        -- Window elements
        { group = "NeotestWinSelect", foreground = colors.blue, bold = true },
        { group = "NeotestBorder", foreground = colors.grey },
    },
})
