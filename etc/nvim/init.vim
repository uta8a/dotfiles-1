if &compatible
	set nocompatible
endif
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim
if dein#load_state('~/.cache/dein')
	call dein#begin('~/.cache/dein')
	call dein#load_toml('~/.config/nvim/dein.toml', {'lazy': 0})
"	call dein#load_toml('~/.config/nvim/dein_lazy.toml', {'lazy': 1})
	call dein#end()
	call dein#save_state()
endif
if dein#check_install()
	call dein#install()
endif
filetype plugin indent on
syntax enable

colorscheme molokai
"colorscheme srcery

" vim-airline
let g:airline_theme='deus'
let g:airline#extensions#branch#enabled=1
let g:airline#extensions#tabline#eneabled=1

" NERDTree
autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden=1
let g:nerdtree_tabs_open_on_console_startup=1

" Rainbow parentheses
let g:rainbow_active=1

" vim-cheatsheet
let g:cheatsheet#cheat_file='~/.config/nvim/cheetsheet.md'

" termianlモードで行番号を表示しない
autocmd TermOpen * setlocal nonumber

" yankでclipboardにコピー
if system('uname -a | grep Microsoft') != ''
	augroup myyank
		autocmd!
		autocmd TextYankPost * :call system('clip.exe', @")
	augroup END
endif

" .vimrcからimportしてきた設定
" 文字コードをUFT-8に設定
set fenc=utf-8
" バックアップファイルを作らない
set nobackup
" スワップファイルを作らない
set noswapfile
" 編集中のファイルが変更されたら自動で読み直す
set autoread
" バッファが編集中でもその他のファイルを開けるように
set hidden
" 入力中のコマンドをステータスに表示する
set showcmd
" スクロールの余裕を確保する
set scrolloff=5

" 行番号を表示
set number
" 現在の行を強調表示
set cursorline
hi clear CursorLine
" 行末の1文字先までカーソルを移動できるように
set virtualedit=onemore
" ビープ音を可視化
set visualbell
" 括弧入力時の対応する括弧を表示
set showmatch
" ステータスラインを常に表示
set laststatus=2
" コマンドラインの補完
set wildmode=list:longest
"構文に色付け
syntax on

"----------------------------------------
"キーマッピング
"----------------------------------------
" 折り返し時に表示行単位での移動できるようにする
nnoremap j gj
nnoremap k gk
" インサートモードでjjと入力した場合はファイルの変更を保存する
inoremap jj <Esc>:<C-u>w<CR>
" インサートモードでも移動
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-h> <left>
inoremap <C-l> <right>
inoremap <C-^> <HOME>
inoremap <C-4> <End>
" 括弧等の補完
inoremap {<ENTER> {}<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap { {}<Left>
inoremap ( ()<Left>
inoremap < <><Left>
inoremap [ []<Left>
inoremap ' ''<Left>
autocmd Filetype lisp inoremap ' '
inoremap " ""<Left>
inoremap <C-b> <End>;
"上下に空行を挿入
inoremap <S-CR> <END><CR>
inoremap <C-S-CR> <Up><End><CR>
nnoremap <S-CR> mzo<ESC>`z
nnoremap <C-S-CR> mzo<ESC>`z
" タブ関連
nnoremap tc :<C-u>tabc<Cr>
nnoremap th :<C-u>tabN<Cr>
nnoremap tl :<C-u>tabn<Cr>

" terminal mode
tnoremap jj <C-\><C-n> 

" 行頭以外のTab文字の表示幅（スペースいくつ分）
set tabstop=4
" 行頭でのTab文字の表示幅
set shiftwidth=4
" 改行時に前の行のインデントを継続する
set autoindent
" インデントはスマートインデント
set smartindent
" マウス操作を有効にする
set mouse=a

" 検索文字列が小文字の場合は大文字小文字を区別なく検索する
set ignorecase
" 検索文字列に大文字が含まれている場合は区別して検索する
set smartcase
" 検索文字列入力時に順次対象文字列にヒットさせる
set incsearch
" 検索時に最後まで行ったら最初に戻る
set wrapscan
" 検索語をハイライト表示
set hlsearch
" ESC連打でハイライト解除
nmap <Esc><Esc> :nohlsearch<CR><Esc>