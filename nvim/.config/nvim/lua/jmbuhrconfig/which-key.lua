local wk = require("which-key")

local nmap = function(key, effect)
  vim.api.nvim_set_keymap('n', key, effect, {silent = true})
end

nmap('<c-b>', ':NvimTreeToggle<CR>')
nmap('<c-f>', ':Telescope builtin<CR>')
nmap('<m-=>', ':!echo hi<cr>')
nmap('<m-->', ':!echo hi<cr>')


nmap('<F5>',  ':lua require"dap".continue()<CR>')
nmap('<F10>', ':lua require"dap".step_over()<CR>')
nmap('<F11>', ':lua require"dap".step_into()<CR>')
nmap('<F12>', ':lua require"dap".step_out()<CR>')
nmap('Q', '<Nop>')


wk.setup{
  spelling = {
      enabled = true
    }
}

wk.register({
  d = {
    name = "DAP",
    b = { ":lua require'dap'.toggle_breakpoint()<CR>", "breakpoint" },
    B = { ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", "breakpoint condition" },
    l = { ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", "log point" },
    r = { ":lua require'dap'.repl.open()<cr>", "repl" },
    u = { ":lua require'dapui'.toggle()<cr>", "ui" },
  },
  f = {
    name = "Telescope",
    f = { "<cmd>Telescope git_files<cr>", "files (git)" },
    a = { "<cmd>Telescope find_files<cr>", "files (all)" },
    g = { "<cmd>Telescope live_grep<cr>", "grep" },
    b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "fuzzy" },
    h = { "<cmd>Telescope help_tags<cr>", "help tags" },
    m = { "<cmd>Telescope marks<cr>", "marks" },
    M = { "<cmd>Telescope man_pages<cr>", "man pages" },
    j = { "<cmd>Telescope jumplist<cr>", "marks" },
    c = { "<cmd>Telescope git_commits<cr>", "git commits" },
    k = { "<cmd>Telescope keymaps<cr>", "keymaps" },
    s = { "<cmd>Telescope builtin<cr>", "spelling" },
    t = { "<cmd>Telescope tmux sessions<cr>", "tmux session" },
    w = { "<cmd>Telescope tmux windows<cr>", "tmux window" },
    p = { "<cmd>Telescope projects<cr>", "projects" },
    d = { "<cmd>Telescope buffers<cr>", "buffers" },
    i = { "<cmd>Telescope bookmarks<cr>", "bookmarks" },
    q = { "<cmd>Telescope quickfix<cr>", "quickfix" },
    l = { "<cmd>Telescope loclist<cr>", "loclist" },
    r = { "<cmd>Telescope registers<cr>", "register" },
    y = { "<cmd>Telescope neoclip<cr>", "register" },
    ['<space>'] = { "<cmd>Telescope builtin<cr>", "builtin" },
  },
  v = {
    name = "VIM",
    e = { ":cd $HOME/.dotfiles/<cr>:edit nvim/.config/nvim/init.lua<CR>", "edit config" },
    r = { ":source $HOME/.config/nvim/init.lua<CR>", "source config" },
    s = { ":w<cr>:source %<CR>", "source %" },
    c = { ":Telescope colorscheme<cr>", "colorscheme" },
    p = {
      name = "Packer",
      i = { ":PackerInstall<CR>", "PackerInstall" },
      u = { ":PackerUpdate<CR>", "PackerUpdate" },
      c = { ":PackerCompile<CR>", "PackerCompile" },
      d = { ":PackerClean<CR>", "PackerClean" },
      s = { ":PackerSync<CR>", "PackerSync" },
    },
    l = {
      name = "lsp",
      r = {':LspRestart<CR>', 'restart'},
      i = {':LspInfo<CR>', 'info'},
      s = {':LspStart<CR>', 'start'},
      t = {':LspStop<CR>', 'stop'},
    }
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
  q = {
    name = "quickfix",
    o = {':copen<cr>', 'open'},
    q = {':cclose<cr>', 'close'},
  },
  Q = {
    name = "loclist",
    o = {':lopen<cr>', 'open'},
    q = {':lclose<cr>', 'close'},
  },
  l = {
    name = "lsp",
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
      p = { ':w<cr><cmd>! black %<CR>:e<cr>', 'format python with black' },
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
    e = {':! chmod +x ./%<cr>', 'make executable'},
  },
  r = {':!./%<cr>', 'run file'},
  ['<cr>'] = {'<Plug>SlimeSendCell', 'run code section'},
  w = {
    name = "workspace",
    a = { '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', 'add workspace folder' },
    r = { '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', 'remove workspace folder' },
    l = { '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', 'list workspace folders' },
    t = {'TodoTelescope', 'todo'},
    w = {':w!<cr>', 'save file'},
    W = {':SudaWrite<cr>', 'save file with sudo'},
    cc = { '<cmd>cd %:p:h<CR>', 'cd to current file' },
  },
  -- misc
  [';'] = {':', 'command'},
  ['<space>'] = {':', 'command'}
}, { prefix = "<leader>"})

-- buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
-- buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
-- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
-- buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
-- buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
-- buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
-- buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)

wk.register({
  ['gx'] = { ':!xdg-open <c-r><c-a><cr>', 'open file' },
  ["<c-q>"] = {'<cmd>q<cr>', 'close buffer'},
  ['<C-n>'] = { ':cnext<cr>', 'quickfix next' },
  ['<C-p>'] = { ':cprev<CR>', 'quickfix prev' },
  ['<esc>'] = { '<cmd>noh<cr>', 'remove search highlight' },
  n = {'nzzzv', 'center search'},
  gN = {'Nzzzv', 'center search'},
  gl = {'<c-]>', 'open help link'},
  gf = { ':e <cfile><CR>', 'edit file' },
  ['<M-j>'] = { 'mz:m+<cr>`z', 'move line down' },
  ['<M-k>'] = { 'mz:m-2<cr>`z', 'move line up' },
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
  ['.'] = { ':norm .<cr>', 'repat last normal mode command' },
  ['q'] = { ':norm @q<cr>', 'repat q macro' },
}, { mode = 'v'})


wk.register({
  ['<esc>'] = {'<C-\\><C-n>', 'escape'},
}, { mode = 't'})


vim.cmd [[ command! W  execute ':w' ]]


