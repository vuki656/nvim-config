return {
    render = function()
        local name = vim.fn.expand("%:t")

        if name == "" then
            return ""
        end

        local modified = vim.bo.modified and " [+]" or ""

        return "%#StatusLineFileName# " .. name .. modified
    end,
}
