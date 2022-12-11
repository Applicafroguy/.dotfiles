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

-- vim.g.slime_target = "neovim"
vim.g.slime_target = 'tmux'
vim.g.slime_bracketed_paste = 1
vim.g.slime_default_config = { socket_name = "default", target_pane = ".2" }
local wk = require 'which-key'

local function chooseTerminal()
  local current_terminal = vim.bo.channel
  vim.api.nvim_set_var('slimeTerminal', current_terminal)
end

local function setTerminal()
  vim.b.slime_config = { jobid = vim.api.nvim_get_var('slimeTerminal') }
end

local function toggleTarget()
  if not vim.g.slimeTerminal then
    vim.api.nvim_set_var('slimeTerminal', 0)
  end
  if vim.g.slime_target == "neovim" then
    P('switch to tmux')
    vim.g.slime_bracketed_paste = 1
    vim.g.slime_default_config = { socket_name = "default", target_pane = "{last}" }
    vim.b.slime_config = { socket_name = "default", target_pane = ".2" }
    vim.g.slime_target = 'tmux'
  else
    P('switch to neovim')
    vim.g.slime_default_config = { jobid = 0 }
    vim.b.slime_config = { jobid = vim.api.nvim_get_var('slimeTerminal') }
    vim.g.slime_target = 'neovim'
  end
end

wk.register(
  {
    ['cc'] = { ':SlimeConfig<cr>', 'slime config' },
    ['cn'] = { toggleTarget, 'next code target' },
    ['ct'] = { chooseTerminal, 'choose terminal' },
    ['cs'] = { setTerminal, 'set terminal' },
    ['cr'] = { ':split term://R<cr>', 'spawn R terminal' },
    ['cb'] = { ':split term://bash<cr>', 'spawn bash terminal' },
    ['ci'] = { ':split term://ipython<cr>', 'spawn ipython terminal' },
    ['cp'] = { ':split term://python<cr>', 'spawn python terminal' },
    ['cj'] = { ':split term://julia<cr>', 'spawn julia terminal' },
  },
  { prefix = '<leader>' }
)
-- vim.g.slime_target = "tmux"
-- vim.g.slime_bracketed_paste = 1
-- vim.g.slime_default_config = { socket_name = "default", target_pane = ":.2" }
vim.b.slime_cell_delimiter = "#%%"


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

vim.g.gitblame_display_virtual_text = 0
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
