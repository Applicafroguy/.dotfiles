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
nmap('<F5>', require"dap".continue)
nmap('<F10>', require"dap".step_over)
nmap('<F11>', require"dap".step_into)
nmap('<F12>', require"dap".step_out)
nmap('Q', '<Nop>')

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
}, { prefix = "<leader>"})


