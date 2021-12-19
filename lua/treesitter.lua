local headlines = require("headlines")
local treesitter_configs = require("nvim-treesitter.configs")

local set_keymap = require("utils.set_keymap")

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

-- Doc files header highlights
headlines.setup()

--------------------------------------------------------------------------------------------
------------------------------------- KEYMAPS ----------------------------------------------
--------------------------------------------------------------------------------------------

set_keymap({
    key = "<LEADER>ts",
    actions = "<CMD>TSHighlightCapturesUnderCursor<CR>",
    description = "Get the treesitter highlight group of variable under the cursor",
})