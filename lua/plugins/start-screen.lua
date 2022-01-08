-- Name: Alpha
-- Descriptions: Start screen
-- Link: https://github.com/goolord/alpha-nvim

local alpha = require("alpha")
local startify_theme = require("alpha.themes.startify")

local set_keymap = require("utils.set-keymap")

--------------------------------------------------------------------------------------------
------------------------------------- SETUP ------------------------------------------------
--------------------------------------------------------------------------------------------

-- Custom layout
startify_theme.opts.layout = {
    { type = "padding", val = 1 },
    startify_theme.section.header,
    { type = "padding", val = 2 },
    startify_theme.section.mru_cwd,
    startify_theme.section.mru,
    { type = "padding", val = 1 },
    startify_theme.section.bottom_buttons,
    startify_theme.section.footer,
}

alpha.setup(startify_theme.opts)

-- Manual tree open on startup since built in is broken
-- only open on empty buffer
local function open_start_screen()
    vim.cmd("NvimTreeToggle")
    vim.api.nvim_input("<C-l>")

    vim.fn.timer_start(1, function()
        local current_buffer_name = vim.api.nvim_buf_get_name(0)

        if current_buffer_name == "" then
            vim.api.nvim_input("<SPACE>b")
        end
    end)
end

open_start_screen()

--------------------------------------------------------------------------------------------
------------------------------------- KEYMAPS ----------------------------------------------
--------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>b",
    actions = function()
        vim.cmd("Alpha")
    end,
    description = "Open start screen",
})
