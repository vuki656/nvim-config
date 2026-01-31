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
    highlight = {
        enable = true,
        disable = function(_, bufnr)
            return vim.api.nvim_buf_line_count(bufnr) > 10000
        end,
    },
    autotag = {
        enable = false,
    },
    indent = {
        enable = true,
    },
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
    key = "<LEADER>ut",
    actions = function()
        vim.cmd(":TSHighlightCapturesUnderCursor")
    end,
    description = "[Treesitter] Inspect highlight group under cursor",
})
