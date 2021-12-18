local headlines = require("headlines")
local treesitter_configs = require("nvim-treesitter.configs")

local set_highlight = require("utils.set_highlight")

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

set_highlight({
    list = {
        { group = "TSKeyword", foreground = colors.purple },
        { group = "TSInclude", foreground = colors.purple },
        { group = "TSKeywordOperator", foreground = colors.purple },
        { group = "TSBoolean", foreground = colors.purple },
        { group = "TSConstBuiltin", foreground = colors.purple },
        { group = "TSTypeBuiltin", foreground = colors.purple },
        { group = "TSVariable", foreground = colors.white },
        { group = "TSNamespace", foreground = colors.white },
        { group = "TSConstructor", foreground = colors.yellow },
        { group = "TSParameter", foreground = colors.orange },
        { group = "TSProperty", foreground = colors.red },
        { group = "TSLabel", foreground = colors.red },

        -- Punctuation
        { group = "TSPunctBracket", foreground = colors.white },
        { group = "TSOperator", foreground = colors.white },
        { group = "TSPunctDelimiter", foreground = colors.white },
        { group = "TSPunctSpecial", foreground = colors.white },

        -- JSX
        { group = "TSTagDelimiter", foreground = colors.white },
        { group = "TSTag", foreground = colors.red },

        -- Editor
        { group = "StatusLineNC", foreground = colors.red },
    },
})


