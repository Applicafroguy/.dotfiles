--  bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  Packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd [[packadd packer.nvim]]

vim.cmd [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
    autocmd BufWritePost plugins.lua PackerCompile
  augroup end
]]

return require('packer').startup{
  function(use)
    use 'wbthomason/packer.nvim'
    use { "folke/trouble.nvim",
           config = function()
             require("trouble").setup{}
           end
    }

    -- actions and bindings
    use { 'tpope/vim-repeat' }
    use { 'tpope/vim-surround' }
    use { 'lambdalisue/suda.vim' }
    use { 'numToStr/Comment.nvim',
      config = function()
          require('Comment').setup {}
      end
    }

    -- keymaps
    use { 'folke/which-key.nvim' }

    -- git and projects
    use { 'tpope/vim-fugitive' }
    use { 'folke/todo-comments.nvim',
      config = function()
        require'todo-comments'.setup {}
      end
    }
    use { 'sindrets/diffview.nvim',
      config = function()
        require'diffview'.setup()
      end
    }
    use { 'TimUntersberger/neogit',
      config = function()
        require('neogit').setup {
          disable_commit_confirmation = true,
          integrations = {
              diffview = true
            }
          }
      end
    }
    use { 'ThePrimeagen/git-worktree.nvim' }
    use { 'lewis6991/gitsigns.nvim',
        config = function()
          require('gitsigns').setup {}
        end
    }
    use {'pwntester/octo.nvim',
        config = function()
          require"octo".setup {}
        end
    }

    -- common dependencies
    use { 'ryanoasis/vim-devicons' }
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'godlygeek/tabular' }

    -- look and feel
    use { 'nvim-lualine/lualine.nvim' }
    use { 'arkav/lualine-lsp-progress'}
    use { 'dstein64/nvim-scrollview' }
    use { 'gcmt/taboo.vim' }
    use { 'norcalli/nvim-terminal.lua' }
    use { 'kyazdani42/nvim-tree.lua' }
    use { 'junegunn/goyo.vim' } -- zen-mode
    use { 'tjdevries/colorbuddy.nvim' }
    use { 'norcalli/nvim-colorizer.lua',
        config = function ()
          require'colorizer'.setup {
            css = {css_fn = true, css = true},
            'javascript',
            'html',
            'r',
            'rmd',
            -- 'markdown',
            'python'
        }
        end
    }
    use { 'folke/tokyonight.nvim' }
    use 'EdenEast/nightfox.nvim'
    use { 'gruvbox-community/gruvbox' }
    use { 'shaunsingh/nord.nvim',
      config = function()
        vim.g.nord_contrast = true
        vim.g.nord_borders = true
        vim.g.nord_disable_background = true
        vim.g.nord_italic = true
        vim.g.nord_enable_sidebar_background = false
      end
   }
    use { "catppuccin/nvim", as = "catppuccin",
      config = function()
        require('catppuccin').setup {}
      end
    }

    -- telescope
    use { 'nvim-telescope/telescope.nvim' }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'camgraff/telescope-tmux.nvim' }
    use { 'nvim-telescope/telescope-dap.nvim' }
    use { 'nvim-telescope/telescope-packer.nvim' }
    use { 'dhruvmanila/telescope-bookmarks.nvim' }
    use { 'ahmedkhalf/project.nvim',
      config = function()
        require("project_nvim").setup{}
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
    use { 'jpalardy/vim-slime',
      config = function()
        vim.g.slime_target = "tmux"
        vim.g.slime_python_ipython = 1
        vim.g.slime_default_config = {socket_name = "default", target_pane = ":.2"}
        vim.b.slime_cell_delimiter = "#%%"
      end
    }

    -- lsp and other built-in anhancers
    use { 'neovim/nvim-lspconfig' }
    use { 'mfussenegger/nvim-dap' }
    use { 'rcarriga/nvim-dap-ui',
      -- config = function()
      --   require("dapui").setup()
      -- end
    }
    use { 'onsails/lspkind-nvim' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/playground',
      config = function()
        require "nvim-treesitter.configs".setup{}
      end
    }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    use { 'aca/emmet-ls' }

    -- language specific
    use { 'simrat39/rust-tools.nvim',
      config = function ()
        require('rust-tools').setup{}
      end
    }

    -- completion
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-calc' }
    use { 'hrsh7th/cmp-emoji' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'hrsh7th/cmp-nvim-lua' }
    use { 'f3fora/cmp-spell' }
    use { 'ray-x/cmp-treesitter' }
    use { 'tamago324/cmp-zsh' }
    use { 'andersevenrud/cmp-tmux' }
    use { 'quangnguyen30192/cmp-nvim-tags' }
    use { 'kdheepak/cmp-latex-symbols' }
    use { 'jc-doyle/cmp-pandoc-references' }
    use { 'L3MON4D3/LuaSnip' }
    use { 'rafamadriz/friendly-snippets' }
    use { 'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup{}
      end
    }

    use { 'jmbuhr/quarto-nvim',
      config = function()
        require'quarto'
      end
    }

    -- sync after fresh install
    if Packer_bootstrap then
      require('packer').sync()
    end

  end,
  config = {
    profile = {
      enable = true,
      threshold = 1
    },
    display = {
      open_fn = require('packer.util').float,
    }
  }
}


