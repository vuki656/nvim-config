local load_file = require("utils.load-plugin-file")

return require("packer").startup({
    function(use)
        -- use({
        --     "dstein64/vim-startuptime",
        --     config = load_file("profiler"),
        -- })
        use({
            "david-kunz/jester",
            config = load_file("jest-runner"),
        })
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
            "dstein64/nvim-scrollview",
            config = load_file("scrollbar"),
        })
        use({
            "echasnovski/mini.splitjoin",
            config = load_file("split-join"),
        })
        use({
            "feline-nvim/feline.nvim",
            config = load_file("status-line"),
            requires = "nvim-tree/nvim-web-devicons",
        })
        -- use({
        --     "folke/todo-comments.nvim",
        --     config = load_file("todo-comments"),
        -- })
        use({
            "goolord/alpha-nvim",
            after = "nvim-tree.lua",
            config = load_file("start-screen"),
            requires = "nvim-tree/nvim-web-devicons",
        })
        use({
            "nvim-tree/nvim-tree.lua",
            after = "nvim-web-devicons",
            config = load_file("file-tree"),
            commit = "9c97e6449b0b0269bd44e1fd4857184dfa57bb4c",
            requires = "nvim-tree/nvim-web-devicons",
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
                    "l3mon4d3/luasnip",
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
            ft = { "markdown" },
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
            "nvim-tree/nvim-web-devicons",
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
        use({
            "narutoxy/silicon.lua",
            config = load_file("screenshot"),
            commit = "3223d26456f728870cacab91662d03bbace6e354",
            requires = { "nvim-lua/plenary.nvim" },
        })
        use("neovim/nvim-lspconfig")
        use({
            "nguyenvukhang/nvim-toggler",
            config = load_file("toggler"),
        })
        use({
            "nvim-treesitter/nvim-treesitter",
            config = load_file("parser"),
            run = ":TSUpdate",
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
            ft = { "markdown" },
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
            commit = "21d0d1b",
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
