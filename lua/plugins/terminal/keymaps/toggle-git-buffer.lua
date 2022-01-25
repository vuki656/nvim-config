local Terminal = require("toggleterm.terminal").Terminal

local reset = require("plugins.terminal.keymaps.reset")

local lazy_git = Terminal:new({
    cmd = "lazygit",
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "single",
    },
    on_open = function(terminal)
        vim.cmd("startinsert!")
        vim.cmd("set filetype=git-term")

        vim.api.nvim_buf_set_keymap(terminal.bufnr, "n", "q", ":close<CR>", { noremap = true, silent = true })
    end,
    on_close = function()
        reset()
    end,
    hidden = false,
})

return function()
    lazy_git:toggle()
end
