local Terminal = require("toggleterm.terminal").Terminal

local terminal = Terminal:new({
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "single",
    },
    on_close = function()
        vim.cmd(":NvimTreeRefresh")
        vim.cmd(":Gitsigns refresh")
        vim.cmd(":e")
    end,
    hidden = true,
})

function _G.toggle_terminal_window()
    terminal:toggle()
end