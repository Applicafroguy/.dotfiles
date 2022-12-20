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

require('Comment').setup {}
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

require("symbols-outline").setup()
require("trouble").setup {}
require('nvim-autopairs').setup {}

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

require('neogit').setup {
  disable_commit_confirmation = true,
  integrations = {
    diffview = true
  }
}

require('gitsigns').setup {}
require('git-conflict').setup {
  default_mappings = true,
  disable_diagnostics = true,
}

require "octo".setup()
require('scrollview').setup({
  current_only = true,
})

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
require 'tabby.tabline'.use_preset('tab_only')
require("toggleterm").setup {
  open_mapping = [[<c-\>]],
  direction = 'float',
}

require'quarto'.setup{
  lspFeatures = {
    enabled = true,
    languages = {'r', 'python'},
    diagnostics = {
      enabled = false
    },
    cmpSource = {
      enabled = true
    }
  }
}


