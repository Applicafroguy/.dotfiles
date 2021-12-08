--  bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

return require('packer').startup{
  function(use)
  use 'wbthomason/packer.nvim'
  use { "folke/trouble.nvim",
         config = function()
           require("trouble").setup{}
         end
  }
  use { 'tpope/vim-repeat' }
  use { 'tpope/vim-surround' }
  use { 'tpope/vim-fugitive' }
  use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup {}
      end
  }
  use { 'lambdalisue/suda.vim' }
  use { 'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup {}
    end
  }

  -- common dependencies
  use { 'ryanoasis/vim-devicons' }
  use { 'kyazdani42/nvim-web-devicons' }
  use { 'nvim-lua/plenary.nvim' }
  use { 'godlygeek/tabular' }

  -- look and feel
  use { 'hoob3rt/lualine.nvim' }
  use { 'dstein64/nvim-scrollview' }
  use { 'gcmt/taboo.vim' }
  use { 'norcalli/nvim-terminal.lua' }
  use { 'kyazdani42/nvim-tree.lua' }
  use { 'junegunn/goyo.vim' } -- zen-mode
  use { 'tjdevries/colorbuddy.nvim' }
  use { 'gruvbox-community/gruvbox' }
  -- use { 'arcticicestudio/nord-vim',
  --     config = function()
  --     vim.cmd [[colorscheme nord]]
  --     end
  --   }
  use { 'shaunsingh/nord.nvim',
    config = function()
      vim.g.nord_contrast = true
      vim.g.nord_borders = true
      vim.g.nord_disable_background = true
      vim.g.nord_italic = true
      vim.g.nord_enable_sidebar_background = false
      -- require('nord').set()
    end
 }
  use { "catppuccin/nvim", as = "catppuccin",
    config = function()
      require('catppuccin').setup {}
    end
  }

  -- keymaps
  use { 'folke/which-key.nvim' }

  -- telescope
  use { 'nvim-telescope/telescope.nvim' }
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
  use { 'camgraff/telescope-tmux.nvim' }
  use { 'nvim-telescope/telescope-dap.nvim' }
  use { 'dhruvmanila/telescope-bookmarks.nvim' }
  use { 'ahmedkhalf/project.nvim' }
  use {'pwntester/octo.nvim',
      config = function()
        require"octo".setup {}
      end
  }
  use { "AckslD/nvim-neoclip.lua",
      config = function()
        require('neoclip').setup {
          default_register = {'"', '+', '*'}
        }
      end,
  }

  -- run code
  use { 'jpalardy/vim-slime' }

  -- lsp and other built-in anhancers
  use { 'neovim/nvim-lspconfig' }
  use { 'mfussenegger/nvim-dap' }
  use { 'onsails/lspkind-nvim' }
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use { 'nvim-treesitter/nvim-treesitter-textobjects' }
  use { 'aca/emmet-ls' }

  -- completion
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
  use { 'andersevenrud/cmp-tmux' }
  use { 'quangnguyen30192/cmp-nvim-tags' }
  use { 'jc-doyle/cmp-pandoc-references' }
  use { 'L3MON4D3/LuaSnip' }
  use { 'rafamadriz/friendly-snippets' }
  use { 'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{}
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end

  end
}
