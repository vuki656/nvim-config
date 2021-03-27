require'nvim-treesitter.configs'.setup {
    ensure_installed = "maintained",
    highlight = {
        enable = true 
    },
}

local colors = {
    purple = '#be89dd',
    yellow = '#d8bf7a',
    blue = '#5096cb',
    white = "#a5afbe",
    orange = "#d19a66",
    red = '#e06c73'
}

vim.cmd([[highlight! TSKeyword              guifg=]] .. colors.purple)
vim.cmd([[highlight! TSInclude              guifg=]] .. colors.purple)
vim.cmd([[highlight! TSKeywordOperator      guifg=]] .. colors.purple)
vim.cmd([[highlight! TSBoolean              guifg=]] .. colors.purple)
vim.cmd([[highlight! TSConstBuiltin         guifg=]] .. colors.purple)
vim.cmd([[highlight! TSTypeBuiltin          guifg=]] .. colors.purple)
vim.cmd([[highlight! TSVariable             guifg=]] .. colors.white)
vim.cmd([[highlight! TSNamespace            guifg=]] .. colors.white)
vim.cmd([[highlight! TSFunction             guifg=]] .. colors.white)
vim.cmd([[highlight! TSConstructor          guifg=]] .. colors.yellow)
vim.cmd([[highlight! TSParameter            guifg=]] .. colors.orange)

-- Punctuaction
vim.cmd([[highlight! TSPunctBracket         guifg=]] .. colors.white)
vim.cmd([[highlight! TSOperator             guifg=]] .. colors.white)
vim.cmd([[highlight! TSPunctDelimiter       guifg=]] .. colors.white)
vim.cmd([[highlight! TSPunctSpecial         guifg=]] .. colors.white)

-- JSX
vim.cmd([[highlight! TSTagDelimiter         guifg=]] .. colors.white)
vim.cmd([[highlight! TSTag                  guifg=]] .. colors.red)
