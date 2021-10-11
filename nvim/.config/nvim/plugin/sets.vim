" Globals
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
set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
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
set nowrap
set lbr
set tw=120
set ai
set si


