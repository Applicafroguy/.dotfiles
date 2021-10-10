" Plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

" themes
Plug 'arcticicestudio/nord-vim'  " theme
Plug 'morhetz/gruvbox'

" layout
Plug 'norcalli/nvim-terminal.lua'
Plug 'hoob3rt/lualine.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'

" file tree
Plug 'kyazdani42/nvim-tree.lua'

" icons
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" editing
Plug 'tpope/vim-surround'

" toggle comment
Plug 'tpope/vim-commentary'

" find keybindings easier with suggestions
Plug 'folke/which-key.nvim'


" find everything
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'camgraff/telescope-tmux.nvim'
Plug 'ahmedkhalf/project.nvim'

" send code to a tmux window (or anywhere)
Plug 'jpalardy/vim-slime'

" git
Plug 'tpope/vim-fugitive'

" language server
Plug 'neovim/nvim-lspconfig' " lsp
Plug 'williamboman/nvim-lsp-installer' " lsp

" syntax trees for  better highliting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 

" autocompletion
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-calc'
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'f3fora/cmp-spell'
Plug 'ray-x/cmp-treesitter'
Plug 'tamago324/cmp-zsh'
Plug 'andersevenrud/compe-tmux', { 'branch': 'cmp' }
Plug 'quangnguyen30192/cmp-nvim-tags'
Plug 'jc-doyle/cmp-pandoc-references'
Plug 'onsails/lspkind-nvim'

Plug 'windwp/nvim-autopairs'

" snippets
Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'


Plug 'godlygeek/tabular' " for markdown display

call plug#end()

