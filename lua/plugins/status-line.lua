local lsp = require("feline.providers.lsp")
local package = require("package-info")

local colors = require("utils.colors")

local components = {
    active = {},
    inactive = {},
}

local name = ""

-- Get git repo name
if name == "" then
    vim.fn.jobstart("git remote get-url origin | xargs basename -s .git", {
        on_stdout = function(_, stdout)
            name = name .. table.concat(stdout)
        end,
    })
end

components.active[1] = {
    {
        provider = function()
            if name == "" then
                return ""
            end

            return " " .. name
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
    },
    {
        provider = "git_branch",
        hl = {
            fg = colors.background,
            bg = colors.blue,
            style = "bold",
        },
        right_sep = function()
            return {
                str = " ",
                hl = {
                    fg = colors.background,
                    bg = colors.blue,
                },
            }
        end,
        left_sep = function()
            return {
                str = " ",
                hl = {
                    fg = colors.background,
                    bg = colors.blue,
                },
            }
        end,
    },
    {
        provider = "file_info",
        hl = {
            fg = colors.white,
            bg = colors.background,
        },
        left_sep = {
            {
                str = " ",
                hl = {
                    bg = colors.background,
                },
            },
        },
    },
    {
        provider = "    ",
        hl = {
            fg = colors.white,
            bg = colors.background,
        },
    },
    {
        provider = "diagnostic_errors",
        enabled = function()
            return lsp.diagnostics_exist("Error")
        end,
        hl = {
            bg = colors.background,
            fg = colors.red,
        },
    },
    {
        provider = "diagnostic_warnings",
        enabled = function()
            return lsp.diagnostics_exist("Warning")
        end,
        hl = {
            bg = colors.background,
            fg = colors.yellow,
        },
    },
    {
        provider = "diagnostic_hints",
        enabled = function()
            return lsp.diagnostics_exist("Hint")
        end,
        hl = {
            fg = colors.orange,
            bg = colors.background,
        },
    },
    {
        provider = "diagnostic_info",
        enabled = function()
            return lsp.diagnostics_exist("Information")
        end,
        hl = {
            bg = colors.background,
            fg = colors.blue,
        },
    },
    {
        provider = "    ",
        hl = {
            fg = colors.white,
            bg = colors.background,
        },
    },
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
    {
        provider = function()
            return "   " .. package.get_status()
        end,
        hl = {
            fg = colors.white,
            bg = colors.background,
        },
    },
}

components.active[2] = {
    {
        provider = function()
            return "  " .. os.date("%H:%M") .. " "
        end,
        hl = {
            bg = colors.green,
            fg = colors.background,
        },
    },
}

components.inactive[1] = {
    {
        provider = "",
        hl = {
            bg = colors.background,
        },
    },
}

require("feline").setup({
    components = components,
    force_inactive = {
        filetypes = {
            "NvimTree",
            "packer",
            "alpha",
            "qf",
            "help",
        },
        buftypes = { "terminal" },
        bufnames = {},
    },
})
