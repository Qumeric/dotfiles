" Basic
set nobomb  " No Byte Order Mark
set exrc    " Load local .vimrc
set secure  " Don't let local .vimrc do dangerous things
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
set list
map <F12> :set list!<CR>

" No bells
set noeb vb t_vb=
au GUIEnter * set vb t_vb=" Basic

" Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'raimondi/delimitMate'
Plugin 'gerw/vim-latex-suite'
let g:tex_flavor='latex'
Plugin 'qumeric/python-syntax'
let python_highlight_all = 1
Plugin 'ajford/vimkivy'
Plugin 'jnwhiteh/vim-golang'
Plugin 'plasticboy/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-fugitive'
Plugin 'justinmk/vim-sneak'
Plugin 'itchyny/lightline.vim'
Plugin 'klen/python-mode'
let g:pymode_rope = 0
Plugin 'valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_autoclose_preview_window_after_completion = 1
Plugin 'scrooloose/nerdtree'
Plugin 'tomasr/molokai'
call vundle#end()
"Plugin 'wincent/Command-T'

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
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
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
