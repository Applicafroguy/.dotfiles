--  bootstrap packer
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
    -- use '~/phd/quarto-nvim/'

    -- for my logseq notes
    use { 'jakewvincent/mkdnflow.nvim' }

    use {
      -- 'AckslD/nvim-FeMaco.lua',
      '~/sw/nvim-FeMaco.lua/',
      config = 'require("femaco").setup()',
    }

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
    use { 'kyazdani42/nvim-tree.lua' }

    -- paste an image to markdown from the clipboard
    -- use :PasteImg
    use 'ekickx/clipboard-image.nvim'

    -- commenting with e.g. `gcc` or `gcip`
    -- respects TS, so it works in quarto documents
    use { 'numToStr/Comment.nvim' }

    -- colorschemes with TS support,
    -- so it highlights embedded languages in qmd files
    use { 'shaunsingh/nord.nvim' }
    use { 'folke/tokyonight.nvim' }
    use { "catppuccin/nvim", as = "catppuccin" }
    use { 'EdenEast/nightfox.nvim' }

    -- send code from python/r/qmd docuemts to the terminal
    -- thanks to tmux can be used for any repl
    -- like ipython, R, bash
    use { 'jpalardy/vim-slime' }

    -- lsp and treesitter
    use 'neovim/nvim-lspconfig'
    use 'onsails/lspkind-nvim'
    use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'nvim-treesitter/playground'

    -- lsp installer
    use { "williamboman/mason.nvim" }
    use { "williamboman/mason-lspconfig.nvim" }

    use { 'simrat39/symbols-outline.nvim' }

    use { 'MrcJkb/haskell-tools.nvim' }
    use { "zbirenbaum/copilot.lua",
      event = "VimEnter",
      config = function()
        vim.defer_fn(function()
          require("copilot").setup {
            panel = {
              keymap = {
                jump_prev = "[[",
                jump_next = "]]",
                accept = "<CR>",
                refresh = "gr",
                open = "<M-CR>"
              },
            },
            suggestion = {
              enabled = true,
              auto_trigger = false,
              debounce = 75,
              keymap = {
                accept = "<M-a>",
                next = "<M-]>",
                prev = "<M-[>",
                dismiss = "<C-]>",
              },
            },
            filetypes = {
              yaml = false,
              markdown = false,
              help = false,
              gitcommit = false,
              gitrebase = false,
              hgcommit = false,
              svn = false,
              cvs = false,
              ["."] = false,
            },
            copilot_node_command = 'node', -- Node version must be < 18
            server_opts_overrides = {},
          }
        end, 100)
      end,
    }
    use { "zbirenbaum/copilot-cmp" }

    -- show diagnostics list
    use { "folke/trouble.nvim" }

    -- debug adapter protocol
    use { 'mfussenegger/nvim-dap' }
    use { 'rcarriga/nvim-dap-ui' }
    use { 'mfussenegger/nvim-dap-python' }

    -- tests
    use { "antoinemadec/FixCursorHold.nvim" }
    use { "nvim-neotest/neotest" }
    use { "nvim-neotest/neotest-python" }

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
    use { 'windwp/nvim-autopairs' }

    -- editing tools
    use { 'tpope/vim-repeat' }
    use { 'tpope/vim-surround' }

    -- color html colors
    use { 'norcalli/nvim-colorizer.lua' }

    --custom
    -- git and projects
    use { 'ThePrimeagen/git-worktree.nvim' }
    use { 'sindrets/diffview.nvim' }
    use { 'TimUntersberger/neogit' }
    use { 'lewis6991/gitsigns.nvim' }
    use { 'akinsho/git-conflict.nvim' }
    -- github PRs and the like with gh-cli
    use { 'pwntester/octo.nvim' }

    -- sysadmin
    use { 'mfussenegger/nvim-ansible' }

    -- look and feel
    use { 'dstein64/nvim-scrollview' }
    use { 'f-person/git-blame.nvim' }
    use { 'nvim-lualine/lualine.nvim' }
    use { 'nanozuki/tabby.nvim' }

    -- terminal
    use { "akinsho/toggleterm.nvim", tag = '*' }

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
