"================================
" vanilla vim
"================================

" -------------------------------
" font, encoding
" -------------------------------
set guifont=MigMix_1M:h8
set encoding=utf-8

" -------------------------------
" beeps
" -------------------------------
set belloff=all

" -------------------------------
" Line number
" -------------------------------
set number

" -------------------------------
" cursor line
" -------------------------------
" 端末上だと重い
" set cursorline
" set cursorcolumn

" -------------------------------
" key mapping
" -------------------------------
" C-spaceにOmni保管させるやつ
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
" カーソルの形設定するやつ
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

set virtualedit=onemore   "行末
set laststatus=2          "画面下部のステータスライン
set wildmode=longest:list,full "コマンドライン補完

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
set clipboard+=autoselect

" -------------------------------
" visualize space, tab, etc
" -------------------------------
set list
if has('win64')
    set listchars=tab:>.,trail:-
    " set listchars+=space:· ←これしんどい
else
    set listchars=tab:>.,space:·,trail:-
endif

highlight SpecialKey ctermfg=237 guifg=#3a3a3a
highlight NonText ctermfg=66 guifg=#5f8787
set ambiwidth=single
set showmatch   " displaying match paren
set matchtime=1
set matchpairs=(:),[:],{:},<:> " %で飛べる括弧
autocmd VimEnter * set conceallevel=0

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
" 新規ファイル時にテンプレートを読み込む
if has('vim_starting')
    autocmd BufNewFile *.cpp : 0r ~/dotfiles/templates/cpp.cpp
    autocmd BufNewFile *.tex : 0r ~/dotfiles/templates/tex.tex
endif

" -------------------------------
" etc.
" -------------------------------
set shellslash  " \の代わりに/を使えるようにする
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
syntax on
autocmd VimEnter * nested colorscheme molokai
highlight PmenuSel cterm=reverse ctermfg=33 ctermbg=222 gui=reverse guifg=#3399ff guibg=#f0e68c

augroup TransparentBG
    autocmd!
    autocmd Colorscheme * highlight Normal ctermbg=none
    autocmd Colorscheme * highlight NonText ctermbg=none
    autocmd Colorscheme * highlight LineNr ctermbg=none
    autocmd Colorscheme * highlight Folded ctermbg=none
    autocmd Colorscheme * highlight EndOfBuffer ctermbg=none
augroup END
