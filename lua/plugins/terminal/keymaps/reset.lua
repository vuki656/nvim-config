return function()
    vim.defer_fn(function()
        local view = vim.fn.winsaveview()

        vim.cmd(":NvimTreeRefresh")
        vim.cmd(":Gitsigns refresh")
        vim.cmd(":e")

        vim.fn.winrestview(view)
    end, 20)
end
