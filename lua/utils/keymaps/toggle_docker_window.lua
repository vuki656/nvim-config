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
        vim.api.nvim_buf_set_keymap(terminal.bufnr, "n", "q", ":close<CR>", { noremap = true, silent = true })
    end,
    on_close = function()
        vim.cmd(":NvimTreeRefresh")
        vim.cmd(":Gitsigns refresh")
        vim.cmd(":e")
    end,
    hidden = true,
})

function _G.toggle_docker_window()
    docker:toggle()
end
