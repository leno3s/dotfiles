"================================
" vanilla vim
"================================

" -------------------------------
" font, encoding
" -------------------------------
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
inoremap <C-Space> <C-x><C-o>
noremap <C-\> <ESC>
inoremap <C-\> <ESC>
inoremap <expr><C-Space> pumvisible() ? "<Down>" : "<C-x><C-o>"
inoremap <expr><C-S-Space> pumvisible() ? "<Up>" : "<C-x><C-o>"

" 補完表示時のEnterで改行をしない
set completeopt=menuone,noinsert
inoremap <expr><CR> pumvisible() ? "<C-y>" : "<CR>"
inoremap <expr><C-n> pumvisible() ? "<Down>" : "<C-n>"
inoremap <expr><C-p> pumvisible() ? "<Up>" : "<C-p>"

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
if !has("nvim")
    set clipboard+=unnamed
    set clipboard+=autoselect
endif

" -------------------------------
" visualize space, tab, etc
" -------------------------------
set list
if has('win64') && !has('nvim')
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

" filetype
augroup ft
    autocmd BufRead,BufNewFile *.plt setfiletype gnuplot
augroup END

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
    autocmd BufNewFile *.py : 0r ~/dotfiles/templates/py.py
    autocmd BufNewFile *.cpp : 0r ~/dotfiles/templates/cpp.cpp
    autocmd BufNewFile *.tex : 0r ~/dotfiles/templates/tex.tex
    autocmd BufNewFile *.bib : 0r ~/dotfiles/templates/bib.bib
endif

" -------------------------------
" etc.
" -------------------------------
set shellslash  " \の代わりに/を使えるようにする
filetype plugin on
filetype indent on

augroup latex
    autocmd!
    autocmd FileType tex let g:tex_flavor='latex'
    autocmd FileType tex let g:tex_conceal=0
    autocmd FileType tex set tabstop=2
    autocmd FileType tex set shiftwidth=2
augroup END

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
