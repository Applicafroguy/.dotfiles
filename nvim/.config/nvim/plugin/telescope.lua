local telescope = require('telescope')
local actions = require('telescope.actions')


telescope.setup{
  defaults = {
    layout_strategy = "flex",
    sorting_strategy = "ascending",
    layout_config = {
        prompt_position = "top",
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--trim",
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
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
    bookmarks = {
      selected_browser = 'firefox',
      url_open_command = 'xdg-open',
    },
  } 
}
require('telescope').load_extension('fzf')
require('telescope').load_extension('tmux')
require('telescope').load_extension('projects')
require("telescope").load_extension('packer')
require("telescope").load_extension('dap')
require("telescope").load_extension('bookmarks')
require("telescope").load_extension('neoclip')




