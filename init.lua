local load_file = require("utils.load-plugin-file")

require("settings")

vim.loader.enable()

local path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(path) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        path,
    })
end

vim.opt.rtp:prepend(path)

require("lazy").setup({
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        config = load_file("finder"),
        dependencies = {
            { "nvim-lua/plenary.nvim" },
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
    },
    {"muniftanjim/nui.nvim"},

        {
            "nvim-treesitter/nvim-treesitter",
            config = load_file("parser"),
            build = ":TSUpdate",
            dependencies = {
                "nvim-treesitter/playground"
            },
        },
    {
        "david-kunz/jester",
        config = load_file("jest-runner"),
    },
    {
        "akinsho/nvim-toggleterm.lua",
        config = load_file("terminal/init.lua"),
    },
--        {
--            "akinsho/git-conflict.nvim",
--            config = load_file('git-conflict')
--        },
--        {
--            "ahmedkhalf/project.nvim",
--            config = load_file("project-manager"),
--        },
--        { 
--            "b0o/schemastore.nvim", 
--            config = true,
--        },
--        {
--            "chentoast/marks.nvim",
--            config = load_file("marks"),
--        },
--        {
--            "dstein64/nvim-scrollview",
--            config = load_file("scrollbar"),
--        },
--        {"davidosomething/format-ts-errors.nvim"},
--        {
--            "echasnovski/mini.splitjoin",
--            config = load_file("split-join"),
--        },
--        {
--            "freddiehaddad/feline.nvim",
--            config = load_file("status-line"),
--            requires = "nvim-tree/nvim-web-devicons",
--        },
--        -- use({
--        --     "folke/todo-comments.nvim",
--        --     config = load_file("todo-comments"),
--        -- })
--        {
--            "goolord/alpha-nvim",
--            after = "nvim-tree.lua",
--            config = load_file("start-screen"),
--            requires = "nvim-tree/nvim-web-devicons",
--        },
--        {
--            "nvim-tree/nvim-tree.lua",
--            after = "nvim-web-devicons",
--            config = load_file("file-tree"),
--            requires = "nvim-tree/nvim-web-devicons",
--        },
--        {
--            "hrsh7th/nvim-cmp",
--            config = load_file("completion"),
--            requires = {
--                {
--                    "onsails/lspkind.nvim",
--                    config = load_file("completion-icons"),
--                },
--                {
--                    "l3mon4d3/luasnip",
--                    config = load_file("snippets"),
--                },
--                "hrsh7th/cmp-nvim-lsp",
--                "hrsh7th/cmp-buffer",
--                "hrsh7th/cmp-path",
--                "hrsh7th/cmp-nvim-lua",
--                "hrsh7th/cmp-cmdline",
--                "saadparwaiz1/cmp_luasnip",
--            },
--        },
--        {"jose-elias-alvarez/typescript.nvim"},
--        {
--            "davidgranstrom/nvim-markdown-preview",
--            config = load_file("markdown-preview"),
--            ft = { "markdown" },
--        },
--        {
--            "jose-elias-alvarez/null-ls.nvim",
--            config = load_file("formatter-linter"),
--            requires = "nvim-lua/plenary.nvim",
--        },
--        {
--            "kazhala/close-buffers.nvim",
--            config = load_file("buffer-closer"),
--        },
--        {
--            "nvim-tree/nvim-web-devicons",
--            config = load_file("icons"),
--        },
--        {
--            "lewis6991/gitsigns.nvim",
--            config = load_file("git-status"),
--            requires = "nvim-lua/plenary.nvim",
--        },
--        {
--            "mbbill/undotree",
--            config = load_file("undo-tree"),
--        },
--        {
--            "numtostr/comment.nvim",
--            config = load_file("commenting"),
--            requires = "joosepalviste/nvim-ts-context-commentstring",
--        },
--        {"neovim/nvim-lspconfig"},
--        {
--            "nguyenvukhang/nvim-toggler",
--            config = load_file("toggler"),
--        },
--        {
--            "nvim-treesitter/nvim-treesitter",
--            config = load_file("parser"),
--            run = ":TSUpdate",
--            requires = "nvim-treesitter/playground",
--        },
--        {
--            "nvim-telescope/telescope.nvim",
--            config = load_file("finder"),
--            requires = {
--                { "nvim-lua/plenary.nvim" },
--                {
--                    "nvim-telescope/telescope-fzf-native.nvim",
--                    run = "make",
--                },
--            },
--        },
--        {
--            "lukas-reineke/indent-blankline.nvim",
--            config = load_file("indent-line"),
--        },
--        {
--            "lukas-reineke/headlines.nvim",
--            commit = "4656ed3e4ba8e3e2551fe21f8803ef6953a8d657",
--            config = load_file("doc-highlighter"),
--            ft = { "markdown" },
--        },
--        {
--            "pocco81/auto-save.nvim",
--            config = load_file("auto-save"),
--        },
--        {
--            "rcarriga/nvim-notify",
--            config = load_file("notifications"),
--        },
--        {
--            "ruifm/gitlinker.nvim",
--            config = load_file("git-linker"),
--            requires = "nvim-lua/plenary.nvim",
--        },
--        {
--            "theprimeagen/harpoon",
--            config = load_file("bookmarks"),
--            commit = "21d0d1b",
--        },
--        {
--            "rrethy/vim-illuminate",
--            config = load_file("word-highlighter"),
--        },
--        {
--            "vuki656/package-info.nvim",
--            config = load_file("js-package-manager"),
--            requires = "muniftanjim/nui.nvim",
--        },
--        {
--            "yorickpeterse/nvim-pqf",
--            config = load_file("better-quickfix"),
--        },
--        {"wellle/targets.vim"},
--        {
--            "williamboman/mason.nvim",
--            config = load_file("installer"),
--            branch = "main",
--            requires = {
--                { "williamboman/mason-lspconfig.nvim" },
--                { "whoissethdaniel/mason-tool-installer.nvim" },
--            },
--        },
--        {"windwp/nvim-ts-autotag"},
--        {
--            "windwp/nvim-autopairs",
--            after = "nvim-cmp",
--            config = load_file("auto-pairs"),
--        },
--        -- use({
--        --     "dstein64/vim-startuptime",
--        --     config = load_file("profiler"),
--        -- })
})

require("keymaps")
require("colorscheme")
require("ui")
