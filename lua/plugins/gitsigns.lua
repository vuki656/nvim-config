require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '█', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '█', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '█', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '█', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '█', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
}

vim.cmd([[
    highlight GitSignsAdd guifg=#98c379
    highlight GitSignsChange guifg=#d19a66
    highlight GitSignsDelete guifg=#e06c75
]])
