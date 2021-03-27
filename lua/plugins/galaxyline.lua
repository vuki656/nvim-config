colors1 = require('utils.colors')

local gl = require("galaxyline")
local gls = gl.section

gl.short_line_list = {" "}

gls.left[1] = {
    ViMode = {
        provider = function()
            return ' ' .. '  ' .. os.date('%H:%M') .. ' ' 
        end,
        highlight = {colors.background, colors.green},
        separator = " ",
        separator_highlight = {colors.lightBackground, colors.lightBackground}
    }
}

gls.left[2] = {
    FileIcon = {
        provider = "FileIcon",
        condition = buffer_not_empty,
        highlight = {require("galaxyline.provider_fileinfo").get_file_icon_color, colors.lightBackground}
    }
}

gls.left[3] = {
    FileName = {
        provider = {"FileName"},
        condition = buffer_not_empty,
        highlight = {colors.white, colors.lightBackground},
        separator = " ",
        separator_highlight = {colors.white, colors.lightBackground},
    }
}

gls.left[4] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = buffer_not_empty,
        icon = "  ",
        highlight = {colors.green}
    }
}

gls.left[5] = {
    DiffModified = {
        provider = "DiffModified",
        condition = buffer_not_empty,
        condition = checkwidth,
        icon = "  ",
        highlight = {colors.orange}
    }
}

gls.left[6] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = buffer_not_empty,
        condition = checkwidth,
        icon = "  ",
        highlight = {colors.red}
    }
}

gls.left[7] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        condition = buffer_not_empty,
        icon = "  ",
        highlight = {colors.red}
    }
}

gls.left[8] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        condition = buffer_not_empty,
        icon = "  ",
        highlight = {colors.orange}
    }
}

gls.right[1] = {
    GitIcon = {
        provider = function()
            return "   "
        end,
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.green}
    }
}

gls.right[2] = {
    GitBranch = {
        provider = "GitBranch",
        condition = require("galaxyline.provider_vcs").check_git_workspace,
        highlight = {colors.greeng}
    }
}

gls.right[4] = {
    SiMode = {
        provider = function()
            local alias = {
                n = " NORMAL ",
                i = " INSERT ",
                c = " COMMAND ",
                V = " VISUAL ",
                [""] = " VISUAL ",
                v = " VISUAL ",
                R = " REPLACE "
            }
            return alias[vim.fn.mode()]
        end,
        highlight = {colors.background, colors.red},
        separator = " ",
    }
}

