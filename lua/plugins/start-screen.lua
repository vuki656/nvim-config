-- Name: Alpha
-- Descriptions: Start screen
-- Link: https://github.com/goolord/alpha-nvim

local alpha = require("alpha")
local nvim_tree_api = require("nvim-tree.api")
local startify_theme = require("alpha.themes.startify")

local set_keymap = require("utils.set-keymap")

--------------------------------------------------------------------------------------------
------------------------------------- SETUP ------------------------------------------------
--------------------------------------------------------------------------------------------

-- Custom layout
startify_theme.config.layout = {
    { type = "padding", val = 1 },
    startify_theme.section.header,
    { type = "padding", val = 2 },
    startify_theme.section.mru_cwd,
    startify_theme.section.mru,
    { type = "padding", val = 1 },
    startify_theme.section.bottom_buttons,
    startify_theme.section.footer,
}

alpha.setup(startify_theme.config)

-- Open NvimTree alongside Alpha on startup, keeping focus on Alpha
vim.api.nvim_create_autocmd("User", {
    group = vim.api.nvim_create_augroup("AlphaOpenTree", { clear = true }),
    pattern = "AlphaReady",
    callback = function()
        nvim_tree_api.tree.open()

        -- Return focus to Alpha
        vim.cmd("wincmd p")
    end,
})

--------------------------------------------------------------------------------------------
------------------------------------- KEYMAPS ----------------------------------------------
--------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>bb",
    actions = function()
        vim.cmd("Alpha")
    end,
    description = "Open start screen",
})
