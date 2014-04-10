" Basic
set history=1024
set nocompatible
set shell=/bin/sh   " POSIX-Compliant
filetype off    " Required by Vundle

" UI
set number

set wildmenu

set magic " For regexps

set ignorecase
set hlsearch
set showmatch

set lazyredraw

" Beautiful window separators
set fillchars=stl:\ ,stlnc:\ ,vert:│

" Show spaces and tabs [F12]
set listchars=tab:▸\ ,eol:¬
map <F12> :set list!<CR>

" No bells
set noeb vb t_vb=
au GUIEnter * set vb t_vb=" Basic

" Vundle
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'gerw/vim-latex-suite'
let g:tex_flavor='latex'
Bundle 'plasticboy/vim-markdown'
Bundle 'hdima/python-syntax'
let python_highlight_all = 1
Bundle 'ajford/vimkivy'
Bundle 'tomasr/molokai'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-fugitive'
Bundle 'justinmk/vim-sneak'
Bundle 'itchyny/lightline.vim'
Bundle 'klen/python-mode'
let g:pymode_rope = 0
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

" Lightline 
set laststatus=2
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ 'component_function': {
      \   'fugitive': 'MyFugitive',
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '|' }
      \ }

function! MyFugitive()
  if exists("*fugitive#head")
    let _ = fugitive#head()
    return strlen(_) ? ' '._ : ''
  endif
  return ''
endfunction

" Last
filetype plugin indent on 
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
