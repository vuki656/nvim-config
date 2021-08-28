-- Name: Toggleterm
-- Description: Builtin Terminal Navigator
-- Link: https://github.com/akinsho/nvim-toggleterm.lua

local toggleterm = require("toggleterm")
local Terminal = require("toggleterm.terminal").Terminal

------------------------------------------------------------------------------------------
------------------------------------ SETUP -----------------------------------------------
------------------------------------------------------------------------------------------

toggleterm.setup({
    shade_terminals = false,
})

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

----------------------------------- LAZYGIT ----------------------------------------------
local lazygit = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "single",
    },
    on_open = function(terminal)
        vim.cmd("startinsert!")
        vim.api.nvim_buf_set_keymap(terminal.bufnr, "n", "q", ":close<CR>", { noremap = true, silent = true })
    end,
    on_close = function()
        vim.cmd(":NvimTreeRefresh")
        vim.cmd(":e")
    end,
    hidden = true,
})

function toggle_git()
    lazygit:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lg", ":lua toggle_git()<CR>", { noremap = true, silent = true })

----------------------------------- BASIC ----------------------------------------------
local terminal = Terminal:new({
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "single",
    },
    on_close = function()
        vim.cmd(":e")
    end,
    hidden = true,
})

function toggle_term()
    terminal:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tm", ":lua toggle_term()<CR>", { noremap = true, silent = true })
