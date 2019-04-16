" Author: Igor Fernandes dos Santos
" Source: https://github.com/fdesigor/MyEnvironment

set rtp+=~/.fzf

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
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'vim-scripts/AutoComplPop'
Plug 'Raimondi/delimitMate'
Plug 'sheerun/vim-polyglot'
Plug 'tomasr/molokai'

Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

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

" Syntastic Options
" ------------------------------------------------
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


"#################################################
"# Leader Key
"#################################################
  let mapleader=" "
"#################################################
"# Mapped Commands
"#################################################
noremap <Leader>h :split<CR>
noremap <Leader>v :vsplit<CR>

nnoremap <leader>o :NERDTreeToggle<CR>
nnoremap <leader>; :Files<CR>
