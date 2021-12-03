local wk = require("which-key")

wk.setup{
  spelling = {
      enabled = true
    }
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
    d = { "<cmd>Telescope buffers<cr>", "buffers" },
    ['<space>'] = { ':Telescope', 'Telescope' },
  },
  v = {
    name = "VIM",
    e = { ":edit $HOME/.config/nvim/init.vim<CR>:cd $HOME/.dotfiles<cr>", "edit config" },
    r = { ":source $HOME/.config/nvim/init.vim<CR>", "source config" },
    s = { ":source %<CR>", "source %" },
    p = { 
      name = "Packer",
      i = { ":PackerInstall<CR>", "PackerInstall" },
      u = { ":PackerUpdate<CR>", "PackerUpdate" },
      c = { ":PackerCompile<CR>", "PackerCompile" },
      d = { ":PackerClean<CR>", "PackerClean" },
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
    w = {
      name = "workspace",
      a = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'add workspace folder' },
      r = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'remove workspace folder' },
      l = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'list workspace folders' },
    },
    D = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'type definition' },
    rn = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'rename' },
    ca = { '<cmd>Telescope lsp_code_actions<CR>', 'code action' },
    q = { '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', 'set loclist' },
    e = { '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', 'show line diagnostic' },
    d = {
      name = 'diagnostic',
      d = {'<cmd>lua vim.lsp.diagnostic.disable()<CR>', 'disable'},
      s = {'<cmd>lua vim.lsp.diagnostic.enable()<CR>', 'show'},
    },
    f = {
      name = "format",
      f = { '<cmd>lua vim.lsp.buf.formatting()<CR>', 'formatting' },
      p = { ':w<cr><cmd>! black %<CR>', 'format python with black' },
    },
  },
  s = {
    name = "spell", 
    s = { '<cmd>setlocal spell!<cr>', 'spellcheck' },
    n = { ']s', 'next' },
    p = {'[s', 'previous'},
    g = {'zg', 'good'},
    a = {'zg', 'accept'},
    b = {'zb', 'bad'},
    ['?'] = { '<cmd>Telescope spell_suggest<cr>', 'suggest' },
    ['/'] = { '<cmd>Telescope spell_suggest<cr>', 'suggest' },
},
  c = {
    name = "code",
    c = {'<Plug>SlimeConfig', 'config'},
    s = {':!%<cr>', 'source bash buffer'},
  },
  ['<cr>'] = {'<Plug>SlimeSendCell', 'run code section'},
  d = {'"_d', 'delete without overwriting reg'},
  w = {
    name = 'save',
    w = {':w!<cr>', 'save file'},
  },
}, { prefix = "<leader>"})

wk.register({
  ['gx'] = { ':!xdg-open <c-r><c-a><cr>', 'open file' },
  ["<c-q>"] = {'<cmd>q<cr>', 'close buffer'},
  ['<C-n>'] = { '<cmd>NvimTreeToggle<CR>', 'open file tree' },
  ['<esc>'] = { '<cmd>noh<cr>', 'remove search highlight' },
  Y = {'y$', 'yank to end'},
  n = {'nzzzv', 'center search'},
  gN = {'Nzzzv', 'center search'},
  gl = {'<c-]>', 'open help link'},
  gf = { ':e <cfile><CR>', 'edit file' }
}, { mode = 'n' })

wk.register({
  ['<cr>'] = {'<Plug>SlimeRegionSend', 'run code region'},
  ['gx'] = { '"ty:!xdg-open t<cr>', 'open file' },
  ['>'] = {'>gv', 'indent'},
  ['<'] = {'<gv', 'dedent'},
  ['<leader>p'] = {'"_dP', 'replace without overwriting reg'},
}, { mode = 'v'})



