vim.g.markdown_fenced_languages = { 'html', 'python', 'bash=sh', 'R=r' }
vim.g.vim_markdown_math = 1
vim.g.vim_markdown_frontmatter = 1
vim.g.netrw_browsex_viewer = 'firefox'
vim.g.taboo_tab_format = '%f %m %x|'
vim.g.taboo_modified_tab_flag = '◌'
vim.g.taboo_close_tab_label = '✖'
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.vimsyn_embed = 'l'

local tabsize = 2

vim.opt.list = true
vim.opt.showmode = false
vim.opt.listchars = 'tab:|·,trail:␠,nbsp:⎵'
vim.opt.signcolumn = "yes:1"
vim.opt.number = true
vim.opt.clipboard:append 'unnamedplus'
vim.opt.showcmd = true
vim.opt.timeoutlen = 400 -- until which-key pops up
vim.opt.updatetime = 250 -- for autocommands and hovers
vim.opt.mouse= 'a'
vim.opt.mousefocus = true
vim.opt.undofile = true
vim.opt.shortmess:append 'c'
vim.opt.history=500
vim.opt.so=5
vim.opt.wildignore:append {'*/.git/*'}
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.lazyredraw = true
vim.opt.showmatch = true
vim.opt.foldcolumn = 'auto'
vim.opt.swapfile = false
vim.opt.expandtab = true
vim.opt.shiftwidth = tabsize
vim.opt.tabstop = tabsize
vim.opt.linebreak = true
vim.opt.breakindent = true
-- vim.opt.textwidth = 120
vim.opt.smartindent = true
vim.opt.laststatus = 2
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.switchbuf = 'useopen,usetab'
vim.opt.showtabline=1
vim.opt.path:append '**'


