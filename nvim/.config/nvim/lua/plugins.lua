--  bootstrap packer
local fn = vim.fn

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- install packages when this file is saved
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerInstall
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]]

-- This file can be loaded by calling `lua require
require('packer').startup {
  function(use)
    -- packer can manager itself
    use 'wbthomason/packer.nvim'

    -- quarto
    use 'quarto-dev/quarto-nvim'

    -- common dependencies
    use { 'ryanoasis/vim-devicons' }
    use { 'kyazdani42/nvim-web-devicons' }
    use { 'nvim-lua/plenary.nvim' }

    -- telescope
    -- a nice seletion UI also to find and open files
    use { 'nvim-telescope/telescope.nvim' }
    use { 'nvim-telescope/telescope-ui-select.nvim' }
    use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use { 'nvim-telescope/telescope-packer.nvim' }
    use { 'nvim-telescope/telescope-dap.nvim' }
    use { 'nvim-telescope/telescope-file-browser.nvim' }
    use { 'nvim-telescope/telescope-project.nvim' }


    -- show keybinding help window
    use { 'folke/which-key.nvim' }

    -- filetree
    use { 'kyazdani42/nvim-tree.lua',
      config = function()
        require 'nvim-tree'.setup {
          disable_netrw       = true,
          open_on_setup       = false,
          update_focused_file = {
            enable = true,
          },
          git                 = {
            enable = true,
            ignore = false,
            timeout = 500,
          },
          diagnostics         = {
            enable = true,
          },
        }
      end
    }

    -- paste an image to markdown from the clipboard
    -- use :PasteImg
    use 'ekickx/clipboard-image.nvim'

    -- commenting with e.g. `gcc` or `gcip`
    -- respects TS, so it works in quarto documents
    use { 'numToStr/Comment.nvim',
      config = function()
        require('Comment').setup {}
      end
    }

    -- colorschemes with TS support,
    -- so it highlights embedded languages in qmd files
    use { 'shaunsingh/nord.nvim' }
    use { "catppuccin/nvim", as = "catppuccin" }

    -- send code from python/r/qmd docuemts to the terminal
    -- thanks to tmux can be used for any repl
    -- like ipython, R, bash
    use { 'jpalardy/vim-slime',
      config = function()
        vim.g.slime_target = "neovim"
        local wk = require'which-key'

        local function chooseTerminal()
          local current_terminal = vim.bo.channel
          vim.api.nvim_set_var('slimeTerminal', current_terminal)
        end

        local function setTerminal()
          vim.b.slime_config = {jobid = vim.api.nvim_get_var('slimeTerminal')}
        end

        wk.register(
          {
            ['ct'] = {chooseTerminal, 'choose terminal'},
            ['cs'] = {setTerminal, 'set terminal'},
            ['cr'] = {':split term://R<cr>', 'spawn R terminal'},
            ['ci'] = {':split term://ipython<cr>', 'spawn ipython terminal'},
            ['cp'] = {':split term://python<cr>', 'spawn python terminal'},
            ['cj'] = {':split term://julia<cr>', 'spawn julia terminal'},
          },
          {prefix = '<leader>'}
        )
        -- vim.g.slime_target = "tmux"
        -- vim.g.slime_bracketed_paste = 1
        -- vim.g.slime_default_config = { socket_name = "default", target_pane = ":.2" }
        vim.b.slime_cell_delimiter = "#%%"
      end
    }


    -- lsp and treesitter
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/playground'

    -- lsp installer
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }


    -- debug adapter protocol
    use { 'mfussenegger/nvim-dap' }
    use { 'rcarriga/nvim-dap-ui',
      config = function()
        require("dapui").setup()
      end
    }
    use { 'mfussenegger/nvim-dap-python' }

    -- tests
    use { "nvim-neotest/neotest",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-neotest/neotest-python"
      }
    }

    -- completion
    use { 'hrsh7th/nvim-cmp' }
    use { 'hrsh7th/cmp-nvim-lsp' }
    use { 'hrsh7th/cmp-nvim-lsp-signature-help' }
    use { 'hrsh7th/cmp-buffer' }
    use { 'hrsh7th/cmp-path' }
    use { 'hrsh7th/cmp-calc' }
    use { 'hrsh7th/cmp-emoji' }
    use { 'saadparwaiz1/cmp_luasnip' }
    use { 'f3fora/cmp-spell' }
    use { 'ray-x/cmp-treesitter' }
    use { 'kdheepak/cmp-latex-symbols' }
    use { 'jc-doyle/cmp-pandoc-references' }
    use { 'L3MON4D3/LuaSnip' }
    use { 'rafamadriz/friendly-snippets' }
    use { 'windwp/nvim-autopairs', -- complete parentheses etc.
      config = function()
        require('nvim-autopairs').setup {}
      end
    }

    -- editing tools
    use { 'tpope/vim-repeat' }
    use { 'tpope/vim-surround' }

    -- color html colors
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

    --custom
    -- git and projects
    use { 'ThePrimeagen/git-worktree.nvim' }
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
    use { 'akinsho/git-conflict.nvim',
      config = function()
        require('git-conflict').setup {
          default_mappings = true,
          disable_diagnostics = true,
        }
      end
    }

    -- look and feel
    use { 'dstein64/nvim-scrollview',
      config = function()
        require('scrollview').setup({
          current_only = true,
        })
      end
    }
    use { 'f-person/git-blame.nvim' }
    use {
      'nvim-lualine/lualine.nvim',
      config = function()
        vim.g.gitblame_display_virtual_text = 0
        local git_blame = require('gitblame')

        require'tabline'.setup {
          options = {
            max_bufferline_percent = 80,
            show_tabs_always = true,
            show_bufnr = true,
            show_filename_only = true,
            modified_icon = "+ ",
            modified_italic = true,
            show_tabs_only = true,
          }
        }

        require('lualine').setup {
          options = {
            section_separators = '',
            component_separators = '',
            globalstatus = true
          },
          tabline = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { require'tabline'.tabline_buffers_tabs_only },
            lualine_x = { },
            lualine_y = {},
            lualine_z = { { 'tabs', mode = 0 } }
          },
          sections = {
            lualine_c = {
              { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }
            }
          },
          extensions = {'nvim-tree'},
          -- winbar = {
          --   lualine_a = {},
          --   lualine_b = {},
          --   lualine_c = {'filename'},
          --   lualine_x = {},
          --   lualine_y = {},
          --   lualine_z = {}
          -- },
          -- inactive_winbar = {
          --   lualine_a = {},
          --   lualine_b = {},
          --   lualine_c = {'filename'},
          --   lualine_x = {},
          --   lualine_y = {},
          --   lualine_z = {}
          -- }
        }
      end
    }
    use {
      'kdheepak/tabline.nvim',
      config = function()
        require'tabline'.setup {enable = false}
      end,
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
      require('packer').sync()
    end

  end,
  config = {
    display = {
      open_fn = require('packer.util').float,
    }
  }
}

return packer_bootstrap
