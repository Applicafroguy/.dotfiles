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
    m = { "<cmd>Terescope man_pages<cr>", "man pages" },
    c = { "<cmd>Telescope git_commits<cr>", "git commits" },
    k = { "<cmd>Telescope keymaps<cr>", "keymaps" },
    s = { "<cmd>Telescope builtin<cr>", "spelling" },
    ['<space>'] = { "<cmd>Telescope builtin<cr>", "spelling" },
    t = { "<cmd>Telescope tmux sessions<cr>", "tmux session" },
    w = { "<cmd>Telescope tmux windows<cr>", "tmux window" },
    p = { "<cmd>Telescope projects<cr>", "projects" },
    d = { "<cmd>Telescope buffers<cr>", "buffers" },
    i = { "<cmd>Telescope bookmarks<cr>", "bookmarks" },
    q = { "<cmd>Telescope quickfix<cr>", "quickfix" },
    l = { "<cmd>Telescope loclist<cr>", "loclist" },
    r = { "<cmd>Telescope registers<cr>", "register" },
    y = { "<cmd>Telescope neoclip<cr>", "register" },
  },
  v = {
    name = "VIM",
    e = { ":cd $HOME/.dotfiles<cr>:edit $HOME/.config/nvim/init.vim<CR>", "edit config" },
    r = { ":source $HOME/.config/nvim/init.vim<CR>", "source config" },
    s = { ":source %<CR>", "source %" },
    p = { 
      name = "Packer",
      i = { ":PackerInstall<CR>", "PackerInstall" },
      u = { ":PackerUpdate<CR>", "PackerUpdate" },
      c = { ":PackerCompile<CR>", "PackerCompile" },
      d = { ":PackerClean<CR>", "PackerClean" },
      s = { ":PackerSync<CR>", "PackerSync" },
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
  g = {
    name = "git",
    g = {":Neogit<cr>", "neogit"},
    h = {":Octo<cr>", "github"},
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
    r = { "<cmd>Telescope lsp_references<cr>", "register" },
    D = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'type definition' },
    n = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'rename' },
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
    s = { "<cmd>Telescope spell_suggest<cr>", "spelling" },
    ['/'] = { '<cmd>setlocal spell!<cr>', 'spellcheck' },
    n = { ']s', 'next' },
    p = {'[s', 'previous'},
    g = {'zg', 'good'},
    a = {'zg', 'accept'},
    b = {'zb', 'bad'},
    ['?'] = { '<cmd>Telescope spell_suggest<cr>', 'suggest' },
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
  n = {'nzzzv', 'center search'},
  gN = {'Nzzzv', 'center search'},
  gl = {'<c-]>', 'open help link'},
  gf = { ':e <cfile><CR>', 'edit file' },
  ['<M-j>'] = { 'mz:m+<cr>`z', 'move line down' },
  ['<M-k>'] = { 'mz:m-2<cr>`z', 'move line up' },
}, { mode = 'n' })

-- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
-- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
-- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
-- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
-- buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
-- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

wk.register({
  [','] = {',<c-g>u', ','},
  ['.'] = {'.<c-g>u', '.'},
  ['?'] = {'?<c-g>u', '?'},
  ['!'] = {'!<c-g>u', '!'},
  ['<C-j>']  = {'<C-W>j', 'move to window'},
  ['<C-k>']  = {'<C-W>k', 'move to window'},
  ['<C-h>']  = {'<C-W>h', 'move to window'},
  ['<C-l>']  = {'<C-W>l', 'move to window'},
}, { mode = 'n' })

wk.register({
  ['<cr>'] = {'<Plug>SlimeRegionSend', 'run code region'},
  ['gx'] = { '"ty:!xdg-open t<cr>', 'open file' },
  ['>'] = {'>gv', 'indent'},
  ['<'] = {'<gv', 'dedent'},
  ['<leader>p'] = {'"_dP', 'replace without overwriting reg'},
  ['<M-j>'] =  { ":m'>+<cr>`<my`>mzgv`yo`z", 'move line down' },
  ['<M-k>'] = { ":m'<-2<cr>`>my`<mzgv`yo`z", 'move line up' },
}, { mode = 'v'})


wk.register({
  ['<esc>'] = {'<C-\\><C-n>', 'escape'},
}, { mode = 't'})

