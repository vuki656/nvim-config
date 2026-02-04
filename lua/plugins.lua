local config = require("plugins.plugin-manager")

require("lazy").setup({
    {
        dir = "~/Projects/personal/driver.nvim",
        keys = {
            { "<leader>cc", desc = "Toggle Driver chat" },
            { "<leader>cs", desc = "Quick send to Driver" },
        },
        opts = {
            process = {
                permission_mode = "bypassPermissions",
            },
            ui = {
                width = 80,
                position = "right",
            },
        },
    },
    {
        "OXY2DEV/markview.nvim",
        lazy = false,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("plugins.doc-highlighter")
        end,
    },
    {
        -- "vuki656/review.nvim",
        dir = "~/Projects/personal/review.nvim",
        config = function()
            require("plugins.review")
        end,
    },
    {
        "kevinhwang91/nvim-ufo",
        dependencies = { "kevinhwang91/promise-async" },
        event = "VeryLazy",
        config = function()
            require("plugins.fold")
        end,
    },
    {
        "karb94/neoscroll.nvim",
        config = function()
            require("plugins.scrollspeed")
        end,
    },
    {
        "nvim-neotest/neotest",
        event = "VeryLazy",
        dependencies = {
            "nvim-neotest/nvim-nio",
            "nvim-lua/plenary.nvim",
            "nvim-treesitter/nvim-treesitter",
            "marilari88/neotest-vitest",
            "nvim-neotest/neotest-jest",
        },
        config = function()
            require("plugins.test-runner")
        end,
    },
    {
        "mfussenegger/nvim-dap",
        event = "VeryLazy",
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "nvim-neotest/nvim-nio",
            "theHamsta/nvim-dap-virtual-text",
            "jay-babu/mason-nvim-dap.nvim",
        },
        config = function()
            require("plugins.debugger")
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
        ft = "http",
        config = function()
            require("plugins.http")
        end,
    },
    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("plugins.file-explorer")
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
        event = "VeryLazy",
        config = function()
            require("plugins.print")
        end,
    },
    {
        "MagicDuck/grug-far.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.replace")
        end,
    },
    {
        "folke/zen-mode.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.focus")
        end,
    },
    {
        "MunifTanjim/nui.nvim",
    },
    {
        "antosha417/nvim-lsp-file-operations",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "stevearc/conform.nvim",
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
        event = "VeryLazy",
        config = function()
            require("plugins.git-conflict")
        end,
    },
    {
        "b0o/schemastore.nvim",
    },
    {
        "chentoast/marks.nvim",
        event = "VeryLazy",
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
        event = "VeryLazy",
        config = function()
            require("plugins.split-join")
        end,
    },
    {
        dir = vim.fn.stdpath("config") .. "/lua/plugins/status-line",
        event = "VeryLazy",
        config = function()
            require("plugins.status-line")
        end,
    },
    {
        "folke/todo-comments.nvim",
        event = "VeryLazy",
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
            "onsails/lspkind.nvim",
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
        "kazhala/close-buffers.nvim",
        event = "VeryLazy",
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
        event = "VeryLazy",
        config = function()
            require("plugins.undo-tree")
        end,
    },
    {
        "nguyenvukhang/nvim-toggler",
        event = "VeryLazy",
        config = function()
            require("plugins.toggler")
        end,
    },
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        config = function()
            require("plugins.parser")
        end,
    },
    {
        "lukas-reineke/indent-blankline.nvim",
        config = function()
            require("plugins.indent-line")
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
        event = "VeryLazy",
        config = function()
            require("plugins.git-linker")
        end,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        "theprimeagen/harpoon",
        branch = "harpoon2",
        dependencies = { "nvim-lua/plenary.nvim" },
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
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("plugins.which-key")
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
}, config)
