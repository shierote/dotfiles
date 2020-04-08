set expandtab 
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set number
set hlsearch
set autoindent
set clipboard+=unnamed
set fileformats=unix,dos,mac
set fileencodings=utf-8,sjis
set whichwrap=b,s,h,l,<,>,[,],~
set noswapfile

source $HOME/.vim/autoload/plug.vim
call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' } " file tree
  Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': ['NERDTreeFind', 'NERDTreeToggle'] } " add git status to nerdtree

  Plug 'neoclide/coc.nvim', {'merge':0, 'build': 'yarn install --frozen-lockfile'}
call plug#end()

syntax enable
syntax on

inoremap <silent> jj <ESC>
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

set nocompatible
filetype plugin indent off
set runtimepath+=~/.vim/bundle/neobundle.vim
if &compatible
  set nocompatible               " Be iMproved
endif


set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins "call vundle#begin('~/some/path/here') " let Vundle manage Vundle, required Plugin 'VundleVim/Vundle.vim' 
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" kotlin syntax hightlight
Plugin 'udalov/kotlin-vim'

syntax enable
set number

set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=2 "画面上でタブ文字が占める幅
set shiftwidth=2 "自動インデントでずれる幅
set softtabstop=2 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set autoindent "改行時に前の行のインデントを継続する
set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

set hlsearch " 検索結果をハイライト
" ESCキー2度押しでハイライトの切り替え
nnoremap <silent><Esc><Esc> :<C-u>set nohlsearch!<CR>
set whichwrap=b,s,h,l,<,>,[,],~ " カーソルの左右移動で行末から次の行の行頭への移動が可能になる
inoremap <silent> jj <ESC>
set clipboard+=unnamed " ヤンクをクリップボードにコピーできるようにする

"NeoBundle Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/taishieguchi/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('/Users/taishieguchi/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'slim-template/vim-slim'
NeoBundle 'Shougo/neocomplcache'

" ctagsを追加
" ctags -R をプロジェクトディレクトリで実行後
" <C-]>でジャンプ、<C-t>で戻る
NeoBundle 'szw/vim-tags'
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
NeoBundle 'Shougo/vimshell', { 'rev' : '3787e5' }
NeoBundle 'posva/vim-vue'
call neobundle#end()
filetype plugin indent on
set nocompatible


let g:acp_enableAtStartup = 0
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

:command V Vim

let g:indentLine_color_term = 111
let g:indentLine_color_gui = '#708090'
let g:indentLine_char = '' "use ¦, ┆ or │

Bundle 'kchmck/vim-coffee-script'
