" Plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim' 
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'tpope/vim-commentary'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'camgraff/telescope-tmux.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'norcalli/nvim-terminal.lua'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
call plug#end()

" Globals
:cd $HOME
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:vim_markdown_math = 1
let g:vim_markdown_frontmatter = 1

" Mappings
let mapleader = " "
vnoremap <leader>p "_dP
nmap <leader>w :w!<cr>
map <leader>xx :x! <cr>
map <leader>qqq :q! <cr>
inoremap jk <Esc>
map 0 ^
nnoremap Y y$
" vmap <cr> y
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
nnoremap <leader>ve :edit $HOME/.config/nvim/init.vim<CR>
nnoremap <leader>vr :source $HOME/.config/nvim/init.vim<CR>
map <silent> <leader><cr> :noh<cr>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <leader>bd :Bclose<cr>:tabclose<cr>gT
map <leader>ba :bufdo bd<cr>
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 
map <leader>t<leader> :tabnext
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
map <leader>cd :cd %:p:h<cr>:pwd<cr>
set switchbuf=useopen,usetab,newtab
set stal=2
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
set laststatus=2

map <leader>ss :setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

