local load_file = require("utils.load-plugin-file")

return require("packer").startup({
    function(use)
        use({
            "akinsho/nvim-toggleterm.lua",
            config = load_file("terminal"),
        })
        use({
            "ahmedkhalf/project.nvim",
            config = load_file("project-manager"),
        })
        use("b0o/schemastore.nvim")
        use({
            "chentoast/marks.nvim",
            config = load_file("marks"),
        })
        use({
            "NvChad/nvim-colorizer.lua",
            config = load_file("css-colorizer"),
        })
        use({
            "dstein64/vim-startuptime",
            config = load_file("profiler"),
        })
        use({
            "dstein64/nvim-scrollview",
            config = load_file("scrollbar"),
        })
        use({
            "feline-nvim/feline.nvim",
            config = load_file("status-line"),
            requires = "kyazdani42/nvim-web-devicons",
        })
        use({
            "folke/todo-comments.nvim",
            config = load_file("todo-comments"),
        })
        use({
            "samodostal/image.nvim",
            requires = { "nvim-lua/plenary.nvim" },
            config = load_file("image-viewer"),
        })
        use({
            "goolord/alpha-nvim",
            config = load_file("start-screen"),
            requires = "kyazdani42/nvim-web-devicons",
        })
        use({
            "nvim-neo-tree/neo-tree.nvim",
            branch = "v2.x",
            config = load_file("file-tree"),
            requires = {
                "nvim-lua/plenary.nvim",
                "kyazdani42/nvim-web-devicons",
                "MunifTanjim/nui.nvim",
            },
        })
        use({
            "hrsh7th/nvim-cmp",
            config = load_file("completion"),
            requires = {
                {
                    "onsails/lspkind.nvim",
                    config = load_file("completion-icons"),
                },
                {
                    "l3mon4d3/LuaSnip",
                    config = load_file("snippets"),
                },
                "hrsh7th/cmp-nvim-lsp",
                "hrsh7th/cmp-buffer",
                "hrsh7th/cmp-path",
                "hrsh7th/cmp-nvim-lua",
                "hrsh7th/cmp-cmdline",
                "saadparwaiz1/cmp_luasnip",
            },
        })
        use("jose-elias-alvarez/typescript.nvim")
        use({
            "davidgranstrom/nvim-markdown-preview",
            config = load_file("markdown-preview"),
        })
        use({
            "jose-elias-alvarez/null-ls.nvim",
            config = load_file("formatter-linter"),
            requires = "nvim-lua/plenary.nvim",
        })
        use({
            "kazhala/close-buffers.nvim",
            config = load_file("buffer-closer"),
        })
        use({
            "declancm/cinnamon.nvim",
            config = load_file("smooth-scroll"),
        })
        use({
            "kyazdani42/nvim-web-devicons",
            config = load_file("icons"),
        })
        use({
            "lewis6991/gitsigns.nvim",
            config = load_file("git-status"),
            requires = "nvim-lua/plenary.nvim",
        })
        use("lewis6991/impatient.nvim")
        use({
            "mbbill/undotree",
            config = load_file("undo-tree"),
        })
        use({
            "numtostr/comment.nvim",
            config = load_file("commenting"),
            requires = "joosepalviste/nvim-ts-context-commentstring",
        })
        use("neovim/nvim-lspconfig")
        use({
            "nvim-treesitter/nvim-treesitter",
            config = load_file("parser"),
            run = ":TSUpdate all",
            requires = "nvim-treesitter/playground",
        })
        use({
            "nvim-telescope/telescope.nvim",
            config = load_file("finder"),
            requires = {
                { "nvim-lua/plenary.nvim" },
                {
                    "nvim-telescope/telescope-fzf-native.nvim",
                    run = "make",
                },
            },
        })
        use({
            "lukas-reineke/indent-blankline.nvim",
            config = load_file("indent-line"),
        })
        use({
            "lukas-reineke/headlines.nvim",
            commit = "4656ed3e4ba8e3e2551fe21f8803ef6953a8d657",
            config = load_file("doc-highlighter"),
        })
        use({
            "pocco81/auto-save.nvim",
            config = load_file("auto-save"),
        })
        use({
            "rcarriga/nvim-notify",
            config = load_file("notifications"),
        })
        use({
            "ruifm/gitlinker.nvim",
            config = load_file("git-linker"),
            requires = "nvim-lua/plenary.nvim",
        })
        use({
            "theprimeagen/harpoon",
            config = load_file("bookmarks"),
        })
        use({
            "rrethy/vim-illuminate",
            config = load_file("word-highlighter"),
        })
        use("muniftanjim/nui.nvim")
        use({
            "vuki656/package-info.nvim",
            config = load_file("js-package-manager"),
            requires = "muniftanjim/nui.nvim",
        })
        use({
            "wbthomason/packer.nvim",
            config = load_file("plugin-manager"),
        })
        use("wellle/targets.vim")
        use({
            "williamboman/mason.nvim",
            config = load_file("installer"),
            branch = "main",
            requires = {
                { "williamboman/mason-lspconfig.nvim" },
                { "whoissethdaniel/mason-tool-installer.nvim" },
            },
        })
        use("windwp/nvim-ts-autotag")
        use({
            "windwp/nvim-autopairs",
            after = "nvim-cmp",
            config = load_file("auto-pairs"),
        })
    end,
})
