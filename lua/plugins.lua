------------------------------------------------------------------------------------------
----------------------------------- BASE PACKER CONFIG -----------------------------------
------------------------------------------------------------------------------------------
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

------------------------------------------------------------------------------------------
----------------------------------- LIST -------------------------------------------------
------------------------------------------------------------------------------------------

return require("packer").startup(
    function()
        use "airblade/vim-rooter"
        use "antoinemadec/FixCursorHold.nvim"
        use "folke/todo-comments.nvim"
        use "folke/which-key.nvim"
        use "glepnir/lspsaga.nvim"
        use { 
            "glepnir/galaxyline.nvim",
            requires = { "kyazdani42/nvim-web-devicons" }
        }
        use "hrsh7th/nvim-compe"
        use {
            "iamcco/markdown-preview.nvim",
            run = function()
                vim.fn["mkdp#util#install"]()
            end,
            ft = { "markdown" },
        }
        use { 
            "jose-elias-alvarez/nvim-lsp-ts-utils",
            requires = { "/jose-elias-alvarez/null-ls.nvim" }
        }
        use "kyazdani42/nvim-tree.lua"
        use { 
            "lewis6991/gitsigns.nvim",
            requires = { "nvim-lua/plenary.nvim" }
        }
        use "mhinz/vim-startify"
        use "mhartington/formatter.nvim"
        use "neovim/nvim-lspconfig"
        use "nvim-treesitter/nvim-treesitter"
        use "nvim-treesitter/playground"
        use {
            "nvim-telescope/telescope.nvim",
            requires = {
                { "nvim-lua/popup.nvim" },
                { "nvim-lua/plenary.nvim" },
                { "nvim-telescope/telescope-fzy-native.nvim" },
            },
        }
        use "onsails/lspkind-nvim"
        use "psliwka/vim-smoothie"
        use "rakr/vim-one"
        use "tpope/vim-fugitive"
        use "tpope/vim-commentary"
        use "ThePrimeagen/harpoon"
        use "tweekmonster/startuptime.vim"
        use "wbthomason/packer.nvim"
        use "windwp/nvim-ts-autotag"
        use "windwp/nvim-autopairs"
        use "Yggdroot/indentLine"
    end
)
