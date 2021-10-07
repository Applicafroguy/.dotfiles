let mapleader = " "

vnoremap <leader>p "_dP
nmap <leader>w :w!<cr>
map <leader>xx :x! <cr>
inoremap jk <Esc>
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
nnoremap <leader>so :source %<CR>
map <silent> <leader><cr> :noh<cr>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <leader>ba :bufdo bd<cr>
map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnew<cr>
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
nnoremap gl <c-]>


nnoremap <silent>gD :lua vim.lsp.buf.declaration()<CR>
nnoremap <silent>gd :lua vim.lsp.buf.definition()<CR>
" nnoremap <silent>K :lua vim.lsp.buf.hover()<CR>
nnoremap <silent>gh :lua vim.lsp.buf.hover()<CR>
nnoremap <silent>gi :lua vim.lsp.buf.implementation()<CR>
nnoremap <silent><C-k> :lua vim.lsp.buf.signature_help()<CR>
" nnoremap <silent><leader>wa :lua vim.lsp.buf.add_workspace_folder()<CR>
" nnoremap <silent><leader>wr :lua vim.lsp.buf.remove_workspace_folder()<CR>
" nnoremap <silent><leader>wl :lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>
nnoremap <silent><leader>D :lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent><leader>rn :lua vim.lsp.buf.rename()<CR>
nnoremap <silent><leader>ca :lua vim.lsp.buf.code_action()<CR>
nnoremap <silent>gr :lua vim.lsp.buf.references()<CR>
nnoremap <silent><leader>e :lua vim.lsp.diagnostic.show_line_diagnostics()<CR>
nnoremap <silent>[d :lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent>]d :lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent><leader>q :lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent><leader>f :lua vim.lsp.buf.formatting()<CR>

" insert chode chunks
map <leader>ir i```{R}```O
map <leader>ip i```{python}```O

