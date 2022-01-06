-- Name: Treesitter Nvim
-- Description: Treesitter proxy for nvim
-- Link: https://github.com/nvim-treesitter/nvim-treesitter

local treesitter_configs = require("nvim-treesitter.configs")

local set_keymap = require("utils.set-keymap")

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

treesitter_configs.setup({
    ensure_installed = "all",
    highlight = { enable = true },
    autotag = { enable = true },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-w>",
            node_incremental = "<C-w>",
            node_decremental = "<C-e>",
        },
    },
})

--------------------------------------------------------------------------------------------
------------------------------------- KEYMAPS ----------------------------------------------
--------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>ts",
    actions = function()
        vim.cmd("TSHighlightCapturesUnderCursor")
    end,
    description = "Get the treesitter highlight group of variable under the cursor",
})
