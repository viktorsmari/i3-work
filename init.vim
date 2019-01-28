" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

"Syntax
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
"Plug 'terryma/vim-multiple-cursors'

"Search
Plug 'ctrlpvim/ctrlp.vim'
Plug 'henrik/vim-indexed-search'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'

"Git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'

Plug 'kshenoy/vim-signature'   " display marks in gutter
" On-demand loading
" Initialize plugin system
call plug#end()

colorscheme monokai

set number
set wrap!
set mouse=a
set list

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
nnoremap <S-F7> :tabm -1<CR>
nnoremap <S-F8> :tabm +1<CR>
" Ctrl C will copy
nnoremap <C-c> "+yy
vnoremap <C-c> "+y


"open nerdtree in empty vim
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
