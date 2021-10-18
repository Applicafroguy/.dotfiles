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
  },
  v = {
    name = "VIM",
    e = { ":edit $HOME/.config/nvim/init.vim<CR>", "edit config" },
    r = { ":source $HOME/.config/nvim/init.vim<CR>", "source config" },
    s = { ":source %<CR>", "source %" },
  },
  t = {
    name = "Tabs",
    t = { ":tabnew<cr>", "new tab" },
    c = { "<cmd>cd %:p:h<cr>:pwd<cr>", "cd" },
    e = { ":tabedit <C-r>=expand('%:p:h')<cr>", "edit in new tab" },
    n =  { ":tabnext<cr>", "next tab" },
    p = { ":tabprevious<cr>", "previous tab" },
  },
}, { prefix = "<leader>"})



