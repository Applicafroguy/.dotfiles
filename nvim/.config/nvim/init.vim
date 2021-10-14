" Plugins
lua require('plugins')

" Global settings
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

filetype plugin on
filetype indent on
au FocusGained,BufEnter * checktime
syntax enable

augroup filetypedetect
  au! BufRead,BufNewFile *.qmd		setfiletype markdown
augroup END

" Set
set number
set clipboard+=unnamedplus
set showcmd
set timeout
set timeoutlen=500
set ttimeout
set mouse=a
set mousefocus
set cursorline
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
set switchbuf=useopen,usetab,newtab
set stal=2

let g:lasttab = 1
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
au TabLeave * let g:lasttab = tabpagenr()

" Mappings
let mapleader = " "
let maplocalleader = " "

vnoremap <leader>p "_dP
nmap <leader>ww :w!<cr>
nnoremap Y y$
vmap <cr> y
nnoremap n nzzzv
nnoremap N Nzzzv
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z
inoremap , ,<c-g>u
inoremap . .<c-g>u
inoremap ? ?<c-g>u
inoremap ! !<c-g>u
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'

map <silent><leader><cr> :noh<cr>

map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" spellcheck
map <leader>ss :setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>sa zg
map <leader>sb zb
map <leader>s? z=
map <leader>s/ z=
map z= <cmd>Telescope spell_suggest<cr>

nnoremap gl <c-]>

" insert code chunks
noremap <leader>ip i```{python}```O
noremap <leader>ir i```{r}```xO

"  nvim-tree
nnoremap <C-n> :NvimTreeToggle<CR>

tnoremap <Esc> <C-\><C-n>


" slime
map <c-c>v     <Plug>SlimeConfig
nmap <leader><space> <Plug>SlimeSendCell
vmap <leader><space> <Plug>SlimeRegionSend


fun! Rmdocs()
  let l:topic = expand("<cword>")
  echo l:topic
  let l:command = "R --vanilla -q --no-echo -e 'rmdocs::rmd_help(\"" . l:topic . "\", lspmode = TRUE)'"
  let l:path = system(command)
  :execute 'tabnew' l:path
endfun

map <leader>hr :call Rmdocs()<cr>


