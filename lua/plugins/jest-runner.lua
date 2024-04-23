-- Name: Jester
-- Description: Jest test runner
-- Link: https://github.com/David-Kunz/jester

local jester = require("jester")

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- HELPERS ----------------------------------------------
------------------------------------------------------------------------------------------

local default_options = {
    terminal_cmd = "ToggleTerm",
    path_to_jest_run = "bun jest",
}

local configure_jest = function(file_name)
    local new_config = vim.tbl_deep_extend("force", default_options, {
        path_to_jest_run = "bun jest --config " .. file_name,
    })

    jester.setup(new_config)
end

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

jester.setup(default_options)

-- Auto change jest config based on test type from file name
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = {
        "*.unit.test.ts",
        "*.integration.test.ts",
    },
    callback = function()
        local file_name = vim.api.nvim_buf_get_name(0)

        if string.find(file_name, ".unit.test.ts") then
            configure_jest("jest.unit.config.ts")
        end

        if string.find(file_name, ".integration.test.ts") then
            configure_jest("jest.integration.config.ts")
        end

        configure_jest("jest.config.ts")
    end,
})

------------------------------------------------------------------------------------------
----------------------------------- KEYMAPS ----------------------------------------------
------------------------------------------------------------------------------------------

set_keymap({
    list = {
        {
            key = "<LEADER>jrt",
            actions = jester.run,
            description = "Run jest test under cursor",
        },
        {
            key = "<LEADER>jrf",
            actions = jester.run_file,
            description = "Run jest file",
        },
        {
            key = "<LEADER>jrr",
            actions = jester.run_last,
            description = "Re run last test",
        },
    },
})
