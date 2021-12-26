local load_file = require("utils.load-plugin-file")

------------------------------------------------------------------------------------------
----------------------------------- SHARED -----------------------------------------------
------------------------------------------------------------------------------------------

UTILS = { "nvim-lua/plenary.nvim" }

ICONS = {
    "kyazdani42/nvim-web-devicons",
    config = load_file("icons"),
}

FINDER = {
    "nvim-telescope/telescope.nvim",
    config = load_file("finder"),
    requires = {
        UTILS,
        { "nvim-telescope/telescope-fzy-native.nvim" },
    },
}

------------------------------------------------------------------------------------------
----------------------------------- UNIQUE -----------------------------------------------
------------------------------------------------------------------------------------------

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
        "dstein64/nvim-scrollview",
        config = load_file("smooth-scroll"),
    })
    use({
        "feline-nvim/feline.nvim",
        config = load_file("status-line"),
        requires = ICONS,
    })
    use({
        "folke/todo-comments.nvim",
        config = load_file("todo-comments"),
    })
    use({
        "goolord/alpha-nvim",
        config = load_file("start-screen"),
        requires = ICONS,
    })
    use({
        "hrsh7th/nvim-cmp",
        config = load_file("completion"),
        requires = {
            {
                "onsails/lspkind-nvim",
                config = load_file("completion-icons"),
            },
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-cmdline",
        },
    })
    use({
        "jose-elias-alvarez/minsnip.nvim",
        config = load_file("snippets"),
    })
    use({
        "iamcco/markdown-preview.nvim",
        config = load_file("markdown-preview"),
        run = [[sh -c 'cd app && rm yarn.lock && yarn install']],
    })
    use({
        "jose-elias-alvarez/null-ls.nvim",
        config = load_file("formatter-linter"),
        requires = UTILS,
    })
    use({
        "kazhala/close-buffers.nvim",
        config = load_file("buffer-closer"),
    })
    use({
        "karb94/neoscroll.nvim",
        config = load_file("scrollbar"),
    })
    use(ICONS)
    use({
        "kyazdani42/nvim-tree.lua",
        after = "nvim-web-devicons",
        config = load_file("file-tree"),
        requires = ICONS,
    })
    use({
        "lewis6991/gitsigns.nvim",
        config = load_file("git-status"),
        requires = UTILS,
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
    use("nvim-treesitter/nvim-treesitter")
    use({
        "nvim-treesitter/playground",
        config = load_file("treesitter"),
    })
    use(FINDER)
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
        requires = UTILS,
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
        "vuki656/package-info.nvim",
        config = load_file("package-info"),
        requires = { "muniftanjim/nui.nvim" },
    })
    use({
        "wbthomason/packer.nvim",
        config = load_file("plugin-manager"),
    })
    use({
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
        config = load_file("action-menu"),
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
