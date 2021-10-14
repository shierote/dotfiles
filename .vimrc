" set
set autoindent "改行時に前の行のインデントを継続する
set clipboard+=unnamed " ヤンクをクリップボードにコピーできるようにする
set cursorline "現在の行を強調表示
set expandtab "タブ入力を複数の空白入力に置き換える
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
set hlsearch " 検索結果をハイライト
set nobackup "バックアップファイルをつくらない
set noswapfile "swapファイルを作らない
set number "行番号の表示
set shiftwidth=2 "自動インデントでずれる幅
set showcmd "入力中のコマンドをステータスに表示する
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する
set tabstop=2 "画面上でタブ文字が占める幅
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる

" syntax
syntax enable

" inoremap/nnoremap
inoremap <silent> jj <ESC> "jjをESCに割当
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

