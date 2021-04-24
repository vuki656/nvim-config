colors = require('utils.colors')

local plugin = require("galaxyline")
local vcs = require('galaxyline.provider_vcs')
local file = require('galaxyline.provider_fileinfo')

local section = plugin.section

plugin.short_line_list = {
    'NvimTree',
    'packer'
}

section.left[1] = {
    GitIcon = {
        provider = function()
            return "   "
        end,
        condition = vcs.check_git_workspace,
        highlight = {
            colors.blue,
            colors.background
        }
    }
}

section.left[2] = {
    GitBranch = {
        provider = "GitBranch",
        separator = " ",
        condition = vcs.check_git_workspace,
        highlight = {
            colors.blue,
            colors.background
        },
        separator_highlight = { 
            nil,
            colors.background
        },
    }
}

section.left[3] = {
    FileIcon = {
        provider = "FileIcon",
        condition = buffer_not_empty,
        highlight = {
            file.get_file_icon_color,
            colors.background
        },
    }
}

section.left[4] = {
    FileName = {
        provider = "FileName",
        condition = buffer_not_empty,
        highlight = {
            colors.white,
            colors.background
        },
        separator = " ",
        separator_highlight = {
            colors.white,
            colors.background
        },
    }
}

section.left[5] = {
    DiffAdd = {
        provider = "DiffAdd",
        condition = buffer_not_empty,
        icon = "  ",
        highlight = { colors.green }
    }
}

section.left[6] = {
    DiffModified = {
        provider = "DiffModified",
        condition = buffer_not_empty,
        condition = checkwidth,
        icon = "  ",
        highlight = { colors.orange }
    }
}

section.left[7] = {
    DiffRemove = {
        provider = "DiffRemove",
        condition = buffer_not_empty,
        condition = checkwidth,
        icon = "  ",
        highlight = { colors.red }
    }
}

section.left[8] = {
    DiagnosticError = {
        provider = "DiagnosticError",
        condition = buffer_not_empty,
        icon = "  ",
        highlight = { colors.red }
    }
}

section.left[9] = {
    DiagnosticWarn = {
        provider = "DiagnosticWarn",
        condition = buffer_not_empty,
        icon = "  ",
        highlight = { colors.orange }
    }
}

section.right[1] = {
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
        highlight = {
            colors.background,
            colors.red
        },
        separator = " ",
    }
}

section.right[2] = {
    Time = {
        provider = function()
            return ' ' .. '  ' .. os.date('%H:%M') .. ' '
        end,
        highlight = {
            colors.background,
            colors.green
        },
    }
}

section.short_line_left[1] = {
  BufferType = {
    provider = 'FileTypeName',
    separator = ' ',
    separator_highlight = {
        nil,
        colors.backgroud
    },
    highlight = {
        colors.blue,
        colors.background,
        'bold'
    }
  }
}

section.short_line_right[1] = {
  BufferIcon = {
    provider= 'BufferIcon',
    highlight = {
        colors.white,
        colors.background
    }
  }
}
