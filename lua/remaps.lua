local vars = require("utils.vars")

------------------------------------------------------------------------------------------
----------------------------------- NAVIGATION -------------------------------------------
------------------------------------------------------------------------------------------

-- Rotate between last 2 opened files
vars.remap.fn("n", "<leader>ro", "<C-^>", vars.remap.opts)

-- Buffer navigation with hjkl
vars.remap.fn("n", "<C-h>", "<C-w>h", vars.remap.opts)
vars.remap.fn("n", "<C-l>", "<C-w>l", vars.remap.opts)
vars.remap.fn("n", "<C-j>", "<C-w>j", vars.remap.opts)
vars.remap.fn("n", "<C-k>", "<C-w>k", vars.remap.opts)

------------------------------------------------------------------------------------------
----------------------------------- BUFFER -----------------------------------------------
------------------------------------------------------------------------------------------

-- Shift buffer size horizontally
vars.remap.fn("n", "<C-s>", "<C-w><", vars.remap.opts)
vars.remap.fn("n", "<C-a>", "<C-w>>", vars.remap.opts)

-- Remap ESC to also clear search highlight
vars.remap.fn("n", "<BS>", ":noh<CR>", vars.remap.opts)

-- Center the next search result in buffer
vars.remap.fn("n", "n", "nzzzv", vars.remap.opts)

-- Center the previous search result in buffer
vars.remap.fn("n", "N", "Nzzzv", vars.remap.opts)

------------------------------------------------------------------------------------------
----------------------------------- LINE -------------------------------------------------
------------------------------------------------------------------------------------------

-- Go to normal mode with jj
vars.remap.fn("i", "jj", "<ESC>", vars.remap.opts)

-- Go to normal mode with kk
vars.remap.fn("i", "kk", "<ESC>", vars.remap.opts)

-- Insert empty line below
vars.remap.fn("n", "gj", "o<Esc>'[k", vars.remap.opts)

-- Insert empty line above
vars.remap.fn("n", "gk", "O<Esc>j", vars.remap.opts)

-- Delete everything on the line
vars.remap.fn("n", "<leader>d", "<S-s><Esc>", vars.remap.opts)

-- Go to start of line
vars.remap.fn("n", "H", "^", vars.remap.opts)

-- Go to end of line
vars.remap.fn("n", "L", "$", vars.remap.opts)

-- Highlight until the end of the line
vars.remap.fn("n", "V", "v$", vars.remap.opts)

-- Highlight end of line
vars.remap.fn("n", "vv", "V", vars.remap.opts)

-- Remove the line below without visiting it
vars.remap.fn("n", "dJ", "jddk", vars.remap.opts)

-- Remove the line above without visiting it
vars.remap.fn("n", "dK", "kdd", vars.remap.opts)

-- Inline line by line and keep position
vars.remap.fn("n", "J", "J0", vars.remap.opts)

------------------------------------------------------------------------------------------
----------------------------------- MISC -------------------------------------------------
------------------------------------------------------------------------------------------

-- ReSource lua file
vars.remap.fn("n", "<leader>rs", ":luafile %<CR>", vars.remap.opts)

-- Format file
vars.remap.fn("n", "<leader>ef", ":lua vim.lsp.buf.formatting()<CR>", vars.remap.opts)

------------------------------------------------------------------------------------------
----------------------------------- SPELLCHECK -------------------------------------------
------------------------------------------------------------------------------------------

-- Go to next misspell
vars.remap.fn("n", "zn", "]s", vars.remap.opts)

-- Go to previous misspell
vars.remap.fn("n", "zp", "[s", vars.remap.opts)

-- Open word fix suggestions
vars.remap.fn("n", "zf", "z=", vars.remap.opts)


-----------------------------------------------------------------------------------------
----------------------------------- TMUX PIPES -------------------------------------------
------------------------------------------------------------------------------------------

-- Send codegen
vars.remap.fn(
    "n",
    "<leader>yc",
    ':!tmux send-keys -t "QIA Dashboard":TERM.1 "yarn codegen" C-m <CR><CR>',
    vars.remap.opts
)

-- Send install
vars.remap.fn("n", "<leader>yi", ':!tmux send-keys -t "QIA Dashboard":TERM.1 "yarn" C-m <CR><CR>', vars.remap.opts)
