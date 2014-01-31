set history=1024
set nocompatible
set showtabline=0
filetype off    " Required by Vundle

" UI
set number

set wildmenu

set magic " For regexps

set ignorecase
set hlsearch
set showmatch

set lazyredraw

set listchars=tab:▸\ ,eol:¬
map <F12> :set list!<CR>

" Bells
set noeb vb t_vb=
au GUIEnter * set vb t_vb=" Basic

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'gerw/vim-latex-suite'
let g:tex_flavor='latex'
Bundle 'tomasr/molokai'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'plasticboy/vim-markdown'
Bundle 'bling/vim-airline'
"Bundle 'wincent/Command-T'

" Colors and fonts 
colorscheme molokai
syntax enable

set encoding=utf-8
set ffs=unix,dos,mac

" Backup
set nobackup
set nowb
set noswapfile

" Tabs
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4

set autoindent
set smartindent

" Word wrap
set formatoptions+=l
set lbr

" Bindings
map <F12> :set list!<CR>

" Airline
set laststatus=2

let g:airline_powerline_fonts=1
let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''

" Last
filetype plugin indent on
