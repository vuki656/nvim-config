local set_buffer = vim.o
local set_window = vim.wo
local set_global = vim.g

------------------------------------------------------------------------------------------
----------------------------------- GLOBAL -----------------------------------------------
------------------------------------------------------------------------------------------

-- Set leader
set_global.mapleader = " "

------------------------------------------------------------------------------------------
----------------------------------- BUFFER -----------------------------------------------
------------------------------------------------------------------------------------------

-- Sync nvim clipboard with sys clipboard
set_buffer.clipboard = "unnamedplus"

-- Highlight line you are on
set_buffer.cursorline = true

-- Enables search results as you type
set_buffer.incsearch = true

-- Enables smart indenting
set_buffer.smartindent = true

-- Time after the buffer is saved
set_buffer.updatetime = 300

-- Enables moues scroll
set_buffer.mouse = "a"

-- Disables swap files
set_buffer.swapfile = false

-- Enables undo files
set_buffer.undofile = true

-- Convert tab to 4 spaces
set_buffer.tabstop = 4

-- Correctly indent lines inside blocks
set_buffer.shiftwidth = 4

-- Enables tab to space conversion
set_buffer.expandtab = true

-- Preffer opening new buffers to the right
set_buffer.splitright = true

-- Preffer opening new buffers below
set_buffer.splitbelow = true

-- Enable nvim set colors
set_buffer.termguicolors = true

-- Enable changing buffers without saving
set_buffer.hidden = true

-- Scroll offset
set_buffer.scrolloff = 15

-- Scroll amount
set_buffer.scroll = 15

------------------------------------------------------------------------------------------
----------------------------------- WINDOW -----------------------------------------------
------------------------------------------------------------------------------------------

-- Show relative line numbers in the sidebar
set_window.relativenumber = true

-- Show sidebar
set_window.signcolumn = "yes"

-- Show current line number
set_window.number = true

-- Disables line wrapping
set_window.wrap = false

------------------------------------------------------------------------------------------
------------------------------------ MISC ------------------------------------------------
------------------------------------------------------------------------------------------

vim.cmd([[
        colorscheme one
        syntax on
        set noshowmode  
        set noshowcmd 
        set nrformats=
        set formatoptions-=cro
]])

-- Hide ~ from sign column
vim.cmd("hi EndOfBuffer guifg=#282c34")

-- Skinny buffer separator
vim.cmd("hi VertSplit guibg=NONE")

-- Fix cursor hold
vim.cmd("let g:cursorhold_updatetime = 100")
