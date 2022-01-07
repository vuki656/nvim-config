local Terminal = require("toggleterm.terminal").Terminal

local docker = Terminal:new({
    cmd = "lazydocker",
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "single",
    },
    on_open = function(terminal)
        vim.cmd("startinsert!")
        vim.cmd("set filetype=docker-term")

        vim.api.nvim_buf_set_keymap(terminal.bufnr, "n", "q", ":close<CR>", {
            noremap = true,
            silent = true,
        })
    end,
    on_close = function()
        vim.fn.timer_start(20, function()
            vim.cmd(":NvimTreeRefresh")
            vim.cmd(":Gitsigns refresh")
            vim.cmd(":e")
        end)
    end,
    hidden = true,
})

return function()
    docker:toggle()
end
