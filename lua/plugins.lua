local load_file = require("utils.load-plugin-file")

return require("packer").startup(function(use)
    use({
        "akinsho/nvim-toggleterm.lua",
        config = load_file("terminal"),
    })
    use({
        "ahmedkhalf/project.nvim",
        config = load_file("project-manager"),
    })
    use({
        "dstein64/vim-startuptime",
        config = load_file("profiler"),
    })
    use({
        "petertriho/nvim-scrollbar",
        config = load_file("scrollbar"),
    })
    use({
        "feline-nvim/feline.nvim",
        config = load_file("status-line"),
        requires = { "kyazdani42/nvim-web-devicons" },
    })
    use({
        "folke/todo-comments.nvim",
        config = load_file("todo-comments"),
    })
    use({
        "goolord/alpha-nvim",
        config = load_file("start-screen"),
        requires = { "kyazdani42/nvim-web-devicons" },
    })
    use({
        "hrsh7th/nvim-cmp",
        config = load_file("completion"),
        requires = {
            {
                "onsails/lspkind-nvim",
                config = load_file("completion-icons"),
            },
            "l3mon4d3/LuaSnip",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-cmdline",
        },
    })
    use({
        "iamcco/markdown-preview.nvim",
        config = load_file("markdown-preview"),
        run = [[sh -c 'cd app && rm yarn.lock && yarn install']],
    })
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = load_file("formatter-linter"),
        branch = "progress-notifications",
        requires = { "nvim-lua/plenary.nvim" },
    })
    use({
        "kazhala/close-buffers.nvim",
        config = load_file("buffer-closer"),
    })
    use({
        "karb94/neoscroll.nvim",
        config = load_file("smooth-scroll"),
    })
    use({
        "kyazdani42/nvim-web-devicons",
        config = load_file("icons"),
    })
    use({
        "kyazdani42/nvim-tree.lua",
        after = "nvim-web-devicons",
        config = load_file("file-tree"),
        requires = { "kyazdani42/nvim-web-devicons" },
    })
    use({
        "lewis6991/gitsigns.nvim",
        config = load_file("git-status"),
        requires = { "nvim-lua/plenary.nvim" },
    })
    use("lewis6991/impatient.nvim")
    use({
        "mbbill/undotree",
        config = load_file("undo-tree"),
    })
    use({
        "numtostr/comment.nvim",
        config = load_file("commenting"),
        requires = { "joosepalviste/nvim-ts-context-commentstring" },
    })
    use("neovim/nvim-lspconfig")
    use({
        "nvim-treesitter/nvim-treesitter",
        config = load_file("parser"),
        requires = {
            "nvim-treesitter/playground",
        },
    })
    use({
        "nvim-telescope/telescope.nvim",
        config = load_file("finder"),
        requires = {
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzy-native.nvim" },
        },
    })
    use({
        "lukas-reineke/indent-blankline.nvim",
        config = load_file("indent-line"),
    })
    use({
        "lukas-reineke/headlines.nvim",
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
        requires = { "nvim-lua/plenary.nvim" },
    })
    use({
        "rishabhrd/nvim-cheat.sh",
        config = load_file("cheatsheat"),
        requires = "RishabhRD/popfix",
    })
    use({
        "theprimeagen/harpoon",
        config = load_file("bookmarks"),
    })
    use({
        "rrethy/vim-illuminate",
        config = load_file("word-highlighter"),
    })
    use({
        "~/Projects/package-info.nvim",
        config = load_file("js-package-manager"),
        requires = { "muniftanjim/nui.nvim" },
    })
    use({
        "wbthomason/packer.nvim",
        config = load_file("plugin-manager"),
    })
    use({
        "williamboman/nvim-lsp-installer",
        config = load_file("lsp-installer"),
    })
    use("windwp/nvim-ts-autotag")
    use({
        "windwp/nvim-autopairs",
        after = "nvim-cmp",
        config = load_file("auto-pairs"),
    })
end)
