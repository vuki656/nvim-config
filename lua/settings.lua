------------------------------------------------------------------------------------------
----------------------------------- GLOBAL -----------------------------------------------
------------------------------------------------------------------------------------------

-- Folding
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.opt.foldenable = true

-- Disable native file tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Set leader
vim.g.mapleader = " "

-- Sync nvim clipboard with sys clipboard
vim.opt.clipboard = "unnamedplus"

-- Highlight line you are on
vim.opt.cursorline = true

-- Enables search results as you type
vim.opt.incsearch = true

-- Enables smart indenting
vim.opt.smartindent = true

-- Time after the buffer is saved
vim.opt.updatetime = 300

-- Enables moues scroll
vim.opt.mouse = "a"

-- Disables swap files
vim.opt.swapfile = false

-- Enables undo files
vim.opt.undofile = true

-- Convert tab to 4 spaces
vim.opt.tabstop = 4

-- Correctly indent lines inside blocks
vim.opt.shiftwidth = 4

-- Enables tab to space conversion
vim.opt.expandtab = true

-- Prefer opening new buffers to the right
vim.opt.splitright = true

-- Prefer opening new buffers below
vim.opt.splitbelow = true

-- Enable nvim set colors
vim.opt.termguicolors = true

-- Enable changing buffers without saving
vim.opt.hidden = true

-- Ignore case when searching
vim.opt.ignorecase = true

-- Ignore case when searching
vim.opt.wildignorecase = true

-- Search with cases sensitive only if search query isn't the same case
vim.opt.smartcase = true

-- Show relative line numbers in the sidebar
vim.opt.relativenumber = true

-- Show sidebar
vim.opt.signcolumn = "yes"

-- Show current line number
vim.opt.number = true

-- Disables line wrapping
vim.opt.wrap = false

-- Enable spellcheck
vim.opt.spell = true

-- Spelling language
vim.opt.spelllang = "en,hr"

-- Don't check if line starts with capital letter
vim.opt.spellcapcheck = ""

-- Number of spell suggestions
vim.opt.spellsuggest = "7"

-- Support camel case spelling
vim.opt.spelloptions = "camel"

-- Use only one global statusline
vim.opt.laststatus = 3

-- Don't redraw screen when using macros (performance increase)
-- vim.opt.lazyredraw = true

-- Scroll offset
vim.opt.scrolloff = 15

-- Scroll amount
vim.opt.scroll = 15

-- Scroll amount
vim.opt.showmode = false

------------------------------------------------------------------------------------------
------------------------------------ AUTO COMMANDS ---------------------------------------
------------------------------------------------------------------------------------------

------------------------------------------------------------------------------------------
------------------------------------ FILETYPES -------------------------------------------
------------------------------------------------------------------------------------------

vim.filetype.add({
    pattern = {
        ["%.env%.[%w_.-]+"] = "dotenv",
        [".gitconfig.*"] = "gitconfig",
    },
    extension = {
        env = "dotenv",
        luacheckrc = "lua",
        mdx = "markdown",
        map = "json",
        http = "http",
    },
    filename = {
        [".env"] = "dotenv",
        ["Jenkinsfile"] = "groovy",
    },
})

------------------------------------------------------------------------------------------
------------------------------------ MISC ------------------------------------------------
------------------------------------------------------------------------------------------

-- Enable syntax
vim.cmd("syntax on")

-- Spell file location
vim.opt.spellfile = vim.fn.expand("$HOME/.config/nvim/spell/en.utf-8.add")

-- Don't continue comment when adding a new line above/under comment
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
    group = vim.api.nvim_create_augroup("DisableAutoComment", { clear = true }),
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ "r", "o" })
    end,
})

-- Disable unused providers
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0

-- Fix cursor hold
vim.g.cursorhold_updatetime = 100

-- Ignore capitalized word misspelling
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    group = vim.api.nvim_create_augroup("IgnoreCamelCaseSpell", { clear = true }),
    pattern = "*",
    callback = function()
        vim.cmd([[syn match myExCapitalWords +\<\w*[A-Z]\K*\>+ contains=@NoSpell]])
    end,
})

-- Enable wrap for markdown files
vim.api.nvim_create_autocmd("FileType", {
    group = vim.api.nvim_create_augroup("MarkdownWrap", { clear = true }),
    pattern = "markdown",
    callback = function()
        vim.opt_local.wrap = true

        vim.keymap.set({ "n", "v" }, "j", "gj", { buffer = true, noremap = true, silent = true, desc = "Move down by visual line" })
        vim.keymap.set({ "n", "v" }, "k", "gk", { buffer = true, noremap = true, silent = true, desc = "Move up by visual line" })
    end,
})

-- Supposed to fix lag. Taken from: https://github.com/akinsho/toggleterm.nvim/issues/610#issuecomment-2477464323
vim.api.nvim_create_augroup("disable_folding_toggleterm", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    group = "disable_folding_toggleterm",
    pattern = "toggleterm",
    callback = function()
        vim.wo.foldmethod = "manual"
        vim.wo.foldtext = "foldtext()"
    end,
})
