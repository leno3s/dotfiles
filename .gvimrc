"---------------------------------------------------------------------------
set encoding=utf-8
"---------------------------------------------------------------------------
" フォント設定:
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
  " UNIX用 (xfontsetを使用)
  set guifontset=a14,r14,k14
endif

"---------------------------------------------------------------------------
" ウインドウに関する設定:
"---------------------------------------------------------------------------
" ウインドウの幅
set columns=160
" ウインドウの高さ
set lines=75
" コマンドラインの高さ(GUI使用時)
set cmdheight=2

"---------------------------------------------------------------------------
" 日本語入力に関する設定:
"---------------------------------------------------------------------------
if has('multi_byte_ime') || has('xim')
  " IME ON時のカーソルの色を設定(設定例:紫)
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
" マウスに関する設定:
"---------------------------------------------------------------------------
" どのモードでもマウスを使えるようにする
set mouse=a
" マウスの移動でフォーカスを自動的に切替えない (mousefocus:切替る)
set nomousefocus
" 入力時にマウスポインタを隠す (nomousehide:隠さない)
set mousehide
" ビジュアル選択(D&D他)を自動的にクリップボードへ (:help guioptions_a)
"set guioptions+=a

"---------------------------------------------------------------------------
" メニューに関する設定:
"---------------------------------------------------------------------------
" guiの設定
set guioptions=grLt

"--------------------------------------------------------------------------
" 見た目に関する設定
"---------------------------------------------------------------------------
" 行番号を表示
set number
" 現在の行を強調表示
" set cursorline
" 現在の行を強調表示（縦）
set cursorcolumn
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2

"-------------------------------------------------------------------------
" その他の設定
"---------------------------------------------------------------------------

" コマンドラインの補完
set wildmode=list:longest
" backspace で字消し
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
" ウィンドウ位置の保持
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
autocmd vimenter * set transparency=220
autocmd focusgained * set transparency=220
autocmd focuslost * set transparency=200
