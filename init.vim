" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

"Syntax
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript'
"Plug 'posva/vim-vue'
"Plug 'elixir-editors/vim-elixir'
Plug 'peitalin/vim-jsx-typescript' "React JSX syntax highlighting for vim and Typescript
Plug 'leafgarland/typescript-vim' "Typescript syntax files for Vim

Plug 'terryma/vim-multiple-cursors'
"Plug 'cristianoliveira/vim-react-html-snippets' "allows div + tab
Plug 'slim-template/vim-slim'
Plug 'tpope/vim-rails'

"Linter
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'

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
Plug 'joshdick/onedark.vim'

Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'

" On-demand loading
" Initialize plugin system
call plug#end()

syntax enable
set background=light
colorscheme onedark
"colorscheme monokai

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

" Do not search ctrlp in these folders
let g:ctrlp_custom_ignore = '_site\|node_modules\|DS_Store\|venv\|coverage\|bower_components\|tmp\|(\.(swp|git))'
let g:ctrlp_show_hidden = 1

let g:ale_fixers = {'ruby': ['rubocop'], 'python': ['trim_whitespace','black']}
let g:ale_linters = {
 \ 'zsh':['shell'],
 \ 'python':['pylint'],
 \ 'ruby':['rubocop'],
 \ 'javascript':['eslint'],
 \ 'scss':['stylelint'],
 \ 'css':['stylelint']}

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<s-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:deoplete#enable_at_startup = 1

"Without this, tab will cycle backwards
let g:SuperTabDefaultCompletionType = "<c-n>"

"Save with ctrl s
imap <C-s> <Esc>:w<CR>
nmap <C-s> :w<CR>

" Remap :W to :w
command W w
command Qa qa

"nerdTree
nnoremap <C-t> :NERDTreeToggle<CR>
inoremap <C-t> :NERDTreeToggle<CR>

"navigate splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <F6> :Git blame<CR>
inoremap <F6> <ESC>:Git blame<CR>

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

let mapleader = ","
nnoremap <Leader>a :Ack!<Space>
noremap <Leader>A :Ack <cword><cr>
map <Leader>m :NERDTreeFind<CR>
"Clear search
"map <silent> <leader>qs <Esc>:noh<CR>

" Search and replace word under cursor (,*)
nnoremap <leader>* :%s/\<<C-r><C-w>\>//<Left>

" pasting from clipboard and mouse selection
map <Leader>p :set paste<CR>o<esc>"+p:set nopaste<cr>
map <Leader>P :set paste<CR>o<esc>"*]p:set nopaste<cr>

if executable('ag')
  let g:ackprg = 'ag --vimgrep --hidden'
endif

" Use <F2> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F2>

" use F3 to disable highlight search, until next search
nnoremap <F3> :noh<CR>
