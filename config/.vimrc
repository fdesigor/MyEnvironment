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
Plug 'jiangmiao/auto-pairs'
Plug 'airblade/vim-gitgutter'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/AutoComplPop'
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'

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

filetype plugin on

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
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ },
\}

" NERD Commenter Options
" ------------------------------------------------
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

" ALE Options
" ------------------------------------------------
let g:ale_fixers = {
\    'javascript': ['eslint'],
\    'vue': ['eslint'],
\    'scss': ['prettier']
\}

let g:ale_fix_on_save = 1

" UltiSnips Options
" ------------------------------------------------
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsEditSplit="vertical"

"#################################################
"# Mapped Commands
"#################################################

" Leader Key
" ------------------------------------------------
let mapleader="\<space>"

noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

nnoremap <Leader>d yyp
nnoremap <Leader>o o<esc>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
