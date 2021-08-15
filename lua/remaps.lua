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

------------------------------------------------------------------------------------------
----------------------------------- MISC -------------------------------------------------
------------------------------------------------------------------------------------------

-- ReSource lua file
vars.remap.fn("n", "<leader>qq", ":qa<CR>", vars.remap.opts)

-- ReSource lua file
vars.remap.fn("n", "<leader>rs", ":luafile %<CR>", vars.remap.opts)

-- Format file
vars.remap.fn("n", "<leader>ef", ":lua vim.lsp.buf.formatting()<CR>", vars.remap.opts)

------------------------------------------------------------------------------------------
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
