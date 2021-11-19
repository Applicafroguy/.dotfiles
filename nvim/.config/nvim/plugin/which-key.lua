local wk = require("which-key")

wk.setup{}

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
    d = { "<cmd>Telescope buffers<cr>", "buffers" },
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
  },
  G = {
    name = "git",
    G = {":G ", "git"},
    s = {":G <cr>", "git status"},
    c = {":G commit<cr>", "git commit"},
    p = {":G push<cr>", "git push"}
  },
  Q = {
    Q = { ":q!<cr>", "close!" },
  },
  l = {
    name = "lsp",
    wa = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'add workspace folder' },
    wr = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'remove workspace folder' },
    wl = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'list workspace folders' },
    D = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'type definition' },
    rn = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'rename' },
    ca = { '<cmd>lua vim.lsp.buf.code_action()<CR>', 'code action' },
    q = { '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', 'set loclist' },
    e = { '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', 'show line diagnostic' },
    ff = { '<cmd>lua vim.lsp.buf.formatting()<CR>', 'formatting' },
    fp = { ':w<cr><cmd>! black %<CR>', 'format python with black' },
  },
  s = {
    name = "spell", 
    s = ':setlocal spell!<cr>',
    n = ']s',
    p = '[s',
    a = 'zg',
    a = 'zg',
    b = 'zb',
    ['?'] = { '<cmd>Telescope spell_suggest<cr>', 'suggest' },
    ['/'] = { '<cmd>Telescope spell_suggest<cr>', 'suggest' },
},
  d = {'"_d', 'delete without overwriting reg'},
  ww = {':w!<cr>', 'safe'},
  ['<cr>'] = {':!%<cr>', 'execute current buffer'},
  n = { '<cmd>noh<cr>', 'remove search highlight' },
}, { prefix = "<leader>"})

wk.register({
  ['gx'] = { ':!xdg-open <c-r><c-a><cr>', 'open file' },
  ['s'] = {'ys', 'surround', noremap = false},
  ["<c-q>"] = {'<cmd>q<cr>', 'close buffer'},
  Y = {'y$', 'yank to end'},
  n = {'nzzzv', 'center search'},
  gN = {'Nzzzv', 'center search'},
  gl = {'<c-]>', 'open help link'},
  ['<C-n>'] = { '<cmd>NvimTreeToggle<CR>', 'open file tree' },
}, { mode = 'n' })

wk.register({
  s = {'S', 'surround'},
  ['>'] = {'>gv', 'indent'},
  ['<'] = {'<gv', 'dedent'},
  ['<leader>p'] = {'"_dP', 'replace without overwriting reg'},
  ['<cr>'] = {'y', 'yank'},
}, { mode = 'v'})


wk.register({
  s = {'S', 'surround'},
}, { mode = 'v', noremap=false})

