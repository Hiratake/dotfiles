" 文字コードをUTF-8に設定する
set fenc=utf-8
" バックアップファイルを作らないようにする
set nobackup
" スワップファイルを作らないようにする
set noswapfile
" 編集中にファイルが変更されたら自動で読み込み直す
set autoread
" 編集中に別のファイルを開けるようにする
set hidden
" 入力中のコマンドを表示する
set showcmd

" 行番号を表示する
set number
" 現在の行を強調表示する
set cursorline
" 行末の1文字分先までカーソル移動できるようにする
set virtualedit=onemore
" スマートインデントを使用する
set smartindent
" ビープ音を可視化する
set visualbell
" カッコ入力時に対応するカッコを表示する
set showmatch
" ステータスラインを常に表示する
set laststatus=2
" コマンドラインの補完をする
set wildmode=list:longest
" 折り返し時に表示行単位で移動できるようにする
nnoremap j gj
nnoremap k gk
" シンタックスハイライトを有効化する
syntax enable

" 不可視文字を可視化する
set list listchars=tab:\▸\-
" TABを半角スペースにする
set expandtab
" TABをスペース2つ分にする
set tabstop=2
set shiftwidth=2

" 検索文字列が小文字の場合は大文字小文字を区別しないようにする
set ignorecase
" 検索文字列に大文字がある場合は大文字小文字を区別する
set smartcase
" 検索文字列入力時にも検索する
set incsearch
" 検索時に最後まで行ったら最初に戻るようにする
set wrapscan
" 検索文字列をハイライト表示する
set hlsearch
" ESC連打でハイライトを解除する
nmap <Esc><Esc> :nohlsearch<CR><Esc>