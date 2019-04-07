"---------------------------------------------------------------------------
set encoding=utf-8
"---------------------------------------------------------------------------
" fonts
"---------------------------------------------------------------------------
if has('win32')
  set guifont=MigMix_1M:h12
  "set guifont=MS_Mincho:h12:cSHIFTJIS
  " 行間隔の設定
  set linespace=1
  " 一部のUCS文字の幅を自動計測して決める
  if has('kaoriya')
    set ambiwidth=auto
endif
elseif has('mac')
  set guifont=Osaka－等幅:h14
elseif has('xfontset')
  " UNIX用
  set guifontset=a14,r14,k14
endif

"---------------------------------------------------------------------------
" window size
"---------------------------------------------------------------------------
set columns=160
set lines=75
set cmdheight=2

"---------------------------------------------------------------------------
" 日本語入力
"---------------------------------------------------------------------------
if has('multi_byte_ime') || has('xim')
  " IME On時のカーソルの色
  autocmd VimEnter * highlight CursorIM guibg=Purple guifg=NONE
  " 挿入モード・検索モードでのデフォルトのIME状態設定
  set iminsert=0 imsearch=0
  if has('xim') && has('GUI_GTK')
    " XIMの入力開始キーを設定:
    " 下記の s-space はShift+Spaceの意味でkinput2+canna用設定
    "set imactivatekey=s-space
  endif
  " 挿入モードでのIME状態を記憶させない場合、次行のコメントを解除
  "inoremap <silent> <ESC> <ESC>:set iminsert=0<CR>
endif

"---------------------------------------------------------------------------
" mouse
"---------------------------------------------------------------------------
" マウスを利用するか
" set mouse=a
" マウスの移動でフォーカスを自動的に切替えない
" set nomousefocus
" 入力時にマウスポインタを隠す
" set mousehide
" ビジュアル選択を自動的にクリップボードへ
"set guioptions+=a

"---------------------------------------------------------------------------
" gui menus
"---------------------------------------------------------------------------
" guiの設定
set guioptions=pt

"--------------------------------------------------------------------------
" visual
"---------------------------------------------------------------------------
set number
" set cursorline
set cursorcolumn
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2

"-------------------------------------------------------------------------
" etc.
"---------------------------------------------------------------------------
" コマンドラインの補完
set wildmode=list:longest
" backspaceを効かせる
set backspace=2

"---------------------------------------------------------------------------
" インデントの設定
"---------------------------------------------------------------------------
set expandtab
set et
set tabstop=2
set shiftwidth=2
set smartindent

"---------------------------------------------------------------------------
" save window position
"---------------------------------------------------------------------------
let g:save_window_file = expand('~/.vimwinpos')
augroup SaveWindow
  autocmd!
  autocmd VimLeavePre * call s:save_window()
  function! s:save_window()
    let options = [
      \ 'set columns=' . &columns,
      \ 'set lines=' . &lines,
      \ 'winpos ' . getwinposx() . ' ' . getwinposy(),
      \ ]
    call writefile(options, g:save_window_file)
  endfunction
augroup END

if filereadable(g:save_window_file)
  execute 'source' g:save_window_file
endif


gui
" 透過
autocmd vimenter * set transparency=220
autocmd focusgained * set transparency=220
autocmd focuslost * set transparency=200
