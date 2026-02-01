local repo_name = ""

if repo_name == "" then
    vim.fn.jobstart("git remote get-url origin | xargs basename -s .git", {
        on_stdout = function(_, stdout)
            repo_name = repo_name .. table.concat(stdout)
        end,
    })
end

return {
    render = function()
        if repo_name == "" then
            return ""
        end

        return "%#StatusLineRepoName# " .. repo_name .. " "
    end,
}
