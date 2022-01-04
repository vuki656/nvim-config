local Terminal = require("toggleterm.terminal").Terminal

local terminal = Terminal:new({
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "single",
    },
    on_close = function()
        vim.fn.timer_start(20, function()
            vim.cmd(":NvimTreeRefresh")
            vim.cmd(":Gitsigns refresh")
            vim.cmd(":e")
        end)
    end,
    hidden = true,
})

function _G.toggle_terminal_buffer()
    terminal:toggle()
end
