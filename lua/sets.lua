local set = vim.o
local set_window = vim.wo
local global = vim.g

------------------------------------------------------------------------------------------
----------------------------------- GENERAL ----------------------------------------------
------------------------------------------------------------------------------------------

global.mapleader = ' '                              -- Set leader

set.clipboard = 'unnamedplus'                       -- Sync nvim clipbard with sys clipboard
set.cursorline = true                               -- Highlight line you are on
set.incsearch = true                                -- Enables search results as you type
set.smartindent = true                              -- Enables smart indenting
set.updatetime = 300                                -- Time after the buffer is saved
set.mouse = 'a'                                     -- Enables moues scroll
set.swapfile = false                                -- Disables swap files
set.undofile = true                                 -- Enables undo files
set.tabstop = 4                                     -- Convert tab to 4 spaces
set.shiftwidth = 4                                  -- Correctly indent lines inside blocks
set.expandtab = true                                -- Enables tab to space conversion
set.splitright = true                               -- Preffer opening new buffers to the right
set.splitbelow = true                               -- Preffer opening new buffers below
set.termguicolors = true                            -- Enable nvim set colors 
set.hidden = true                                   -- Enable changing buffers without saving
set.scrolloff = 15                                  -- Scroll offset
set.scroll = 15                                     -- Scroll amount

set_window.relativenumber = true                    -- Show relative line numbers in the sidebar
set_window.signcolumn = 'yes'                       -- Show sidebar
set_window.number = true                            -- Show current line number
set_window.wrap = false                             -- Disables line wrapping

vim.cmd([[
    colorscheme one
    syntax on
    set noshowmode  
    set noshowcmd 
    set nohlsearch
]])

-- Hide ~ from sign column
vim.cmd("hi EndOfBuffer guifg=#282c34")


-- Skinny buffer separator
vim.cmd("hi VertSplit guibg=NONE")

------------------------------------------------------------------------------------------
----------------------------------- PLUGIN REQUIRED --------------------------------------
------------------------------------------------------------------------------------------


-- fix-cursor-hold
vim.cmd('let g:cursorhold_updatetime = 100')
