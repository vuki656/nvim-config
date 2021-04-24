------------------------------------------------------------------------------------------
----------------------------------- BASE PACKER CONFIG -----------------------------------
------------------------------------------------------------------------------------------

local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  execute 'packadd packer.nvim'
end

------------------------------------------------------------------------------------------
----------------------------------- LIST -------------------------------------------------
------------------------------------------------------------------------------------------

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    use 'tpope/vim-fugitive'
    use 'onsails/lspkind-nvim'
    use {"tweekmonster/startuptime.vim"}
    use 'tpope/vim-commentary'
    use 'windwp/nvim-autopairs'
    use 'alvan/vim-closetag'
    use 'jose-elias-alvarez/nvim-lsp-ts-utils'
    use 'kyazdani42/nvim-tree.lua'
    use {"glepnir/galaxyline.nvim"}
    use 'neovim/nvim-lspconfig'
    use 'airblade/vim-rooter'
    use 'mhinz/vim-startify'
    use 'nvim-treesitter/nvim-treesitter'
    use {"kyazdani42/nvim-web-devicons"}
    use 'rakr/vim-one'
    use 'nvim-treesitter/playground'
    use 'psliwka/vim-smoothie'
    use 'glepnir/lspsaga.nvim'
    use 'hrsh7th/nvim-compe'
    use 'antoinemadec/FixCursorHold.nvim'
    use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
    }
end)
