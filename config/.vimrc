" Author: Igor Fernandes dos Santos
" Source: https://github.com/fdesigor/MyEnvironment

"#################################################
"# Automatically download vim-plug
"#################################################
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"#################################################
"# Installed Plugins
"#################################################
call plug#begin(expand('~/.vim/plugged'))

Plug 'tomasr/molokai'
Plug 'itchyny/lightline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf.vim'
Plug 'ncm2/ncm2'
Plug 'jiangmiao/auto-pairs'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'

call plug#end()


"#################################################
"# Editor Configurations
"################################################# 

" Basic Configurations
" ------------------------------------------------
syntax on

set hidden

set number
set relativenumber

set vb

set smartindent
set expandtab
set softtabstop=2
set shiftwidth=2

set noshowmode
set nobackup
set nowritebackup
set noswapfile

set encoding=utf-8
set nowrap

set hlsearch
set ignorecase
set smartcase
set incsearch

" Color Scheme 
" ------------------------------------------------
colorscheme molokai

set t_Co=256
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" Lightline Options
" ------------------------------------------------
set laststatus=2
let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
     \ },
    \ 'component_function': {
    \   'gitbranch': 'fugitive#head'
    \ }
\ }

" FuzzyFinder
" ------------------------------------------------
set rtp+=~/.fzf

" ALE Options
" ------------------------------------------------
let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'vue': ['eslint'],
\    'scss': ['prettier']
\}

let g:ale_fix_on_save = 1


"#################################################
"# Mapped Commands
"#################################################

" Leader Key
" ------------------------------------------------
let mapleader=" "

nnoremap <leader>; :Files<CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
