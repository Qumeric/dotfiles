" Basic
set history=1024
set nocompatible
filetype off    " Required by Vundle

" UI
set number

set wildmenu

set magic " For regexps

set ignorecase
set hlsearch
set showmatch

set noeb vb t_vb=   " No bells

set lazyredraw

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'tomasr/molokai'
Bundle 'tpope/vim-fugitive'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'L9'
Bundle 'FuzzyFinder'
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

" Last
filetype plugin indent on
