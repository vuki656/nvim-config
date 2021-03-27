local set = vim.o
local set_window = vim.wo
local global = vim.g

------------------------------------------------------------------------------------------
----------------------------------- GENERAL ----------------------------------------------
------------------------------------------------------------------------------------------

global.mapleader = ' '                              -- Set leader

set.cursorline = true
set.clipboard = 'unnamedplus'
set.incsearch = true
set.smartindent = true
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
set.termguicolors = true

set_window.relativenumber = true
set_window.signcolumn = 'yes'
set_window.number = true
set_window.wrap = false


vim.cmd([[
    colorscheme one
    syntax on
]])
------------------------------------------------------------------------------------------
----------------------------------- PLUGIN REQUIRED --------------------------------------
------------------------------------------------------------------------------------------

-- nvim-compee
set.completeopt = "menuone,noselect"

-- fix-cursor-hold
vim.cmd('let g:cursorhold_updatetime = 100')
