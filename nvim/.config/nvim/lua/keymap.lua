local wk = require("which-key")

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

local Terminal  = require('toggleterm.terminal').Terminal
local spotify = Terminal:new({ cmd = "spotify_player", hidden = true })

local open_spotify = function()
  spotify:toggle()
end

vim.api.nvim_create_user_command('SpotifyToggle', open_spotify, {})

local nmap = function(key, effect)
  vim.keymap.set('n', key, effect, {silent = true, noremap = true})
end

local vmap = function(key, effect)
  vim.keymap.set('v', key, effect, {silent = true, noremap = true})
end

local imap = function(key, effect)
  vim.keymap.set('i', key, effect, {silent = true, noremap = true})
end

local function switchTheme()
  if vim.o.background == 'light' then
    vim.o.background = 'dark'
    vim.cmd[[Catppuccin mocha]]
  else
    vim.o.background = 'light'
    vim.cmd[[Catppuccin latte]]
  end
end

nmap('<leader>vt', switchTheme)
nmap('<F5>', require"dap".continue)
nmap('<F10>', require"dap".step_over)
nmap('<F11>', require"dap".step_into)
nmap('<F12>', require"dap".step_out)
nmap('Q', '<Nop>')

-- send code with ctrl+Enter
-- just like in e.g. RStudio
-- needs kitty (or other terminal) config:
-- map shift+enter send_text all \x1b[13;2u
-- map ctrl+enter send_text all \x1b[13;5u
nmap('<c-cr>', '<Plug>SlimeSendCell')
nmap('<s-cr>', '<Plug>SlimeSendCell')
imap('<c-cr>', '<esc><Plug>SlimeSendCell<cr>i')
imap('<s-cr>', '<esc><Plug>SlimeSendCell<cr>i')

-- send code with Enter and leader Enter
vmap('<cr>', '<Plug>SlimeRegionSend')
nmap('<leader><cr>', '<Plug>SlimeSendCell')


-- source entire file
nmap('<leader>xx', ':w<cr>:source %<cr>')

-- keep selection after indent/dedent
vmap('>', '>gv')
vmap('<', '<gv')

-- remove search highlight on esc
nmap('<esc>','<cmd>noh<cr>')

-- find files with telescope
nmap('<c-p>', "<cmd>Telescope find_files<cr>")

-- paste and without overwriting register
vmap("<leader>p", "\"_dP")

-- delete and without overwriting register
vmap("<leader>d", "\"_d")

-- terminal mode
-- get out ouf terminal insert mode with esc
vim.keymap.set('t', '<esc>', [[<c-\><c-n>]], {silent = true, noremap = true})
--move to other window
vim.keymap.set('t', '<c-j>', [[<c-\><c-n><c-w>w]], {silent = true, noremap = true})
vim.keymap.set('n', '<leader>j', [[<c-w>wi]], {silent = true, noremap = true})


-- open filetree
nmap('<c-b>', '<cmd>NvimTreeToggle<cr>')

-- move between splits and tabs
nmap('<c-h>', '<c-w>h')
nmap('<c-l>', '<c-w>l')
nmap('<c-j>', '<c-w>j')
nmap('<c-k>', '<c-w>k')
nmap('H', '<cmd>tabprevious<cr>')
nmap('L', '<cmd>tabnext<cr>')


--show kepbindings with whichkey
--add your own here if you want them to
--show up in the popup as well
wk.register({
  l = {
    name = 'language/lsp',
    r = {'<cmd>Telescope lsp_references<cr>', 'references'},
    R = {vim.lsp.buf.rename, 'rename'},
    D = {vim.lsp.buf.type_definition, 'type definition'},
    a = {vim.lsp.buf.code_action, 'coda action'},
    e = {vim.diagnostic.open_float , 'diagnostics'},
    f = {vim.lsp.buf.format, 'format'},
    o = {':SymbolsOutline<cr>', 'outline'},
    d  = {
      name = 'diagnostics',
      d = {vim.diagnostic.disable, 'disable'},
      e = {vim.diagnostic.enable, 'enable'},
    },
  },
  d = {
    name = "debug",
    e = {":lua require'dapui'.eval()<cr>", 'eval'},
    b = { ":lua require'dap'.toggle_breakpoint()<CR>", "breakpoint" },
    B = { ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", "breakpoint condition" },
    l = { ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", "log point" },
    r = { ":lua require'dap'.repl.open()<cr>", "repl" },
    u = { ":lua require'dapui'.toggle()<cr>", "ui" },
    c = { ":lua require'dap'.continue()<cr>", "continue" },
    so = { ":lua require'dap'.step_over()<cr>", "step over" },
    si = { ":lua require'dap'.step_into()<cr>", "step into" },
    st = { ":lua require'dap'.step_out()<cr>", "step out" },
    m = { ":lua require('dap-python').test_method()<cr>", "debug here" },
    M = { ":lua require('dap-python').test_class()<cr>", "debug here" },
    t = {
      name = "test",
      t = {':lua require("neotest").run.run()<cr>', 'nearest test'},
      o = {':lua require("neotest").output.open({ enter = true })<cr>', 'output test'},
      c = {':lua require("neotest").run.run(vim.fn.expand("%"))<cr>', 'current file'},
      d = {':lua require("neotest").run.run({strategy = "dap"})<cr>', 'debug test'},
      s = {':lua require("neotest").summary.open()<cr>', 'show summary'},
    }
  },
  q = {
    name = 'quarto',
    p = {require'quarto'.quartoPreview, 'preview'}
  },
  f = {
    name = 'find (telescope)',
    f = {'<cmd>Telescope find_files<cr>', 'files'},
    h = {'<cmd>Telescope help_tags<cr>', 'help'},
    k = {'<cmd>Telescope keymaps<cr>', 'keymaps'},
    r = {'<cmd>Telescope lsp_references<cr>', 'references'},
    g = { "<cmd>Telescope live_grep<cr>", "grep" },
    b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "fuzzy" },
    m = { "<cmd>Telescope marks<cr>", "marks" },
    M = { "<cmd>Telescope man_pages<cr>", "man pages" },
    c = { "<cmd>Telescope git_commits<cr>", "git commits" },
    s = { "<cmd>Telescope lsp_document_symbols<cr>", "symbols" },
    t = { "<cmd>Telescope tmux sessions<cr>", "tmux session" },
    w = { "<cmd>Telescope tmux windows<cr>", "tmux window" },
    d = { "<cmd>Telescope buffers<cr>", "buffers" },
    q = { "<cmd>Telescope quickfix<cr>", "quickfix" },
    l = { "<cmd>Telescope loclist<cr>", "loclist" },
    j = { "<cmd>Telescope jumplist<cr>", "marks" },
    p = { "<cmd>Telescope project<cr>", "project" },
  },
  s = {
    name = "spellcheck",
    s = { "<cmd>Telescope spell_suggest<cr>", "spelling" },
    ['/'] = { '<cmd>setlocal spell!<cr>', 'spellcheck' },
    n = { ']s', 'next' },
    p = {'[s', 'previous'},
    g = {'zg', 'good'},
    a = {'zg', 'accept'},
    b = {'zb', 'bad'},
    ['?'] = { '<cmd>Telescope spell_suggest<cr>', 'suggest' },
  },
  g = {
    name = "git",
    c = {":GitConflictRefresh<cr>", 'conflict'},
    g = {":Neogit<cr>", "neogit"},
    s = {":Gitsigns<cr>", "gitsigns"},
    pl = {":Octo pr list<cr>", "gh pr list"},
    pr = {":Octo review start<cr>", "gh pr review"},
    wc = {":lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>", "worktree create"},
    ws = {":lua require('telescope').extensions.git_worktree.git_worktrees()<cr>", "worktree switch"},
    d = {
      name = 'diff',
      o = {':DiffviewOpen<cr>', 'open'},
      c = {':DiffviewClose<cr>', 'close'},
    }
  },
  t = {
    name = 'treesitter',
    h = {":TSNodeUnderCursor<cr>", "hover"},
  },
  w = {
    name = 'write',
    w = {":w<cr>", "write"},
  },
  },
  {mode = 'n', prefix = '<leader>'}
)

-- normal mode
wk.register({
  ['<c-LeftMouse>'] = {'<cmd>lua vim.lsp.buf.definition()<CR>', 'go to definition'},
  ['<c-e>'] = { ":FeMaco<cr>", "edit code" },
  L = { ":tabnext<cr>", "next tab" },
  H = { ":tabprevious<cr>", "previous tab" },
  ['gx'] = { ':!xdg-open <c-r><c-a><cr>', 'open file' },
  ["<c-q>"] = {'<cmd>q<cr>', 'close buffer'},
  ['<esc>'] = { '<cmd>noh<cr>', 'remove search highlight' },
  ['n'] = {'nzzzv', 'center search'},
  ['gN'] = {'Nzzzv', 'center search'},
  ['gl'] = {'<c-]>', 'open help link'},
  ['gf'] = { ':e <cfile><CR>', 'edit file' },
  ['<C-j>']  = {'<C-W>j', 'move to window'},
  ['<C-k>']  = {'<C-W>k', 'move to window'},
  ['<C-h>']  = {'<C-W>h', 'move to window'},
  ['<C-l>']  = {'<C-W>l', 'move to window'},
  ['<C-s>']  = {':w<cr>', 'write'},
  -- does not work, <tab> is the same as <c-i>
  -- ['<c-tab>']  = {'<cmd>bnext<cr>', 'next buffer'},
  -- ['<c-s-tab>']  = {'<cmd>bprev<cr>', 'previous buffer'},
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

wk.register({
  ['<c-e>'] = { "<esc>:FeMaco<cr>i", "edit code" },
}, {mode = 'i'})

