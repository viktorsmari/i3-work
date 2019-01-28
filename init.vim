" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips' 
Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'henrik/vim-indexed-search'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
"Plug 'terryma/vim-multiple-cursors'

"Git
Plug 'Xuyuanp/nerdtree-git-plugin'

" On-demand loading
" Initialize plugin system
call plug#end()

colorscheme monokai

set number
set wrap!
set mouse=a

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
