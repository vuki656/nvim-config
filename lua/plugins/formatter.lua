-- Name: Formatter
-- Description: Linter/formatter invoker
-- Link: https://github.com/mhartington/formatter.nvim
local formatter = require("formatter")

local remap = vim.api.nvim_set_keymap

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

formatter.setup(
    {
        filetype = {
            lua = {
                function()
                    return {
                        exe = "lua-format",
                        args = {
                            "-i",
                            "-c",
                            "~/code-style-configs/lua.yaml",
                        },
                        stdin = true,
                    }
                end,
            },
        },
    }
)

------------------------------------------------------------------------------------------
----------------------------------- REMAPS -----------------------------------------------
------------------------------------------------------------------------------------------

-- Format code
remap(
    "n", "<leader>f",
    ":FormatWrite<CR>",
    { silent = true, noremap = true }
)
