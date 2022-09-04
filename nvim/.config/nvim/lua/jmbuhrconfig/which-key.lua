local wk = require("which-key")

local vmap = function(key, effect)
  vim.keymap.set('v', key, effect, {silent = true, noremap = true})
end

local imap = function(key, effect)
  vim.keymap.set('i', key, effect, {silent = true, noremap = true})
end

local nmap = function(key, effect)
  vim.keymap.set('n', key, effect, {silent = true, noremap = true})
end


local function switchTheme()
  if vim.o.background == 'light' then
    vim.o.background = 'dark'
    vim.cmd[[colorscheme nord]]
  else
    vim.o.background = 'light'
    vim.cmd[[colorscheme github-colors]]
  end
end

nmap('<leader>vt', switchTheme)

nmap('<c-b>', ':NvimTreeToggle<CR>')
nmap('<c-f>', ':Telescope builtin<CR>')
nmap('<m-left>', '<c-o>')
nmap('<m-right>', '<c-i>')


nmap('<F5>', require"dap".continue)
nmap('<F10>', require"dap".step_over)
nmap('<F11>', require"dap".step_into)
nmap('<F12>', require"dap".step_out)
nmap('Q', '<Nop>')

imap('<m-->', ' <- ')
imap('<c-m>', ' |> ')


nmap('<c-cr>', '<Plug>SlimeSendCell')
nmap('<s-cr>', '<Plug>SlimeSendCell')
imap('<c-cr>', '<esc><Plug>SlimeSendCell<cr>i')
imap('<s-cr>', '<esc><Plug>SlimeSendCell<cr>i')
-- needs kitty config:
-- map shift+enter send_text all \x1b[13;2u
-- map ctrl+enter send_text all \x1b[13;5u

vmap('>', '>gv')
vmap('<', '<gv')


local dailyNotes = function ()
  local today = os.date("%Y_%m_%d")
  local path = "~/notes/journals/"..today..".md"
  local cmd = [[:edit ]]..path
  vim.cmd(cmd)
  vim.cmd[[:Mkdnflow]]
end

vim.api.nvim_create_user_command('DailyNotes', dailyNotes, {})

-- terminal mode
vim.keymap.set('t', '<esc>', [[<c-\><c-n>]], {silent = true, noremap = true})


vim.api.nvim_create_user_command('Hoogle', '!hoogle <q-args>', { nargs = 1 })
vim.api.nvim_create_user_command('HoogleOpen', [[!xdg-open $(hoogle --count 1 --json  <q-args> | jq -r '.[0].url')]], { nargs = 1 })

-- normal mode <leader>
wk.register({
  xx = { ":w<cr>:source %<CR>", "source %" },
  d = {
    name = "DAP",
    b = { ":lua require'dap'.toggle_breakpoint()<CR>", "breakpoint" },
    B = { ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", "breakpoint condition" },
    l = { ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", "log point" },
    r = { ":lua require'dap'.repl.open()<cr>", "repl" },
    u = { ":lua require'dapui'.toggle()<cr>", "ui" },
    c = { ":lua require'dap'.continue()<cr>", "continue" },
    so = { ":lua require'dap'.step_over()<cr>", "step over" },
    si = { ":lua require'dap'.step_into()<cr>", "step into" },
    st = { ":lua require'dap'.step_out()<cr>", "step out" },
    h = { ":lua require('dap-python').test_method()<cr>", "debug here" },
  },
  f = {
    name = "Telescope",
    f = { "<cmd>Telescope git_files<cr>", "files (git)" },
    a = { "<cmd>Telescope find_files  hidden=true<cr>", "files (all)" },
    g = { "<cmd>Telescope live_grep<cr>", "grep" },
    b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "fuzzy" },
    h = { "<cmd>Telescope help_tags<cr>", "help tags" },
    m = { "<cmd>Telescope marks<cr>", "marks" },
    M = { "<cmd>Telescope man_pages<cr>", "man pages" },
    c = { "<cmd>Telescope git_commits<cr>", "git commits" },
    k = { "<cmd>Telescope keymaps<cr>", "keymaps" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "symbols" },
    t = { "<cmd>Telescope tmux sessions<cr>", "tmux session" },
    w = { "<cmd>Telescope tmux windows<cr>", "tmux window" },
    d = { "<cmd>Telescope buffers<cr>", "buffers" },
    q = { "<cmd>Telescope quickfix<cr>", "quickfix" },
    l = { "<cmd>Telescope loclist<cr>", "loclist" },
    j = { "<cmd>Telescope jumplist<cr>", "marks" },
    r = { "<cmd>Telescope registers<cr>", "register" },
    p = { "<cmd>Telescope project<cr>", "project" },
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
    pl = {":Octo pr list<cr>", "gh pr list"},
    pr = {":Octo review start<cr>", "gh pr review"},
    wc = {":lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "worktree create"},
    ws = {":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "worktree switch"},
  },
  q = {
    name = "quickfix",
    o = {':copen<cr>', 'open'},
    q = {':cclose<cr>', 'close'},
    p = {'<cmd>lua require"quarto".quartoPreview()<cr>', 'quarto preview'},
    d = {'<cmd>lua R"quarto".debug()<cr>', 'quarto debug'},
  },
  Q = {
    name = "loclist",
    o = {':lopen<cr>', 'open'},
    q = {':lclose<cr>', 'close'},
  },
  l = {
    name = "lsp",
    r = { "<cmd>Telescope lsp_references<cr>", "references" },
    D = { '<cmd>lua vim.lsp.buf.type_definition()<CR>', 'type definition' },
    n = { '<cmd>lua vim.lsp.buf.rename()<CR>', 'rename' },
    ca = { '<cmd>lua vim.lsp.buf.code_action()<cr>', 'code action' },
    q = { '<cmd>lua vim.diagnostic.set_loclist()<CR>', 'set loclist' },
    e = { '<cmd>lua vim.diagnostic.open_float()<CR>', 'show line diagnostic' },
    d = {
      name = 'diagnostic',
      d = {'<cmd>lua vim.diagnostic.disable()<CR>', 'disable'},
      s = {'<cmd>lua vim.diagnostic.enable()<CR>', 'show'},
    },
    f = {
      name = "format",
      f = { '<cmd>lua vim.lsp.buf.formatting()<CR>', 'formatting' },
      p = { ':w<cr><cmd>! black %<CR>:e<cr>', 'format python with black' },
    },
    h = {
      name = 'hoogle',
      h = { "<cmd>Telescope hoogle<cr>", "hoogle" },
      -- o = { ":!xdg-open $(hoogle --count 1 --json <cword> | jq -r '.[0].url')<CR>", 'hoogle open' },
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
  ['<leader>'] = {'<Plug>SlimeSendCell', 'run code section'},
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
  m = {'<cmd>lua require("nabla").popup()<cr>', 'math popup'},
  -- misc
  [';'] = {':', 'command'},
}, { prefix = "<leader>"})

-- normal mode
wk.register({
  L = { ":tabnext<cr>", "next tab" },
  H = { ":tabprevious<cr>", "previous tab" },
  ['gx'] = { ':!xdg-open <c-r><c-a><cr>', 'open file' },
  ["<c-q>"] = {'<cmd>q<cr>', 'close buffer'},
  -- ['<C-n>'] = { ':cnext<cr>', 'quickfix next' },
  -- ['<C-p>'] = { ':cprev<CR>', 'quickfix prev' },
  ['<esc>'] = { '<cmd>noh<cr>', 'remove search highlight' },
  ['n'] = {'nzzzv', 'center search'},
  ['gN'] = {'Nzzzv', 'center search'},
  ['gl'] = {'<c-]>', 'open help link'},
  ['gf'] = { ':e <cfile><CR>', 'edit file' },
  ['<C-j>']  = {'<C-W>j', 'move to window'},
  ['<C-k>']  = {'<C-W>k', 'move to window'},
  ['<C-h>']  = {'<C-W>h', 'move to window'},
  ['<C-l>']  = {'<C-W>l', 'move to window'},
  ['<tab>']  = {'<cmd>cnext<cr>', 'next qf'},
  ['<c-tab>']  = {'<cmd>cprev<cr>', 'previous qf'},
}, { mode = 'n' })

-- visual mode
wk.register({
  ['<cr>'] = {'<Plug>SlimeRegionSend', 'run code region'},
  ['gx'] = { '"ty:!xdg-open t<cr>', 'open file' },
  ['<M-j>'] =  { ":m'>+<cr>`<my`>mzgv`yo`z", 'move line down' },
  ['<M-k>'] = { ":m'<-2<cr>`>my`<mzgv`yo`z", 'move line up' },
  ['.'] = { ':norm .<cr>', 'repat last normal mode command' },
  ['q'] = { ':norm @q<cr>', 'repat q macro' },
}, { mode = 'v'})

wk.register({
  ['<leader>'] = {'<Plug>SlimeRegionSend', 'run code region'},
  ['<cr>'] = {'<cmd>MkdnFollowLink<cr>', 'follow / create link'},
  ['p'] = {'"_dP', 'replace without overwriting reg'},
} , { mode = 'v', prefix = "<leader>"})


