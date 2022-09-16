local telescope = require'telescope'
local actions = require('telescope.actions')

telescope.setup{
  defaults = {
    file_ignore_patterns = { "node_modules", "%_files", "%_cache", ".git/", "site_libs" },
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
			find_command = { "rg", "--files", "--hidden", "--glob", "!.git/*" },
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

