set number
" set relativenumber

" ignore case when searching
set ignorecase
set wildmode=longest,list,full
set wildmenu


filetype plugin indent on
syntax on

set wrap
set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set smartcase
set wildmenu
set ruler
set nowrap
set splitright
set splitbelow

call plug#begin('~/.vim/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/nvim-cmp'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'gruvbox-community/gruvbox'

call plug#end()

lua require("marcjas")

nnoremap <c-p> :Files<cr>

inoremap <C-c> <esc>

let mapleader = " "

let g:gruvbox_contrast_dark='hard'
set background=dark
colorscheme gruvbox

