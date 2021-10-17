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
    use("williamboman/nvim-lsp-installer")
    use("TovarishFin/vim-solidity")
    use({
        "weilbith/nvim-code-action-menu",
        cmd = "CodeActionMenu",
    })
    use("pantharshit00/vim-prisma")
    use("lewis6991/impatient.nvim")
    use("akinsho/nvim-toggleterm.lua")
    use("ahmedkhalf/project.nvim")
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
            "f3fora/cmp-spell",
        },
    })
    use("jose-elias-alvarez/minsnip.nvim")
    use({
        "iamcco/markdown-preview.nvim",
        run = [[sh -c 'cd app && rm yarn.lock && yarn install']],
    })
    use({
        "jose-elias-alvarez/nvim-lsp-ts-utils",
        requires = { "jose-elias-alvarez/null-ls.nvim" },
    })
    use("jose-elias-alvarez/null-ls.nvim")
    use("karb94/neoscroll.nvim")
    use({
        "kyazdani42/nvim-tree.lua",
        requires = { "kyazdani42/nvim-web-devicons" },
        commit = "d7f73b5ae9c8fa85535c32e2861c2cb97df5d56b",
    })
    use({
        "lewis6991/gitsigns.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })
    use("mbbill/undotree")
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
    use("pocco81/autosave.nvim")
    use("rakr/vim-one")
    use("rcarriga/nvim-notify")
    use("tpope/vim-commentary")
    use("ThePrimeagen/harpoon")
    use({
        "vuki656/package-info.nvim",
        branch = "develop",
        requires = { "MunifTanjim/nui.nvim" },
    })
    use("wbthomason/packer.nvim")
    use("windwp/nvim-ts-autotag")
    use("windwp/nvim-autopairs")
    -- use("dstein64/vim-startuptime")
    -- use("~/Projects/test.nvim")
end)
