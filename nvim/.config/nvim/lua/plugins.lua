-- bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use { "folke/trouble.nvim",
        config = function()
          require("trouble").setup{}
        end
  }

  use { 'nvim-telescope/telescope-packer.nvim' }

  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-commentary' }
  use { 'tpope/vim-fugitive' }

  use { 'aca/emmet-ls' }
  use { 'gcmt/taboo.vim' }
  use { 'arcticicestudio/nord-vim' }
  use { 'gruvbox-community/gruvbox' }
  use { 'norcalli/nvim-terminal.lua' }
  use { 'hoob3rt/lualine.nvim' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'folke/which-key.nvim' }
  use { 'dstein64/nvim-scrollview' }
  use { 'kdheepak/tabline.nvim' }
  use {'kyazdani42/nvim-web-devicons'}
  use { 'junegunn/goyo.vim' }
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'ryanoasis/vim-devicons' }
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'camgraff/telescope-tmux.nvim' }
  use { 'ahmedkhalf/project.nvim' }
  use { 'jpalardy/vim-slime' }
  use { 'neovim/nvim-lspconfig' }
  use { 'williamboman/nvim-lsp-installer'  }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  use { 'hrsh7th/nvim-cmp' }
  use { 'hrsh7th/cmp-nvim-lsp' }
  use { 'hrsh7th/cmp-buffer' }
  use { 'hrsh7th/cmp-path' }
  use { 'hrsh7th/cmp-calc' }
  use { 'saadparwaiz1/cmp_luasnip' }
  use { 'hrsh7th/cmp-nvim-lua' }
  use { 'f3fora/cmp-spell' }
  use { 'ray-x/cmp-treesitter' }
  use { 'tamago324/cmp-zsh' }
  use { 'andersevenrud/compe-tmux', branch = 'cmp' }
  use { 'quangnguyen30192/cmp-nvim-tags' }
  use { 'jc-doyle/cmp-pandoc-references' }
  use { 'onsails/lspkind-nvim' }
  use { 'windwp/nvim-autopairs' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'rafamadriz/friendly-snippets' }
  use { 'godlygeek/tabular' }
end)

