set rtp+=~/.fzf

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
Plug 'dracula/vim', { 'as': 'dracula' }

call plug#end()

"#################################################
"# Editor Configurations
"################################################# 

" Basic Configurations
" ------------------------------------------------
set hidden
set number
set relativenumber
set ruler
set vb
set shiftwidth=4
set title
set tabstop=4
set laststatus=2
set noshowmode

" Color Scheme 
" ------------------------------------------------
syntax on
color dracula
hi! Normal ctermbg=NONE guibg=NONE

if !has('gui_running')
  set t_Co=256
endif

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
