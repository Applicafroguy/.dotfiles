--  bootstrap packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  is_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
end


require('packer').startup {
  function(use)
    use 'wbthomason/packer.nvim'

    -- actions and bindings
    use { 'tpope/vim-repeat' }
    use { 'tpope/vim-surround' }
    use { 'lambdalisue/suda.vim' }
    use { 'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup {}
      end
    }
    -- clipboard
    use { 'roxma/vim-tmux-clipboard' }

    -- keymaps
    use { 'folke/which-key.nvim' }

    -- git and projects
    use { 'sindrets/diffview.nvim' }
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
    use { 'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup {}
      end
    }
    use {'akinsho/git-conflict.nvim', config = function()
      require('git-conflict').setup {
        default_mappings = true,
        disable_diagnostics = true,
    }
    end
    }

    if vim.fn.executable "gh" == 1 then
    use { 'pwntester/octo.nvim', config = function ()
        require"octo".setup()
      end
    }
    end

    use {
      "ThePrimeagen/git-worktree.nvim",
      config = function()
        require("git-worktree").setup {}
      end,
    }

    -- markdown notes
    use 'ekickx/clipboard-image.nvim'

    -- common dependencies
    use { 'ryanoasis/vim-devicons' }
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'nvim-lua/plenary.nvim' }
    use { 'godlygeek/tabular' }

    -- look and feel
    use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
    use { 'nvim-lualine/lualine.nvim' }
    use { 'arkav/lualine-lsp-progress' }
    use { 'dstein64/nvim-scrollview' }
    use { 'gcmt/taboo.vim' }
    use { "akinsho/toggleterm.nvim", tag = 'v1.*', config = function()
      require("toggleterm").setup {
        open_mapping = [[<c-\>]],
        shade_terminals = false,
        direction = 'float',
      }
    end }
    use { 'kyazdani42/nvim-tree.lua' }
    use { 'tjdevries/colorbuddy.nvim' }
    use { 'norcalli/nvim-colorizer.lua',
      config = function()
        require 'colorizer'.setup {
          css = { css_fn = true, css = true },
          'javascript',
          'html',
          'r',
          'rmd',
          'qmd',
          'markdown',
          'python'
        }
      end
    }
    use { 'folke/tokyonight.nvim' }
    use 'EdenEast/nightfox.nvim'
    use { 'gruvbox-community/gruvbox' }
    use "rebelot/kanagawa.nvim"
    use { 'shaunsingh/nord.nvim',
      config = function()
        vim.g.nord_contrast = true
        vim.g.nord_borders = true
        vim.g.nord_disable_background = false
        vim.g.nord_italic = true
        vim.g.nord_cursorline_transparent = true
        vim.g.nord_enable_sidebar_background = false
        vim.g.nord_enable_uniform_diff_backround = true
      end
    }
    use { "catppuccin/nvim", as = "catppuccin",
      config = function()
        require('catppuccin').setup {}
      end
    }
    use 'Th3Whit3Wolf/space-nvim'
    use 'lourenci/github-colors'

    -- telescope
    use { 'nvim-telescope/telescope.nvim' }
    use { 'nvim-telescope/telescope-ui-select.nvim' }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'camgraff/telescope-tmux.nvim' }
    use { 'nvim-telescope/telescope-dap.nvim' }
    use { 'nvim-telescope/telescope-packer.nvim' }
    use { 'dhruvmanila/telescope-bookmarks.nvim' }
    use { 'luc-tielen/telescope_hoogle' }
    use { "nvim-telescope/telescope-file-browser.nvim" }
    use { 'nvim-telescope/telescope-project.nvim' }

    -- run code
    use { 'jpalardy/vim-slime',
      config = function()
        vim.g.slime_target = "tmux"
        -- vim.g.slime_python_ipython = 1
        vim.g.slime_bracketed_paste = 1
        vim.g.slime_default_config = { socket_name = "default", target_pane = ":.2" }
        vim.b.slime_cell_delimiter = "#%%"
      end
    }

    -- lsp and other built-in anhancers
    use { 'neovim/nvim-lspconfig' }
    use { 'mfussenegger/nvim-dap' }
    use { 'rcarriga/nvim-dap-ui',
      config = function()
        require("dapui").setup()
      end
    }
    use {'mfussenegger/nvim-dap-python'}
    use { 'onsails/lspkind-nvim' }
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use { 'nvim-treesitter/playground',
      config = function()
        require "nvim-treesitter.configs".setup {}
      end
    }
    use { 'nvim-treesitter/nvim-treesitter-textobjects' }
    use { 'aca/emmet-ls' }

    -- completion
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-calc' }
    use { 'hrsh7th/cmp-emoji' }
    use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'hrsh7th/cmp-nvim-lua' }
    use { 'f3fora/cmp-spell' }
    use { 'ray-x/cmp-treesitter' }
    use { 'tamago324/cmp-zsh' }
    use { 'andersevenrud/cmp-tmux' }
    use { 'quangnguyen30192/cmp-nvim-tags' }
    use { 'kdheepak/cmp-latex-symbols' }
    -- use { 'jc-doyle/cmp-pandoc-references' }
    use { '~/sw/cmp-pandoc-references' }
    use { 'petertriho/cmp-git' }

    use { 'L3MON4D3/LuaSnip' }
    use { 'rafamadriz/friendly-snippets' }
    use { 'windwp/nvim-autopairs',
      config = function()
        require('nvim-autopairs').setup {}
      end
    }
    -- spellchecker based on language
    -- use { 'lewis6991/spellsitter.nvim',
    --   config = function()
    --     require('spellsitter').setup()
    --   end
    -- }
    -- language specific
    use { 'quarto-dev/quarto-nvim',
    -- use { '~/sw/quarto-nvim',
      config = function ()
        require'quarto'.setup()
      end
    }

    -- sync after fresh install
    if is_bootstrap then
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


M = {}
M.is_bootstrap = function()
  return is_bootstrap
end
return M

