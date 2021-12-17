local headlines = require("headlines")
local treesitter_configs = require("nvim-treesitter.configs")

colors = require("utils.colors")

treesitter_configs.setup({
    ensure_installed = "all",
    highlight = { enable = true },
    autotag = { enable = true },
    indent = { enable = true },
    incremental_selection = {
        enable = true,
        keymaps = {
            init_selection = "<C-w>",
            node_incremental = "<C-w>",
            node_decremental = "<C-e>",
        },
    },
})

-- Doc files header highlights
headlines.setup()

vim.cmd([[highlight! TSKeyword              guifg=]] .. colors.purple)
vim.cmd([[highlight! TSInclude              guifg=]] .. colors.purple)
vim.cmd([[highlight! TSKeywordOperator      guifg=]] .. colors.purple)
vim.cmd([[highlight! TSBoolean              guifg=]] .. colors.purple)
vim.cmd([[highlight! TSConstBuiltin         guifg=]] .. colors.purple)
vim.cmd([[highlight! TSTypeBuiltin          guifg=]] .. colors.purple)
vim.cmd([[highlight! TSVariable             guifg=]] .. colors.white)
vim.cmd([[highlight! TSNamespace            guifg=]] .. colors.white)
vim.cmd([[highlight! TSConstructor          guifg=]] .. colors.yellow)
vim.cmd([[highlight! TSParameter            guifg=]] .. colors.orange)
vim.cmd([[highlight! TSProperty             guifg=]] .. colors.red)
vim.cmd([[highlight! TSLabel                guifg=]] .. colors.red)

-- Punctuation
vim.cmd([[highlight! TSPunctBracket         guifg=]] .. colors.white)
vim.cmd([[highlight! TSOperator             guifg=]] .. colors.white)
vim.cmd([[highlight! TSPunctDelimiter       guifg=]] .. colors.white)
vim.cmd([[highlight! TSPunctSpecial         guifg=]] .. colors.white)

-- JSX
vim.cmd([[highlight! TSTagDelimiter         guifg=]] .. colors.white)
vim.cmd([[highlight! TSTag                  guifg=]] .. colors.red)

-- Editor
vim.cmd([[highlight! StatusLineNC           guifg=]] .. colors.background)
