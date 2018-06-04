" font, encoding
set guifont=MigMix_1M:h8
set encoding=utf-8

" beep sound
set visualbell t_vb=

" Line number
set number

" cursor line
set cursorline
set cursorcolumn

set virtualedit=onemore
set laststatus=2
set wildmode=list:longest

" swap, backup files
set noswapfile
set nobackup
set noundofile

" visualize space, tab, etc
set list
set listchars=trail:.
set listchars=tab:>-
set listchars=eol:$

set visualbell
set showmatch
set matchtime=1
set matchpairs& matchpairs+=<:>

" indent
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set autoindent
set smartindent

" NeoBundle
set nocompatible
filetype plugin indent on

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim/
    call neobundle#begin(expand('$HOME/.vim/bundle/'))
    NeoBundleFetch 'Shougo/neobundle.vim'
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'Shougo/neomru.vim'
    NeoBundle 'altercation/vim-colors-solarized'
    NeoBundle 'tomasr/molokai'
    NeoBundle 'cohama/lexima.vim'
    call neobundle#end()
endif

" colors
colorscheme molokai
if &term =~ "xterm-256color" || "screen-256color"
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

syntax enable
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c
