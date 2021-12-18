local packer = require("packer")

------------------------------------------------------------------------------------------
----------------------------------- BASE PACKER CONFIG -----------------------------------
------------------------------------------------------------------------------------------

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute("packadd packer.nvim")
end

------------------------------------------------------------------------------------------
----------------------------------- LIST -------------------------------------------------
------------------------------------------------------------------------------------------

return packer.startup(function(use)
    use("akinsho/nvim-toggleterm.lua")
    use("ahmedkhalf/project.nvim")
    use("dstein64/vim-startuptime")
    use("dstein64/nvim-scrollview")
    use({
        "famiu/feline.nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
    })
    use("folke/todo-comments.nvim")
    use({
        "goolord/alpha-nvim",
        requires = { "kyazdani42/nvim-web-devicons" },
    })
    use({
        "hrsh7th/nvim-cmp",
        requires = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-cmdline",
        },
    })
    use("jose-elias-alvarez/minsnip.nvim")
    use({
        "iamcco/markdown-preview.nvim",
        run = [[sh -c 'cd app && rm yarn.lock && yarn install']],
    })
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })
    use("kazhala/close-buffers.nvim")
    use("karb94/neoscroll.nvim")
    use({
        "kyazdani42/nvim-tree.lua",
        requires = { "kyazdani42/nvim-web-devicons" },
    })
    use({
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })
    use("lewis6991/impatient.nvim")
    use("mbbill/undotree")
    use({
        "numtostr/comment.nvim",
        requires = { "joosepalviste/nvim-ts-context-commentstring" },
    })
    use("neovim/nvim-lspconfig")
    use("nvim-treesitter/nvim-treesitter")
    use("nvim-treesitter/playground")
    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzy-native.nvim" },
        },
    })
    use("onsails/lspkind-nvim")
    use("lukas-reineke/indent-blankline.nvim")
    use("lukas-reineke/headlines.nvim")
    use("pocco81/autosave.nvim")
    use("rakr/vim-one")
    use("rcarriga/nvim-notify")
    use({
        "ruifm/gitlinker.nvim",
        requires = "nvim-lua/plenary.nvim",
    })
    use("theprimeagen/harpoon")
    use("rrethy/vim-illuminate")
    use({
        "vuki656/package-info.nvim",
        requires = { "muniftanjim/nui.nvim" },
    })
    use("wbthomason/packer.nvim")
    use({
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
    })
    use("windwp/nvim-ts-autotag")
    use("windwp/nvim-autopairs")
    use("williamboman/nvim-lsp-installer")
end)
