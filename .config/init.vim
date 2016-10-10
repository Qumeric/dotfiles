set number
set nobomb  " No Byte Order Mark
set exrc    " Load local .vimrc
set secure  " Don't let local .vimrc do dangerous things
set wildmenu
set magic   " For regexps
set shell=/bin/bash " POSIX-Compliant
set history=1024
set tabpagemax=32
" Tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set autoindent
set hlsearch
set showmatch
set ignorecase
set lazyredraw

" Beautiful window separators
set fillchars=stl:\ ,stlnc:\ ,vert:│


" Word wrap
set formatoptions+=l
set lbr

" Show spaces and tabs [F12]
set listchars=tab:▸\ ,eol:¬
set list

autocmd Filetype lua setlocal ts=2 sw=2


" No bells
set noeb vb t_vb=
au GUIEnter * set vb t_vb=" Basic


" From tpope/vim-sensible
set backspace=indent,eol,start

set nrformats-=octal

set ttimeout
set ttimeoutlen=100

set incsearch
" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<C-R>=has('diff')?'<Bar>diffupdate':''<CR><CR><C-L>
endif

set laststatus=2 " Do I need it?
set ruler

set encoding=utf-8
set ffs=unix,dos,mac

" Backup FIXME may be extremely dangerous
set nobackup
set nowb
set noswapfile

" Probably unconvinient
"if &listchars ==# 'eol:$'
"  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
"endif

set formatoptions+=j " Delete comment character when joining commented lines

" WHAT IS THIS I DON'T EVEN
if has('path_extra')
  setglobal tags-=./tags tags-=./tags; tags^=./tags;
endif
if !empty(&viminfo)
  set viminfo^=!
endif
set sessionoptions-=options

if &shell =~# 'fish$'
  set shell=/bin/bash
endif

" Dein
set runtimepath^=~/.dein/repos/github.com/Shougo/dein.vim
call dein#begin(expand('~/.dein'))

call dein#add('Shougo/deoplete.nvim')
let g:deoplete#enable_at_startup = 1

" From rafi/vim-config
" Movement within 'ins-completion-menu'
inoremap <expr><S-Tab>  pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:is_whitespace() "{{{
	let col = col('.') - 1
	return ! col || getline('.')[col - 1] =~? '\s'
endfunction "}}}


" call dein#add 'plasticboy/vim-markdown' FIXME what is better?
call dein#add('tpope/vim-markdown')
let g:markdown_fenced_languages = ['html', 'python']
let g:markdown_syntax_conceal = 0

call dein#add('tpope/vim-surround')

call dein#add('tpope/vim-repeat') " Do I need it?

call dein#add('tpope/vim-commentary')

call dein#add('tpope/vim-fugitive') " How to use it?

" FIXME what is it I don't even
" function! MyFugitive()
"   if exists("*fugitive#head")
"     let _ = fugitive#head()
"     return strlen(_) ? ' '._ : ''
"   endif
"   return ''
" endfunction

call dein#add('justinmk/vim-sneak')

call dein#add('Chiel92/vim-autoformat')

call dein#add('scrooloose/nerdtree')

call dein#add('kien/ctrlp.vim')

call dein#add('fatih/vim-go')

call dein#add('klen/python-mode')
let g:pymode_rope = 0

call dein#add('lervag/vimtex')

"Plugin 'raimondi/delimitMate'
"Plugin 'wincent/Command-T'


" Colorschemes
call dein#add('rakr/vim-one')
call dein#add('jdkanani/vim-material-theme')
call dein#add('NLKNguyen/papercolor-theme')
call dein#add('whatyouhide/vim-gotham')
call dein#add('w0ng/vim-hybrid')
call dein#add('kristijanhusak/vim-hybrid-material')
call dein#add('tomasr/molokai')

call dein#end()

set termguicolors
let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1
set background=light
colorscheme PaperColor

filetype plugin indent on

if dein#check_install()
  call dein#install()
endif

" Mappings
noremap <F3> :Autoformat<CR>
map <F12> :set list!<CR>


" highlight OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/
