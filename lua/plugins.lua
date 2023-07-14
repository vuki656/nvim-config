local config = require("plugins.plugin-manager")

require("lazy").setup({
    {
        "pmizio/typescript-tools.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "neovim/nvim-lspconfig",
            {
                "antosha417/nvim-lsp-file-operations",
                dependencies = {
                    "nvim-lua/plenary.nvim",
                },
            },
            {
                "davidosomething/format-ts-errors.nvim",
                ft = {
                    "javascript",
                    "javascriptreact",
                    "typescript",
                    "typescriptreact",
                },
            },
        },
    },
    {
        "mhartington/formatter.nvim",
        config = function()
            require("plugins.formatter")
        end,
    },
    {
        "nvim-lua/plenary.nvim",
    },
    {
        "nvim-telescope/telescope.nvim",
        config = function()
            require("plugins.finder")
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
        },
    },
    {
        "mfussenegger/nvim-lint",
        config = function()
            require("plugins.linter")
        end,
    },
    {
        "muniftanjim/nui.nvim",
    },
    {
        "david-kunz/jester",
        config = function()
            require("plugins.jest-runner")
        end,
        ft = {
            "javascript",
            "typescript",
        },
    },
    {
        "akinsho/nvim-toggleterm.lua",
        config = function()
            require("plugins.terminal")
        end,
    },
    {
        "akinsho/git-conflict.nvim",
        config = function()
            require("plugins.git-conflict")
        end,
    },
    {
        "ahmedkhalf/project.nvim",
        config = function()
            require("plugins.project-manager")
        end,
    },
    {
        "b0o/schemastore.nvim",
    },
    {
        "chentoast/marks.nvim",
        config = function()
            require("plugins.marks")
        end,
    },
    {
        "dstein64/nvim-scrollview",
        config = function()
            require("plugins.scrollbar")
        end,
    },
    {
        "echasnovski/mini.splitjoin",
        config = function()
            require("plugins.split-join")
        end,
    },
    {
        "freddiehaddad/feline.nvim",
        config = function()
            require("plugins.status-line")
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "vuki656/package-info.nvim",
        config = function()
            require("plugins.js-package-manager")
        end,
        ft = {
            "json",
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
        },
        dependencies = {
            "muniftanjim/nui.nvim",
        },
    },
    {
        "folke/todo-comments.nvim",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("plugins.todo")
        end,
    },
    {
        "goolord/alpha-nvim",
        config = function()
            require("plugins.start-screen")
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "nvim-tree/nvim-tree.lua",
        config = function()
            require("plugins.file-tree")
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("plugins.completion")
        end,
        dependencies = {
            {
                "onsails/lspkind.nvim",
                config = function()
                    require("plugins.completion-icons")
                end,
            },
            {
                "l3mon4d3/luasnip",
                config = function()
                    require("plugins.snippets")
                end,
            },
            {
                "windwp/nvim-autopairs",
                config = function()
                    require("plugins.auto-pairs")
                end,
            },
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-cmdline",
            "saadparwaiz1/cmp_luasnip",
        },
    },
    {
        "davidgranstrom/nvim-markdown-preview",
        config = function()
            require("plugins.markdown-preview")
        end,
        ft = {
            "markdown",
        },
    },
    {
        "kazhala/close-buffers.nvim",
        config = function()
            require("plugins.buffer-closer")
        end,
    },
    {
        "nvim-tree/nvim-web-devicons",
        config = function()
            require("plugins.icons")
        end,
    },
    {
        "folke/lazy.nvim",
    },
    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("plugins.git-status")
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "mbbill/undotree",
        config = function()
            require("plugins.undo-tree")
        end,
    },
    {
        "numtostr/comment.nvim",
        config = function()
            require("plugins.commenting")
        end,
        dependencies = {
            "joosepalviste/nvim-ts-context-commentstring",
        },
    },
    {
        "nguyenvukhang/nvim-toggler",
        config = function()
            require("plugins.toggler")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require("plugins.parser")
        end,
        dependencies = {
            "nvim-treesitter/playground",
        },
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("plugins.indent-line")
        end,
    },
    {
        "lukas-reineke/headlines.nvim",
        commit = "4656ed3e4ba8e3e2551fe21f8803ef6953a8d657",
        config = function()
            require("plugins.doc-highlighter")
        end,
        ft = {
            "markdown",
        },
    },
    {
        "pocco81/auto-save.nvim",
        config = function()
            require("plugins.auto-save")
        end,
    },
    {
        "rcarriga/nvim-notify",
        config = function()
            require("plugins.notifications")
        end,
    },
    {
        "ruifm/gitlinker.nvim",
        config = function()
            require("plugins.git-linker")
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "theprimeagen/harpoon",
        config = function()
            require("plugins.bookmarks")
        end,
        commit = "21d0d1b",
    },
    {
        "rrethy/vim-illuminate",
        config = function()
            require("plugins.word-highlighter")
        end,
    },
    {
        "yorickpeterse/nvim-pqf",
        config = function()
            require("plugins.better-quickfix")
        end,
    },
    {
        "wellle/targets.vim",
    },
    {
        "williamboman/mason.nvim",
        config = function()
            require("plugins.installer")
        end,
        branch = "main",
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "whoissethdaniel/mason-tool-installer.nvim",
            "neovim/nvim-lspconfig",
        },
    },
    {
        "windwp/nvim-ts-autotag",
    },
}, config)
