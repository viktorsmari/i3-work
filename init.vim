" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"Syntax
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx' "indents js
"Plug 'terryma/vim-multiple-cursors'
Plug 'cristianoliveira/vim-react-html-snippets' "allows div + tab
Plug 'slim-template/vim-slim'

"Search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'henrik/vim-indexed-search'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'

"Git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'

Plug 'kshenoy/vim-signature'   " display marks in gutter

"Colorscheme
Plug 'crusoexia/vim-monokai'
Plug 'phanviet/vim-monokai-pro'

Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'

" On-demand loading
" Initialize plugin system
call plug#end()

syntax enable
colorscheme monokai
"colorscheme monokai_pro

set cursorline               " highlight current line
set hidden
set laststatus=2             " window will always have a status line
set list
set mouse=a
set nobackup
set noswapfile
set number                   " show line number
set showcmd                  " show command in bottom bar
set showmatch                " highlight matching brace
set wildmenu                 " visual autocomplete for command menu
set wrap!
" Spaces & Tabs
set tabstop=2       " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set shiftwidth=2    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line

"search
set incsearch       " search as characters are entered
set hlsearch        " highlight matche
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is lower case

" folding
set foldmethod=indent
set foldlevel=20

let g:ctrlp_custom_ignore = '_site\|node_modules\|DS_Store\|venv\|bower_components\|tmp\|(\.(swp|git))'
let mapleader = ","
map <Leader>m :NERDTreeFind<CR>

"Save with ctrl s
imap <C-s> <Esc>:w<CR>
nmap <C-s> :w<CR>

"nerdTree
nnoremap <C-t> :NERDTreeToggle<CR>
inoremap <C-t> :NERDTreeToggle<CR>

"navigate splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"tab
nnoremap <F7> :tabp<CR>
nnoremap <F8> :tabn<CR>
inoremap <F7> <ESC>:tabp<CR>
inoremap <F8> <ESC>:tabn<CR>
"move tab
nnoremap <F19> :-tabm<CR>
nnoremap <F20> :+tabm<CR>

" Ctrl C will copy
nnoremap <C-c> "+yy
vnoremap <C-c> "+y

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

"disable Ex mode
:nnoremap Q <Nop>


" Hide .pyc in NERDTree
let NERDTreeIgnore = ['\.pyc$']


"open nerdtree in empty vim
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <Leader>a :Ack!<Space>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
