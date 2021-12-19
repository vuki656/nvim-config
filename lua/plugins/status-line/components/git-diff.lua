local colors = require("utils.colors")

local git_diff = {
    {
        provider = "git_diff_added",
        hl = {
            fg = colors.green,
            bg = colors.background,
        },
    },
    {
        provider = "git_diff_changed",
        hl = {
            fg = colors.orange,
            bg = colors.background,
        },
    },
    {
        provider = "git_diff_removed",
        hl = {
            fg = colors.red,
            bg = colors.background,
        },
    },
}

return unpack(git_diff)
