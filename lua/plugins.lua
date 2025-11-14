local config = require("plugins.plugin-manager")

require("lazy").setup({
    {
        "karb94/neoscroll.nvim",
        config = function()
            require("plugins.scrollspeed")
        end,
    },
    {
        "nvim-neotest/neotest",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "antoinemadec/FixCursorHold.nvim",
            "nvim-treesitter/nvim-treesitter",
            "marilari88/neotest-vitest",
        },
        config = function()
            require("plugins.test-runner")
        end,
    },
    {
        "github/copilot.vim",
        config = function()
            require("plugins.copilot")
        end,
    },
    {
        "mistweaverco/kulala.nvim",
        config = function()
            require("plugins.http")
        end,
    },
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("plugins.file-tree-2")
        end,
    },
    {
        "j-hui/fidget.nvim",
        config = function()
            require("plugins.lsp-status")
        end,
    },
    {
        "andrewferrier/debugprint.nvim",
        config = function()
            require("plugins.print")
        end,
    },
    {
        "nvim-pack/nvim-spectre",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("plugins.replace")
        end,
    },
    {
        "folke/zen-mode.nvim",
        config = function()
            require("plugins.focus")
        end,
    },
    {
        "MunifTanjim/nui.nvim",
    },
    {
        "pmizio/typescript-tools.nvim",
        commit = "bf11d98ad5736e1cbc1082ca9a03196d45c701f1",
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
        "akinsho/nvim-toggleterm.lua",
        config = function()
            require("plugins.terminal")
        end,
    },
    {
        "akinsho/git-conflict.nvim",
        tag = "v2.1.0",
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
        "nvim-mini/mini.splitjoin",
        config = function()
            require("plugins.split-join")
        end,
    },
    {
        "vuki656/feline.nvim",
        config = function()
            require("plugins.status-line")
        end,
        dependencies = {
            "nvim-tree/nvim-web-devicons",
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
            -- require("plugins.doc-highlighter")
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
        "mason-org/mason.nvim",
        config = function()
            require("plugins.installer")
        end,
        dependencies = {
            "mason-org/mason-lspconfig.nvim",
            "whoissethdaniel/mason-tool-installer.nvim",
            "neovim/nvim-lspconfig",
        },
    },
    {
        "windwp/nvim-ts-autotag",
    },
}, config)
