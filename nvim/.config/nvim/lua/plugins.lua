return {
  -- quarto
  'jmbuhr/otter.nvim',

  { 'quarto-dev/quarto-nvim',
    -- dependencies = 'jmbuhr/otter.nvim',
    config = function()
      require 'quarto'.setup {
        lspFeatures = {
          enabled = true,
          languages = { 'r', 'python', 'julia', 'haskell' },
          diagnostics = {
            enabled = false
          },
          cmpSource = {
            enabled = true
          }
        }
      }
    end
  },

  'jose-elias-alvarez/null-ls.nvim',

  -- for my logseq notes
  { 'jakewvincent/mkdnflow.nvim' },

  -- common dependencies
  { 'ryanoasis/vim-devicons' },
  { 'kyazdani42/nvim-web-devicons' },
  { 'nvim-lua/plenary.nvim' },

  -- telescope
  -- a nice seletion UI also to find and open files
  { 'nvim-telescope/telescope.nvim', config = function()
    local telescope = require 'telescope'
    local actions = require('telescope.actions')
    local previewers = require("telescope.previewers")

    local new_maker = function(filepath, bufnr, opts)
      opts = opts or {}

      filepath = vim.fn.expand(filepath)
      vim.loop.fs_stat(filepath, function(_, stat)
        if not stat then return end
        if stat.size > 100000 then
          return
        else
          previewers.buffer_previewer_maker(filepath, bufnr, opts)
        end
      end)
    end

    telescope.setup {
      defaults = {
        buffer_previewer_maker = new_maker,
        file_ignore_patterns = { "node_modules", "%_files/*.html", "%_cache", ".git/", "site_libs" },
        layout_strategy = "flex",
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",
        },
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
            ["<esc>"] = actions.close,
            ["<c-j>"] = actions.move_selection_next,
            ["<c-k>"] = actions.move_selection_previous,
          }
        }
      },
      pickers = {
        find_files = {
          hidden = true,
          find_command = { "rg", "--no-ignore", "--files", "--hidden", "--glob", "!.git/*",
            '--glob', '!**/.Rproj.user/*', '-L' },
        }
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown(),
        },
      }
    }

    telescope.load_extension('ui-select')
    telescope.load_extension('fzf')
    telescope.load_extension('dap')
    telescope.load_extension('ui-select')
    telescope.load_extension('file_browser')
    telescope.load_extension('project')
    telescope.load_extension("git_worktree")

  end
  },
  { 'nvim-telescope/telescope-ui-select.nvim' },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  { 'nvim-telescope/telescope-packer.nvim' },
  { 'nvim-telescope/telescope-dap.nvim' },
  { 'nvim-telescope/telescope-file-browser.nvim' },
  { 'nvim-telescope/telescope-project.nvim' },


  -- show keybinding help window
  { 'folke/which-key.nvim' },

  -- filetree
  { 'kyazdani42/nvim-tree.lua',
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
  },

  -- paste an image to markdown from the clipboard
  -- :PasteImg,
  'ekickx/clipboard-image.nvim',

  -- commenting with e.g. `gcc` or `gcip`
  -- respects TS, so it works in quarto documents
  { 'numToStr/Comment.nvim', config = function()
    require('Comment').setup {}
  end
  },

  -- colorschemes with TS support,
  -- so it highlights embedded languages in qmd files
  { 'shaunsingh/nord.nvim' },
  { 'folke/tokyonight.nvim' },
  { "catppuccin/nvim", name = "catppuccin", config = function()
    require("catppuccin").setup {
      flavour = "mocha", -- mocha, macchiato, frappe, latte
      term_colors = true,
      integrations = {
        nvimtree = true,
        cmp = true,
        gitsigns = true,
        telescope = true,
        treesitter = true
      }
    }
  end
  },
  { 'EdenEast/nightfox.nvim' },

  -- send code from python/r/qmd docuemts to the terminal
  -- thanks to tmux can be used for any repl
  -- like ipython, R, bash
  { 'jpalardy/vim-slime' },

  -- lsp and treesitter
  'neovim/nvim-lspconfig',
  'onsails/lspkind-nvim',
  { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' },
  'nvim-treesitter/nvim-treesitter-textobjects',
  'nvim-treesitter/playground',

  -- lsp installer
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },

  { 'simrat39/symbols-outline.nvim', config = function()
    require("symbols-outline").setup()

  end },

  { 'MrcJkb/haskell-tools.nvim' },
  { "zbirenbaum/copilot.lua",
    event = "VimEnter",
    config = function()
      -- vim.defer_fn(function()
      --   require("copilot").setup()
      -- end, 100)
    end
  },
  { "zbirenbaum/copilot-cmp" },

  -- show diagnostics list
  { "folke/trouble.nvim", config = function()
    require("trouble").setup {}
  end
  },

  -- debug adapter protocol
  { 'mfussenegger/nvim-dap' },
  { 'rcarriga/nvim-dap-ui' },
  { 'mfussenegger/nvim-dap-python' },

  -- tests
  { "antoinemadec/FixCursorHold.nvim" },
  { "nvim-neotest/neotest" },
  { "nvim-neotest/neotest-python" },

  -- completion
  { 'hrsh7th/nvim-cmp' },
  { 'hrsh7th/cmp-nvim-lsp' },
  { 'hrsh7th/cmp-nvim-lsp-signature-help' },
  { 'hrsh7th/cmp-buffer' },
  { 'hrsh7th/cmp-path' },
  { 'hrsh7th/cmp-calc' },
  { 'hrsh7th/cmp-emoji' },
  { 'saadparwaiz1/cmp_luasnip' },
  { 'f3fora/cmp-spell' },
  { 'ray-x/cmp-treesitter' },
  { 'kdheepak/cmp-latex-symbols' },
  { 'jc-doyle/cmp-pandoc-references' },
  { 'L3MON4D3/LuaSnip' },
  { 'rafamadriz/friendly-snippets' },
  { 'windwp/nvim-autopairs', config = function()
    require('nvim-autopairs').setup {}
  end
  },

  -- editing tools
  { 'tpope/vim-repeat' },
  { 'tpope/vim-surround' },

  -- color html colors
  { 'norcalli/nvim-colorizer.lua', config = function()
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
  },

  --custom
  -- git and projects
  { 'ThePrimeagen/git-worktree.nvim' },
  { 'sindrets/diffview.nvim' },
  { 'TimUntersberger/neogit', config = function()
    require('neogit').setup {
      disable_commit_confirmation = true,
      integrations = {
        diffview = true
      }
    }
  end
  },
  { 'lewis6991/gitsigns.nvim', config = function()
    require('gitsigns').setup {}
  end
  },
  { 'akinsho/git-conflict.nvim', config = function()
    require('git-conflict').setup {
      default_mappings = true,
      disable_diagnostics = true,
    }
  end
  },
  -- github PRs and the like with gh-cli
  { 'pwntester/octo.nvim', config = function()
    require "octo".setup()
  end
  },

  -- sysadmin
  { 'mfussenegger/nvim-ansible' },

  -- look and feel
  { 'dstein64/nvim-scrollview', config = function()
    require('scrollview').setup({
      current_only = true,
    })
  end
  },
  { 'f-person/git-blame.nvim' },
  { 'nvim-lualine/lualine.nvim', config = function()
    local git_blame = require('gitblame')
    require('lualine').setup {
      options = {
        section_separators = '',
        component_separators = '',
        globalstatus = true,
        theme = "catppuccin",
      },
      sections = {
        lualine_c = {
          { git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }
        }
      },
      extensions = { 'nvim-tree' },
    }
  end
  },
  { 'nanozuki/tabby.nvim', config = function()
    require 'tabby.tabline'.use_preset('tab_only')
  end
  },

  -- terminal
  { "akinsho/toggleterm.nvim", version = '*', config = function()
    require("toggleterm").setup {
      open_mapping = [[<c-\>]],
      direction = 'float',
    }
  end
  },
}
