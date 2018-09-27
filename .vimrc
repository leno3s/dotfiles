"================================
" vanilla vim
"================================

" -------------------------------
" font, encoding
" -------------------------------
set guifont=MigMix_1M:h8
set encoding=utf-8

" -------------------------------
" beep sound
" -------------------------------
set visualbell t_vb=

" -------------------------------
" Line number
" -------------------------------
set number

" -------------------------------
" cursor line
" -------------------------------
set cursorline
" set cursorcolumn

" -------------------------------
" key mapping
" -------------------------------
if !has('gui_running')
    augroup term_vim_c_space
        autocmd!
        autocmd VimEnter * map <Nul> <C-Space>
        autocmd VimEnter * map! <Nul> <C-Space>
    augroup END
endif
imap <C-Space> <C-x><C-o>

" -------------------------------
" cursor types
" -------------------------------
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

set virtualedit=onemore
set laststatus=2
set wildmode=list:longest

" -------------------------------
" swap, backup files
" -------------------------------
set noswapfile
set nobackup
set noundofile

" -------------------------------
" sync clipboard
" -------------------------------
set clipboard+=unnamed

" -------------------------------
" visualize space, tab, etc
" -------------------------------
set list
set listchars=space:-
highlight SpecialKey ctermfg=237 guifg=#3a3a3a
highlight NonText ctermfg=66 guifg=#5f8787
set visualbell
set showmatch
set matchtime=1
set matchpairs& matchpairs+=<:>
set conceallevel=0

" -------------------------------
" indent
" -------------------------------
set expandtab
set tabstop=4
set shiftwidth=4
set smarttab
set autoindent
set smartindent

" -------------------------------
" templates
" -------------------------------
if has('vim_starting')
    autocmd BufNewFile *.cpp : 0r ~/dotfiles/templates/cpp.cpp
    autocmd BufNewFile *.tex : 0r ~/dotfiles/templates/tex.tex
endif


" -------------------------------
" etc.
" -------------------------------
set nocompatible
set shellslash
filetype plugin on
filetype indent on

let g:tex_flavor='latex'

" ===============================
" dein.vim
" ===============================
" load toml
if has('vim_starting')
    set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim
    if dein#load_state('~/.vim/dein')
        call dein#begin('~/.vim/dein')
        call dein#load_toml('~/dotfiles/dein.toml', {'lazy': 0})
        call dein#load_toml('~/dotfiles/dein_lazy.toml', {'lazy': 1})
        call dein#end()
        call dein#save_state()
    endif
endif

" -------------------------------
" colors
" -------------------------------
if &term =~ "xterm-256color" || "screen-256color"
  set t_Co=256
  set t_Sf=[3%dm
  set t_Sb=[4%dm
elseif &term =~ "xterm-color"
  set t_Co=8
  set t_Sf=[3%dm
  set t_Sb=[4%dm
endif

syntax on
highlight PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c
