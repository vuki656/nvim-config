-- Name: Git Signs
-- Description: Git status in sidebar
-- Link: https://github.com/lewis6991/gitsigns.nvim

local git_signs = require('gitsigns')
local colors = require('utils.colors')

------------------------------------------------------------------------------------------
----------------------------------- SETUP ------------------------------------------------
------------------------------------------------------------------------------------------

git_signs.setup {
  signs = {
    add          = { hl = 'GitSignsAdd'   , text = '█', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'    },
    change       = { hl = 'GitSignsChange', text = '█', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
    delete       = { hl = 'GitSignsDelete', text = '█', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    topdelete    = { hl = 'GitSignsDelete', text = '█', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn' },
    changedelete = { hl = 'GitSignsChange', text = '█', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn' },
  },
  current_line_blame = true,
}

------------------------------------------------------------------------------------------
----------------------------------- COLORS -----------------------------------------------
------------------------------------------------------------------------------------------

vim.cmd([[highlight! GitSignsAdd        guifg=]]  .. colors.green)
vim.cmd([[highlight! GitSignsChange     guifg=]]  .. colors.orange)
vim.cmd([[highlight! GitSignsDelete     guifg=]]  .. colors.red)
