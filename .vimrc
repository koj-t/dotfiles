set nocompatible
"filetype on
filetype off


if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'Shougo/vimproc'
NeoBundle 'VimClojure'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'

NeoBundle 'klen/python-mode'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'Markdown'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'hail2u/vim-css3-syntax'
NeoBundle 'othree/html5.vim'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'rbtnn/winime.vim'

"Color Scheme------------------------------------
NeoBundle 'nanotech/jellybeans.vim'
NeoBundle 'w0ng/vim-hybrid'
NeoBundle 'vim-scripts/twilight'
NeoBundle 'jonathanfilip/vim-lucius'
NeoBundle 'jpo/vim-railscasts-theme'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'vim-scripts/Wombat'
NeoBundle 'tomasr/molokai'
NeoBundle 'vim-scripts/rdark'
NeoBundle 'tpope/vim-vividchalk'
NeoBundle 'Lokaltog/vim-distinguished'
"------------------------------------------------

let g:quickrun_config = {}
let g:quickrun_config['markdown'] = {
            \   'outputter': 'browser'
            \ }
set splitright
"            \   'outputter/buffer/split':'vertical' 
"            \ }
let g:quickrun_config['html'] = { 'command' : 'cygstart', 'exec' : '%c %s', 'outputter': 'browser' }
let g:quickrun_config['cs'] =  {
            \ 'command' : 'csc', 
            \ 'runmode' : 'simple',
            \ 'exec' : ['%c /nologo %s:t', './%s:t:r.exe', ':call delete("%s.exe")'], 
            \ 'tempfile' : '{tempname()}.cs',
            \ 'outputter': 'buffer'
            \ }
            "\ 'exec' : ['%c %s:gs?/?\? > /dev/null', '"%S:p:r:gs?/?\?.exe" %a', ':call delete("%S:p:r.exe")'], 


"quickrunの実行ショートカット
nnoremap <silent> pp :QuickRun<CR>

"colorschemeの適用
nnoremap <silent> cc :colorscheme desert<CR>

"NeoBundle 'https://bitbucket.org/kovisoft/slimv'
filetype plugin indent on     " required!
filetype indent on

" 画面表示の設定
"colorscheme vividchalk
colorscheme desert

set number         " 行番号を表示する
set ruler
set cursorline     " カーソル行の背景色を変える
set cursorcolumn   " カーソル位置のカラムの背景色を変える
set laststatus=2   " ステータス行を常に表示
set cmdheight=2    " メッセージ表示欄を2行確保
set showmatch      " 対応する括弧を強調表示
set helpheight=999 " ヘルプを画面いっぱいに開く
set list           " 不可視文字を表示
syntax on
" 不可視文字の表示記号指定
set listchars=tab:?\ ,eol:?,extends:?,precedes:?

" カーソル移動関連の設定
set backspace=indent,eol,start " Backspaceキーの影響範囲に制限を設けない
set whichwrap=b,s,h,l,<,>,[,]  " 行頭行末の左右移動で行をまたぐ
set scrolloff=8                " 上下8行の視界を確保
set sidescrolloff=16           " 左右スクロール時の視界を確保
set sidescroll=1               " 左右スクロールは一文字づつ行う

" ファイル処理関連の設定
set confirm    " 保存されていないファイルがあるときは終了前に保存確認
set hidden     " 保存されていないファイルがあるときでも別のファイルを開くことが出来る
set autoread   "外部でファイルに変更がされた場合は読みなおす
set nobackup   " ファイル保存時にバックアップファイルを作らない
set noswapfile " ファイル編集中にスワップファイルを作らない

" 検索/置換の設定
set hlsearch   " 検索文字列をハイライトする
set incsearch  " インクリメンタルサーチを行う
set ignorecase " 大文字と小文字を区別しない
set smartcase  " 大文字と小文字が混在した言葉で検索を行った場合に限り、大文字と小文字を区別する
set wrapscan   " 最後尾まで検索を終えたら次の検索で先頭に移る
set gdefault   " 置換の時 g オプションをデフォルトで有効にする

" タブ/インデントの設定
set expandtab     " タブ入力を複数の空白入力に置き換える
set tabstop=4     " 画面上でタブ文字が占める幅
set shiftwidth=4  " 自動インデントでずれる幅
set softtabstop=4 " 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent    " 改行時に前の行のインデントを継続する
set smartindent   " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する

" 動作環境との統合関連の設定
" OSのクリップボードをレジスタ指定無しで Yank, Put 出来るようにする
set clipboard=unnamed,unnamedplus
"ヤンクした文字がクリップボードに保存される
set clipboard+=unnamed
" マウスの入力を受け付ける
set mouse=a
" Windows でもパスの区切り文字を / にする
set shellslash
" インサートモードから抜けると自動的にIMEをオフにする
set iminsert=0


" コマンドラインの設定
" コマンドラインモードでTABキーによるファイル名補完を有効にする
set wildmenu wildmode=list:longest,full
" コマンドラインの履歴を10000件保存する
set history=10000

" ビープの設定
"ビープ音すべてを無効にする
set visualbell t_vb=
set noerrorbells "エラーメッセージの表示時にビープを鳴らさない

" For Python
autocmd FileType python setl nocindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

"--------------------------------------------------------------------------
"" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" Enable omni completion. Not required if they are already set elsewhere in
" .vimrc
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

"--------------------------------------------------------------------------
" neosnippet
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For snippet_complete marker.
if has('conceal')
    set conceallevel=2 concealcursor=i
endif

" インサートモードのjjでEsc
inoremap <silent> jj <ESC>
"inoremap <silent> <C-j> <esc>
inoremap <silent> <C-b> <Esc> 

inoremap <silent> <C-w> <ESC>:w<CR>i

"IME OFF
set imdisable
set iminsert=0
set imsearch=0

""-------------------------------------------------
"if has('multi_byte_ime')
"    highlight Cursor guifg=#000d18 guibg=#8faf9f gui=bold
"    highlight CursorIM guifg=NONE guibg=#ecbcbc
"endif
""------------------------------------------------今効いていない-
"
"set updatetime=1000
"function! s:winime_off()
"    if exists("g:loaded_winime") && (has('win32') || has('win64'))
"        if mode() !=# 'i'
"            call winime#off()
"            call feedkeys(mode() ==# 'i' ? "\<C-g>\<ESC>" : "g\<ESC>", 'n')
"        endif
"    endif
"endfunction
"augroup winime_off
"    autocmd!
"    autocmd CursorHold,CursorHoldI * call s:winime_off()
"augroup END
""-------------------------------------------------今効いていない
autocmd FileType * setlocal formatoptions-=ro

command! -nargs=1 -complete=file Rename f <args>|call delete(expand('#'))|w


"Moving Mapping
"nnoremap j gj
"nnoremap k gk
"nnoremap gj j
"nnoremap gk k

"Window moving
"nnoremap <C-j> <C-w>j
"nnoremap <C-k> <C-w>k
"nnoremap <C-l> <C-w>l
"nnoremap <C-h> <C-w>h
nnoremap <C-j> j
nnoremap <C-k> k
nnoremap <C-l> l
nnoremap <C-h> h

"" F2で前のバッファ
"nnoremap <F2> <ESC>:bp<CR>
"" F3で次のバッファ
"nnoremap <F3> <ESC>:bn<CR>
"" F4でバッファを削除する
"nnoremap <F4> <ESC>:bnext \| bdelete #<CR>
"command! Bw :bnext \| bdelete #

" insert mode での移動
inoremap <C-e> <END>
inoremap <C-a> <HOME>

" インサートモードでも移動（Ctrl押すけどね）
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-h> <Left>
inoremap <C-l> <Right>
" <Space>j, <space>kで画面送り
noremap <Space>j <C-f>
noremap <Space>k <C-b>

inoremap <Space><Space> - 

" php
autocmd FileType php inoremap <Space><Space> <?php  ?><Left><Left><Left>
autocmd FileType php inoremap <Space>[ ['']<Left><Left>
autocmd FileType php inoremap <C-4> $_

autocmd FileType md colorscheme koehler

" 行頭，行末
noremap <Space>h ^
noremap <Space>l $

" 行末ヤンク
nnoremap Y y$
nnoremap ; :

"改行
noremap <CR> i<CR><Esc>

" Tabs
nnoremap <Space>t t
nnoremap <Space>T T
nnoremap t <Nop>
nnoremap <silent> tc :<C-u>tabnew<CR>:tabmove<CR>
nnoremap <silent> tk :<C-u>tabclose<CR>
nnoremap <silent> tn :<C-u>tabnext<CR>
nnoremap <silent> tp :<C-u>tabprevious<CR>

" Unite
let g:unite_enable_start_insert = 1
nnoremap [unite]    <Nop>
nmap     <Space>u [unite]
nnoremap <silent> [unite]c   :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
nnoremap <silent> [unite]b   :<C-u>Unite buffer<CR>
nnoremap <silent> [unite]f   :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
nnoremap <silent> [unite]n   :<C-u>UniteWithBufferDir file/new<CR>
