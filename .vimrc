" Author: Igor Fernandes dos Santos
" Source: https://github.com/fdesigor/MyEnvironment

set rtp+=~/.fzf

"#################################################
"# Leader Key
"#################################################
let mapleader=","


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

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'sheerun/vim-polyglot'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'tomasr/molokai'

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
set ruler
set vb
set title
set smartindent
set expandtab
set softtabstop=2
set shiftwidth=2
set laststatus=2
set noshowmode
set nobackup
set nowritebackup
set noswapfile
set encoding=utf-8

" Color Scheme 
" ------------------------------------------------
colorscheme molokai
set t_Co=256
highlight Normal ctermbg=NONE
highlight nonText ctermbg=NONE

" Lightline Options
" ------------------------------------------------
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


"#################################################
"# Mapped Commands
"#################################################
map <C-o> :NERDTreeToggle<CR>
map ; :Files<CR>
