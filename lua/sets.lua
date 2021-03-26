local set = vim.o
local global = vim.g

------------------------------------------------------------------------------------------
----------------------------------- GENERAL ----------------------------------------------
------------------------------------------------------------------------------------------

global.mapleader = ' '                              -- Set leader

set.cursorline = true
set.wrap = false
set.number = true
set.relativenumber = true
set.clipboard = 'unnamedplus'
set.incsearch = true
set.smartindent = true
set.signcolumn = 'yes'
set.incsearch = true
set.updatetime = 300
set.scrolloff = 10
set.mouse = 'a'
set.swapfile = false
set.undofile = true
set.scroll = 15
set.tabstop = 4
set.shiftwidth = 4
set.expandtab = true
set.splitright = true
set.splitbelow = true
set.termguicolors =  true

vim.cmd('colorscheme one')
------------------------------------------------------------------------------------------
----------------------------------- PLUGIN REQUIRED --------------------------------------
------------------------------------------------------------------------------------------

-- nvim-compee
set.completeopt = "menuone,noselect"

