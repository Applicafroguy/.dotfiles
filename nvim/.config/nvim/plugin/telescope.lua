local telescope = require('telescope')

local actions = require('telescope.actions')

telescope.setup{
  defaults = {
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
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    packer = {
      theme = "ivy",
    },
  } 
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('tmux')
require('telescope').load_extension('projects')
require("telescope").load_extension('packer')

-- require('telescope').extensions.packer.(opts)



