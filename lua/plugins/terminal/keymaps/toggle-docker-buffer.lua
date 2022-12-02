local Terminal = require("toggleterm.terminal").Terminal

local reset = require("plugins.terminal.keymaps.reset")

local docker = Terminal:new({
    cmd = "lazydocker",
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "single",
        width = function()
            return math.floor(vim.o.columns * 0.99)
        end,
        height = function()
            return math.floor(vim.o.lines * 0.99)
        end,
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
        reset()
    end,
    hidden = true,
})

return function()
    docker:toggle()
end
