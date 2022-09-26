return function()
    vim.defer_fn(function()
        local view = vim.fn.winsaveview()
        local buffer_name = vim.fn.bufname()

        vim.cmd(":Gitsigns refresh")

        if buffer_name ~= "" then
            vim.cmd(":e")
            vim.fn.winrestview(view)
        end
    end, 20)
end
