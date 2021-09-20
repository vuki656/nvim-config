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

function _G.set_terminal_keymaps()
    local opts = { noremap = true }

    vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
    vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

local reload = function()
    vim.cmd(":NvimTreeRefresh")
    vim.cmd(":Gitsigns refresh")
    vim.cmd(":e")
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

----------------------------------- LAZYGIT ----------------------------------------------

local terminal_git = Terminal:new({
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
        reload()
    end,
    hidden = true,
})

function toggle_git()
    terminal_git:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>lg", ":lua toggle_git()<CR>", { noremap = true, silent = true })

----------------------------------- LAZYDOCKER ----------------------------------------------

local terminal_docker = Terminal:new({
    cmd = "lazydocker",
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
        reload()
    end,
    hidden = true,
})

function toggle_docker()
    terminal_docker:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>ld", ":lua toggle_docker()<CR>", { noremap = true, silent = true })

----------------------------------- BASIC ----------------------------------------------

local terminal_main = Terminal:new({
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "single",
    },
    on_close = function()
        reload()
    end,
    hidden = true,
})

function toggle_term()
    terminal_main:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tm", ":lua toggle_term()<CR>", { noremap = true, silent = true })

---------------------------------- YARN PIPES -------------------------------------------

-- ************ yarn install

local yarn_terminal_output = ""

local terminal_yarn = Terminal:new({
    count = 3,
    dir = "git_dir",
    cmd = "yarn",
    close_on_exit = true,
    on_stdout = function(_, stdout)
        yarn_terminal_output = yarn_terminal_output .. table.concat(stdout)

        if table.concat(stdout) == "" then
            local is_error = string.find(yarn_terminal_output, "Failed with errors") ~= nil
            local is_success = string.find(yarn_terminal_output, "success") ~= nil
                or string.find(yarn_terminal_output, "Done") ~= nil

            if is_error then
                vim.notify("`yarn install` failed", "error", { title = "Install" })
            elseif is_success then
                vim.notify("`yarn install` finished successfully", "info", { title = "Install" })
            else
                vim.notify("`yarn install` finished unexpectedly", "warn", { title = "Install" })
            end
        end
    end,
})

function toggle_yarn()
    vim.notify("Running `yarn install`", "debug", { title = "Install" })

    terminal_yarn:toggle()
    terminal_yarn:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tci", ":lua toggle_yarn()<CR>", { noremap = true, silent = true })

-- ************ yarn codegen

local yarn_codegen_terminal_output = ""

local terminal_yarn_codegen = Terminal:new({
    count = 3,
    dir = "git_dir",
    cmd = "yarn codegen",
    close_on_exit = true,
    on_stdout = function(_, stdout)
        yarn_codegen_terminal_output = yarn_codegen_terminal_output .. table.concat(stdout)

        if table.concat(stdout) == "" then
            local is_error = string.find(yarn_codegen_terminal_output, "error") ~= nil

            if is_error then
                vim.notify("`yarn codegen` failed", "error", { title = "Codegen" })
            else
                vim.notify("`yarn codegen` finished successfully", "info", { title = "Codegen" })
            end
        end
    end,
})

function toggle_yarn_codegen()
    vim.notify("Running `yarn codegen`.", "debug", { title = "Codegen" })

    terminal_yarn_codegen:toggle()
    terminal_yarn_codegen:toggle()
end

vim.api.nvim_set_keymap("n", "<leader>tcg", ":lua toggle_yarn_codegen()<CR>", { noremap = true, silent = true })
