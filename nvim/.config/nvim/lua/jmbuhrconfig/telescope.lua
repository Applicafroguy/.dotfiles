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
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      },
    },
  }
}


telescope.load_extension('fzf')
telescope.load_extension('bookmarks')
telescope.load_extension('dap')
telescope.load_extension("ui-select")
telescope.load_extension('hoogle')


