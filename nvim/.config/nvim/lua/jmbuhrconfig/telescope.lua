local telescope = require('telescope')
local telescopeConfig = require("telescope.config")
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


-- Clone the default Telescope configuration
local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }

-- I want to search in hidden/dot files.
table.insert(vimgrep_arguments, "--hidden")
-- I don't want to search in the `.git` directory.
table.insert(vimgrep_arguments, "--glob")
table.insert(vimgrep_arguments, "!.git/*")

require("telescope").setup {
  defaults = {
    -- ....
  },
  pickers = {
    find_files = {
    },
  }
}

telescope.setup{
  defaults = {
    file_ignore_patterns = { "node_modules", "%_files", "%_cache", ".git/", "site_libs" },
    buffer_previewer_maker = new_maker,
		vimgrep_arguments = vimgrep_arguments,
    layout_strategy = "flex",
    sorting_strategy = "ascending",
    layout_config = {
        prompt_position = "top",
    },
    pickers = {
      git_files = {
        show_untracked = true,
        recurse_submodules = true,
      },
      find_files = {
        -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
        find_command = { "rg", "--files", "--hidden=true", "--glob", "!.git/*" },
        mappings = {
          i = {
            ["<c-d>"] = function(prompt_bufnr)
              local selection = require("telescope.actions.state").get_selected_entry()
              local dir = vim.fn.fnamemodify(selection.path, ":p:h")
              require("telescope.actions").close(prompt_bufnr)
              -- Depending on what you want put `cd`, `lcd`, `tcd`
              vim.cmd(string.format("silent cd %s", dir))
            end
          },
        },
      },
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
    file_browser = {
      hijack_netrw = true,
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown {
        -- even more opts
      },
    },
  }
}


telescope.load_extension('fzf')
telescope.load_extension('dap')
telescope.load_extension('ui-select')
telescope.load_extension('hoogle')
telescope.load_extension('file_browser')
telescope.load_extension('project')
telescope.load_extension("git_worktree")

