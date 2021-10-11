let mapleader = " "
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
nnoremap <leader>ve :edit $HOME/.config/nvim/init.vim<CR>
nnoremap <leader>vr :source $HOME/.config/nvim/init.vim<CR>
nnoremap <leader>vso :source %<CR>
map <silent><leader><cr> :noh<cr>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <leader>tn :tabnew<cr>
map <leader>tl :tabnext<cr>
map <leader>th :tabprevious<cr>
map <leader>te :tabedit <C-r>=expand("%:p:h")<cr>/
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" spellcheck
map <leader>ss :setlocal spell!<cr>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=
nnoremap gl <c-]>

" insert chode chunks
map <leader>ir i```{r}```O
map <leader>ip i```{python}```O

"  nvim-tree
nnoremap <C-n> :NvimTreeToggle<CR>

tnoremap <Esc> <C-\><C-n>

" telescope
nnoremap <leader>ff <cmd>Telescope git_files<cr>
nnoremap <leader>fa <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fm <cmd>Telescope man_pages<cr>
nnoremap <leader>fc <cmd>Telescope git_commits<cr>

" slime
xmap <c-c><c-c> <Plug>SlimeRegionSend
map <c-c><c-c> <Plug>SlimeParagraphSend
map <c-c>v     <Plug>SlimeConfig
vmap <leader><space> <Plug>SlimeRegionSend
nmap <leader><space> <Plug>SlimeSendCell

