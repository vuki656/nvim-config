colors = require('utils.colors')

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

require('gitsigns').setup {
  signs = {
    add          = { hl = 'GitSignsAdd'   , text = '█', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
    change       = { hl = 'GitSignsChange', text = '█', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '█', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '█', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '█', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
  },
}

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

vim.cmd([[highlight! GitSignsAdd        guifg=]]  .. colors.green)
vim.cmd([[highlight! GitSignsChange     guifg=]]  .. colors.orange)
vim.cmd([[highlight! GitSignsDelete     guifg=]]  .. colors.red)
