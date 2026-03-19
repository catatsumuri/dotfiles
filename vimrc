" ===============================
" Minimal Vim config (SSH / EC2向け + indent強化)
" ===============================

" --- 表示系 ---
syntax enable            " 構文ハイライト
set nonumber             " 行番号OFF（コピペ優先）

" --- 入力・操作 ---
set mouse=               " マウス無効（ターミナル選択優先）
set backspace=indent,eol,start

" --- 検索 ---
set incsearch
set hlsearch
set ignorecase
set smartcase

" --- コマンド補完 ---
set wildmenu
set wildmode=longest:full,full

" --- 行番号トグル ---
nnoremap <leader>n :set number!<CR>

" ===============================
" インデント
" ===============================

set autoindent           " 前の行を引き継ぐ（基本）
set smartindent          " C系言語での自動調整

" タブ設定（無難なデフォルト）
set tabstop=2            " タブ幅表示
set shiftwidth=2         " インデント幅
set expandtab            " タブをスペースに変換

" ===============================
" vim-plug（軽量運用）
" ===============================

if empty(glob('~/.vim/autoload/plug.vim')) && executable('curl')
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

if filereadable(expand('~/.vim/autoload/plug.vim'))
  execute 'source' fnameescape(expand('~/.vim/autoload/plug.vim'))

  call plug#begin('~/.vim/plugged')

  Plug 'tpope/vim-sensible'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-repeat'
  Plug 'tpope/vim-commentary'
  Plug 'editorconfig/editorconfig-vim'

  call plug#end()
endif

" ===============================
" EditorConfig調整
" ===============================
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" ===============================
" 設計思想
" ===============================
" ・軽量最優先
" ・コピペ邪魔しない
" ・検索強化
" ・indentは最低限の自動化だけ
" ・IDE化しない

