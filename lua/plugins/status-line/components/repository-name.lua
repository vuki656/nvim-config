local colors = require("utils.colors")

local repo_name = ""

-- Get git repo name
if repo_name == "" then
    vim.fn.jobstart("git remote get-url origin | xargs basename -s .git", {
        on_stdout = function(_, stdout)
            repo_name = repo_name .. table.concat(stdout)
        end,
    })
end

return {
    provider = function()
        if repo_name == "" then
            return ""
        end

        return " " .. repo_name
    end,
    hl = {
        fg = colors.background,
        bg = colors.red,
        style = "bold",
    },
    right_sep = function()
        return {
            str = " ",
            hl = {
                bg = colors.red,
            },
        }
    end,
    left_sep = function()
        return {
            str = " ",
            hl = {
                bg = colors.red,
            },
        }
    end,
}
