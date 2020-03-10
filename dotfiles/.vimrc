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

Plug 'dracula/vim'
Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'jiangmiao/auto-pairs'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'w0rp/ale'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

call plug#end()

"#################################################
"# Editor Configurations
"#################################################

" Basic Configurations
" ------------------------------------------------
set hidden
set fileformats=unix,dos,mac

set number

set vb
set cc=80

set smartindent
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab

set noshowmode
set nobackup
set nowritebackup
set noswapfile

set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast
set nowrap

set hlsearch
set ignorecase
set smartcase
set incsearch


" Color Scheme
" ------------------------------------------------
if (has("termguicolors"))
  " set termguicolors
endif

syntax on
colorscheme dracula

" set t_Co=256
" highlight Normal ctermbg=NONE
" highlight nonText ctermbg=NONE


" fzf Options
" ------------------------------------------------
let g:fzf_command_prefix = 'Fzf'


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


" COC Options
" ------------------------------------------------
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']


" ALE Options
" ------------------------------------------------
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['eslint']
let g:ale_fixers['typescript'] = ['prettier', 'tslint']
let g:ale_fixers['json'] = ['prettier']
let g:ale_fixers['html'] = ['prettier']
let g:ale_fixers['vue'] = ['eslint']

let g:ale_fix_on_save = 1
let g:ale_sign_error = ">>"
let g:ale_sign_warning = "--"
highlight ALEErrorSign ctermfg=9 ctermbg=none guifg=#C30500 guibg=#F5F5F5
highlight ALEWarningSign ctermfg=11 ctermbg=none guifg=#ED6237 guibg=#F5F5F5
highlight ALEError ctermbg=none cterm=underline ctermfg=9
highlight ALEWarning ctermbg=none cterm=underline ctermfg=15


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
let mapleader=";"

nnoremap <C-p> :FZF<CR>

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
