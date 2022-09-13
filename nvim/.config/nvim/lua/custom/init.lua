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


-- normal mode <leader>
wk.register({
  g = {
    name = "git",
    g = {":Neogit<cr>", "neogit"},
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
}, { prefix = "<leader>"})

-- normal mode
wk.register({
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


