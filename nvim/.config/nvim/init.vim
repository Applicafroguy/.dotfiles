" Plugins
lua require('plugins')

" Global settings
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh', 'R=r']
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1
let g:netrw_browsex_viewer = 'firefox'
let g:taboo_tab_format = '%f %m %x|' 
let g:taboo_modified_tab_flag = '◌'
let g:taboo_close_tab_label = '✖'
let mapleader = " "
let maplocalleader = " "

filetype plugin on
filetype indent on
au FocusGained,BufEnter * checktime
syntax enable

augroup filetypedetect
  au! BufRead,BufNewFile *.qmd setfiletype markdown
augroup END

"" Set
set list
set listchars=nbsp:.
set number
set clipboard+=unnamedplus
set showcmd
set timeout
set timeoutlen=500
set ttimeout
set mouse=a
set mousefocus
set nocursorline
set inccommand=nosplit
set hidden
set undofile
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=250
set shortmess+=c
set signcolumn=number
set history=500
set autoread
set so=7
set wildignore=*.o,*~,*.pyc
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
set ruler
set cmdheight=1
set hid
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
set ignorecase
set smartcase
set hlsearch
set incsearch 
set lazyredraw 
set magic
set showmatch 
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set foldcolumn=1
set encoding=utf8
set ffs=unix,dos,mac
set nobackup
set nowb
set noswapfile
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set wrap
set lbr
set tw=120
set ai
set si
set laststatus=2
set switchbuf=useopen,usetab
set showtabline=2

nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" insert code chunks
noremap <leader>ip i```{python}```O
noremap <leader>ir i```{r}```xO

tnoremap <Esc> <C-\><C-n>

" slime
map <c-c>v <Plug>SlimeConfig
nmap <leader><space> <Plug>SlimeSendCell
vmap <leader><space> <Plug>SlimeRegionSend


