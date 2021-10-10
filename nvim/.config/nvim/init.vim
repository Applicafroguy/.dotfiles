" Plugins
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'arcticicestudio/nord-vim'  " theme


Plug 'morhetz/gruvbox'
Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular' " for markdown display
Plug 'tpope/vim-commentary' " toggle comment

Plug 'folke/which-key.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'camgraff/telescope-tmux.nvim' " will need a newer tmux version for popup displays
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'norcalli/nvim-terminal.lua'
Plug 'vim-airline/vim-airline' "  status line
Plug 'tpope/vim-fugitive' " git
Plug 'jpalardy/vim-slime' " send code to a tmux window

Plug 'neovim/nvim-lspconfig' " lsp

Plug 'hrsh7th/vim-vsnip'
Plug 'rafamadriz/friendly-snippets'

Plug 'hrsh7th/nvim-cmp' " autocomplete, with lsp
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

Plug 'tmux-plugins/vim-tmux'
call plug#end()


 
