local Terminal = require("toggleterm.terminal").Terminal

local reset = require("plugins.terminal.keymaps.reset")

local terminal = Terminal:new({
    dir = "git_dir",
    direction = "float",
    float_opts = {
        border = "single",
    },
    on_close = function()
        reset()
    end,
    hidden = true,
})

return function()
    terminal:toggle()
end
