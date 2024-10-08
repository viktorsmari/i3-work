set nocompatible        " vundle required
filetype off            " vundle required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'github/copilot.vim'

"Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
set updatetime=100
"" Search
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'henrik/vim-indexed-search'
Plugin 'mileszs/ack.vim'
"" Git
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
"" Syntax
Plugin 'tpope/vim-rails'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'w0rp/ale'
"Plugin 'chase/vim-ansible-yaml'
"Plugin 'pangloss/vim-javascript'
"Plugin 'mxw/vim-jsx'
"Plugin 'leafgarland/typescript-vim'
"Plugin 'elixir-lang/vim-elixir'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'auto-pairs-gentle'
Plugin 'Valloric/MatchTagAlways' " match divs
Plugin 'kshenoy/vim-signature'   " display marks in gutter

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.

"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.


set autoindent

autocmd filetype python set expandtab
autocmd BufRead,BufNewFile   *.c,*.h,*.java set noic cin noexpandtab
autocmd BufRead,BufNewFile   *.pl syntax on

" nr of spaces for each FileType
autocmd FileType html setlocal shiftwidth=2 tabstop=2
autocmd FileType java setlocal shiftwidth=4 tabstop=4
autocmd FileType cpp setlocal shiftwidth=4 tabstop=4

"use zsh for unknown filetypes
autocmd BufEnter * if &filetype == "" | setlocal ft=zsh | endif

"open nerdtree in empty vim
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Enable syntax highlighting
syntax on

" Hide .pyc files in NERDTree
let NERDTreeIgnore = ['\.pyc$']

"------------------------------------------------------------
" Must have options {{{1
"
" These are highly recommended options.

" Vim with default settings does not allow easy switching between multiple files
" in the same editor window. Users can use multiple split windows or multiple
" tab pages to edit multiple files, but it is still best to enable an option to
" allow easier switching between files.
"
" One such option is the 'hidden' option, which allows you to re-use the same
" window and switch from an unsaved buffer without saving it first. Also allows
" you to keep an undo history for multiple files when re-using the same window
" in this way. Note that using persistent undo also lets you undo in multiple
" files even in the same window, but is less efficient and is actually designed
" for keeping undo history after closing Vim entirely. Vim will complain if you
" try to quit without saving, and swap files will keep you safe if your computer
" crashes.
set hidden

" Note that not everyone likes working this way (with the hidden option).
" Alternatives include using tabs or split windows instead of re-using the same
" window as mentioned above, and/or either of the following options:
" set confirm
" set autowriteall

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch
set incsearch "show search match as you type

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set copyindent "copy the previous indentation on autoindenting

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Higlight current line
set cursorline
" Highlight current column
set cursorcolumn

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F2> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F2>

" use F3 to disable highlight search, until next search
nnoremap <F3> :noh<CR>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
set shiftwidth=2
set tabstop=2

set wrap!
set showmatch "set show matching parenthesis

"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>
"------------------------------------------------------------

"disable Ex mode
nnoremap Q <Nop>

set nobackup
set noswapfile


"Save with ctrl s
imap <C-s> <Esc>:w<CR>
nmap <C-s> :w<CR>

"navigate splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set splitbelow
set splitright

"tab
nnoremap <F7> :tabp<CR>
nnoremap <F8> :tabn<CR>
inoremap <F7> <ESC>:tabp<CR>
inoremap <F8> <ESC>:tabn<CR>

"move tab
nnoremap <S-F7> :tabm -1<CR>
nnoremap <S-F8> :tabm +1<CR>

" folding
set foldmethod=indent
set foldlevel=20
inoremap <F9> <C-O>za
nnoremap <F9> za
onoremap <F9> <C-C>za
vnoremap <F9> zf

" Ctrl C will copy
nnoremap <C-c> "+yy
vnoremap <C-c> "+y
vmap <C-c> "+yy

let mapleader = ","
map <Leader>m :NERDTreeFind<CR>
map <Leader>l :Git blame<CR>

nnoremap <C-t> :NERDTreeToggle<CR>
inoremap <C-t> :NERDTreeToggle<CR>


"close abbrev with C-Space
inoremap <NUL> </<C-X><C-O>

colorscheme slate
hi Search cterm=NONE ctermfg=black ctermbg=blue
"let g:airline#extensions#tabline#enabled = 1

" Show trailing whitespace:
set listchars=tab:>-,trail:-
set list

" use Tab to complete snippets
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping = 0
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"ctrl p search ignores folders
let g:ctrlp_custom_ignore = '_site\|node_modules\|DS_Store\|bower_components\|tmp\|(\.(swp|git))'

let g:multi_cursor_exit_from_insert_mode = 0

"use .jsx syntax also in .js files
let g:jsx_ext_required = 0

let g:ale_fixers = {
 \ 'ruby': ['rubocop', 'trim_whitespace', 'remove_trailing_lines'],
 \ 'python': ['trim_whitespace','black'],
 \ 'javascript': ['eslint'],
 \ 'eruby': ['trim_whitespace', 'remove_trailing_lines']
 \}

"let g:ale_fix_on_save = 1
let g:ale_linters = {
 \ 'zsh':['shell'],
 \ 'python':['pylint'],
 \ 'ruby':['rubocop', 'ruby'],
 \ 'javascript':['eslint'],
 \ 'scss':['stylelint'],
 \ 'css':['stylelint']}

" Move between linting errors
nnoremap ]a :ALENextWrap<CR>
nnoremap [a :ALEPreviousWrap<CR>

"notes
" Copy to clipboard:        "+y
" increment number:         C-a
" change inside html tags:  cit
" create mark a:            ma
" load   mark a:            `a

" multiple cursor
" C-n C-n C-n cw
"
" Surround:
" ysiw '        Creates surround
" cs"'          Changes " to '
" ds'           Deletes '
" yss[          Wrap whole line in []

"let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <Leader>a :Ack!<Space>
noremap <Leader>A :Ack <cword><cr>

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
