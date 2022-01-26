return function()
    vim.defer_fn(function()
        vim.cmd(":NvimTreeRefresh")
        vim.cmd(":Gitsigns refresh")
        vim.cmd(":e")
    end, 20)
end
