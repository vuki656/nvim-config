local colors = require("utils.colors")

return {
    added = {
        provider = "git_diff_added",
        hl = {
            fg = colors.green,
            bg = colors.background,
        },
    },
    changed = {
        icon = "  ",
        provider = "git_diff_changed",
        hl = {
            fg = colors.orange,
            bg = colors.background,
        },
    },
    removed = {
        provider = "git_diff_removed",
        hl = {
            fg = colors.red,
            bg = colors.background,
        },
    },
}
