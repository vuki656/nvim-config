local option = vim.api.nvim_set_option
local win_option = vim.api.nvim_win_set_option
local global = vim.g

------------------------------------------------------------------------------------------
----------------------------------- GENERAL ----------------------------------------------
------------------------------------------------------------------------------------------

global.mapleader = ' '                              -- Set leader

option('clipboard', 'unnamedplus')                  -- Sync system and nvim clipboards
option('incsearch', true)                           -- Incremental search
option('smartindent', true)                         -- Smart indenting
option('signcolumn', 'yes')                         -- Always show sign column
option('updatetime', 300)                           -- Update time
option('scrolloff', 10)                             -- When 10 lines from window edge, start scrolling
option('mouse', 'a')                                -- Enable mouse scrolling
option('swapfile', false)                           -- Disable swap files
option('undofile', true)                            -- Enable undo files
option('scroll', 15)                                -- Scroll line amount
option('tabstop', 4)                                -- Convert tab to 4 spaces
option('shiftwidth', 4)                             -- Correct block indentation
option('expandtab', true)                           -- Convert tabs to spaces
option('splitright', true)                          -- Open new buffers to the right
option('splitbelow', true)                          -- Open new buffers to the bottom
option('termguicolors', true)                       -- Enable colorschemes

win_option(0, 'cursorline', true)                   -- Highlight cursor line
win_option(0, 'wrap', false)                        -- Don't wrap text
win_option(0, 'number', true)                       -- Display sidebar numbers
win_option(0, 'relativenumber', true)               -- Display sidebar numbers relative 

-- To be converted
vim.cmd('colorscheme one')

------------------------------------------------------------------------------------------
----------------------------------- PLUGIN REQUIRED --------------------------------------
------------------------------------------------------------------------------------------

-- nvim-compee
option('completeopt', 'menuone,noselect')

