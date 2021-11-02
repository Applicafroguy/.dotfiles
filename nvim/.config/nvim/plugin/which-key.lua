local wk = require("which-key")

wk.setup {
}

wk.register({
  f = {
    name = "Telescope",
    f = { "<cmd>Telescope git_files<cr>", "files (git)" },
    a = { "<cmd>Telescope find_files<cr>", "files (all)" },
    g = { "<cmd>Telescope live_grep<cr>", "grep" },
    b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "fuzzy" },
    h = { "<cmd>Telescope help_tags<cr>", "help tags" },
    m = { "<cmd>Telescope man_pages<cr>", "man pages" },
    c = { "<cmd>Telescope git_commits<cr>", "git commits" },
    k = { "<cmd>Telescope keymaps<cr>", "keymaps" },
    s = { "<cmd>Telescope spell_suggest<cr>", "spelling" },
    t = { "<cmd>Telescope tmux sessions<cr>", "tmux session" },
    w = { "<cmd>Telescope tmux windows<cr>", "tmux window" },
    p = { "<cmd>Telescope projects<cr>", "projects" },
  },
  v = {
    name = "VIM",
    e = { ":edit $HOME/.config/nvim/init.vim<CR>:cd $HOME/.dotfiles<cr>", "edit config" },
    r = { ":source $HOME/.config/nvim/init.vim<CR>", "source config" },
    s = { ":source %<CR>", "source %" },
    p = { 
      name = "Packer",
      i = { ":PackerInstall<CR>", "PackerInstall" },
      c = { ":PackerCompile<CR>", "PackerCompile" },
      d = { ":PackerClean<CR>", "PackerClean" }
    },
  },
  t = {
    name = "Tabs",
    t = { ":tabnew<cr>", "new tab" },
    c = { "<cmd>cd %:p:h<cr>:pwd<cr>", "cd" },
    e = { ":tabedit <C-r>=expand('%:p:h')<cr>", "edit in new tab" },
    n = { ":tabnext<cr>", "next tab" },
    p = { ":tabprevious<cr>", "previous tab" },
    o = {
      name = "order",
      n = { ":BufferOrderByBufferNumber<CR>", "number" },
      d = { ":BufferOrderByDirectory<CR>", "directory" },
      l = { ":BufferOrderByLanguage<CR>", "language" },
    },
  },
  g = {
    s = {":G <cr>", "git status"},
    c = {":G commit<cr>", "git commit"}
  }
}, { prefix = "<leader>"})


