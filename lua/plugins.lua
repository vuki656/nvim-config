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
            "goolord/alpha-nvim",
            after = "nvim-tree.lua",
            config = load_file("start-screen"),
            requires = "kyazdani42/nvim-web-devicons",
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
            "karb94/neoscroll.nvim",
            commit = "6fca0bd5899e91d3e2deab30172d298b87ba5a38",
            config = load_file("smooth-scroll"),
        })
        use({
            "kyazdani42/nvim-web-devicons",
            config = load_file("icons"),
        })
        use({
            "kyazdani42/nvim-tree.lua",
            commit = "19dcacf06e26ca8cf2f160768044cc11db4e66fb",
            after = "nvim-web-devicons",
            config = load_file("file-tree"),
            requires = "kyazdani42/nvim-web-devicons",
        })
        use({
            "lewis6991/gitsigns.nvim",
            config = load_file("git-status"),
            commit = "4861666b58f525456f6cf68319e4fc6703b5ee65",
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
            commit = "f71ba8448c611e786f1406e7aa70659b243e2cfa",
            config = load_file("doc-highlighter"),
        })
        use({
            "pocco81/autosave.nvim",
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
        use("williamboman/nvim-lsp-installer")
        use("windwp/nvim-ts-autotag")
        use({
            "windwp/nvim-autopairs",
            after = "nvim-cmp",
            config = load_file("auto-pairs"),
        })
    end,
    config = {
        display = {
            open_fn = function()
                return require("packer.util").float({ border = "single" })
            end,
        },
    },
})
