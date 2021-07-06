local remap = vim.api.nvim_set_keymap

-- ReSource lua file
remap("n", "<leader>sf", ":luafil %<CR>", { noremap = true, silent = true })

-- Format file
remap("n", "<leader>ef", ":lua vim.lsp.buf.formatting()<CR>", { noremap = true, silent = true })

-- Go to normal mode with jj
remap("i", "jj", "<ESC>", { noremap = true, silent = true })

-- Go to normal mode with kk
remap("i", "kk", "<ESC>", { noremap = true, silent = true })

-- Rotate between last 2 opened files
remap("n", "<leader>8", "<C-^>", { noremap = true, silent = true })

-- Buffer navigation with hjkl
remap("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
remap("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
remap("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
remap("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })

-- Open markdown preview in chrome
remap("n", "<leader>mp", ":MarkdownPreviewToggle<CR>", { noremap = true, silent = true })

-- Insert empty line below
remap("n", "gj", "o<Esc>", { noremap = true, silent = true })

-- Insert empty line above
remap("n", "gk", "O<Esc>", { noremap = true, silent = true })

-- Delete everything on the line
remap("n", "<leader>d", "<S-s><Esc>", { noremap = true, silent = true })

-- Shift buffer size horizontaly
remap("n", "<C-a>", "<C-w>>", { noremap = true, silent = true })
remap("n", "<C-s>", "<C-w><", { noremap = true, silent = true })
