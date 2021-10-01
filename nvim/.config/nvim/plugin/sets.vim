
set number
set clipboard+=unnamedplus
set showcmd
set notimeout
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
set wrap
set lbr
set tw=120
set ai
set si

filetype plugin on
filetype indent on
au FocusGained,BufEnter * checktime
syntax enable

