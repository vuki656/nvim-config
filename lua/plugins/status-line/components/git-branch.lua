return {
    render = function()
        local branch = vim.b.gitsigns_head

        if not branch or branch == "" then
            return ""
        end

        return "%#StatusLineGitBranch# " .. branch .. " "
    end,
}
