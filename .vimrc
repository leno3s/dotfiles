" font, encoding
set guifont=MigMix_1M:h8
set encoding=utf-8

" beep sound
set visualbell t_vb=

" Line number
set number

" cursor line
set cursorline
" set cursorcolumn

" cursor types
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

set virtualedit=onemore
set laststatus=2
set wildmode=list:longest

" swap, backup files
set noswapfile
set nobackup
set noundofile

" sync clipboard
set clipboard+=unnamed

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

" templates
if has('vim_starting')
    autocmd BufNewFile *.cpp : 0r ~/dotfiles/templates/cpp.cpp
    autocmd BufNewFile *.tex : 0r ~/dotfiles/templates/tex.tex
endif

" dein.vim
set nocompatible
filetype plugin indent on

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

" neocomplete.vim
"
" cquery
function MakeCquery()
      let temp = expand('%:p')
      echo system('echo ''[{"directory": "/home/kutimoti/contest","command": "/usr/bin/c++  ' . temp . ' -std=c++11","file": "' . temp . '"}]'' > compile_commands.json')
endfunction

" vim-clang
let g:clang_c_options='-std=c11'
let g:clang_cpp_options = "-std=c++11 -stdlib=libc++"

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

call MakeCquery()
syntax enable
hi PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c
