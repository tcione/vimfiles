"""""""""""""""""""""""""""""""""""""
" Based on several sources and mine own exp
" Sources:
" - http://amix.dk/vim/vimrc.html


""""""""""""""""""""""""""""""""""""""
" General configuration
""""""""""""""""""""""""""""""""""""""

" be iMproved
set nocompatible
filetype off

" Lines to be remembered
set history=700

" Update file when changed outside vim
set autoread

" Remap leader for nice combos
let mapleader = ","
let g:mapleader = ","

" Friendly saving
nmap <leader>w :w!<cr>

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn off backup files (not needed anymore =D)
set nobackup
set nowb
set noswapfile

" Remap VIM 0 to first non-blank character
map 0 ^

" Delete trailing white space on save, useful for Python and CoffeeScript ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""
" UI
"""""""""""""""""""""""""""""""""""""

" Show line numbers
set number

set guifont=Fira\ Mono:h18

" WiLd menu for autocompletion
set wildmode=longest:full
set wildmenu

" Files ignored by WiLd
set wildignore=**/.git/*
set wildignore+=vendor/*
set wildignore+=*.jpg
set wildignore+=*.jpeg
set wildignore+=*.png
set wildignore+=*.gif
set wildignore+=*.mov
set wildignore+=*.mp4
set wildignore+=*.svg
set wildignore+=**/tmp/*
set wildignore+=*.eot
set wildignore+=*.ttf
set wildignore+=*.woff
set wildignore+=*.js.gz
set wildignore+=*.css.gz

" Backspace working as it should
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Highlight search result
set hlsearch

" Show matching brackets
set showmatch

" Mute error sounds
set noerrorbells
set novisualbell
set t_vb=
set tm=500
set synmaxcol=120

" Always show the status line
set laststatus=2

" Format the status line
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l

" Show white spaces
set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<
set list

" Enable syntax highlighting
syntax enable

"""""""""""""""""""""""""""""""""""""
" Text, tab and indent related
"""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent
set wrap

" Linebreak on 500 characters
set linebreak
set tw=1000
set wm=2

command! -nargs=* Wrap set wrap linebreak nolist
"""""""""""""""""""""""""""""""""""""
" Moving around
"""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map <leader>r :TagbarToggle<cr>
map <C-k><C-b> :NERDTreeToggle<cr>
map <leader>fi g=GG

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
" Remember info about open buffers on close
set viminfo^=%

""""""""""""""""""""""""""""""""""""""
" Helper Functions
""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

""""""""""""""""""""""""""""""""""""""
" Plugin stuff
""""""""""""""""""""""""""""""""""""""
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" Utilities
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'vim-scripts/PreserveNoEOL'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'freitass/todo.txt-vim'

"- Sublime like multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" Editor customization
Plugin 'flazz/vim-colorschemes'
Plugin 'bling/vim-airline'
Plugin 'sickill/vim-monokai'
Plugin 'Yggdroot/indentLine'

" Nav and code visualization
Plugin 'wincent/Command-T'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/vim-misc'
Plugin 'xolox/vim-easytags'
Plugin 'mileszs/ack.vim'

" Auto/code completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'

" Syntax stuff
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

" Ruby Stuff
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'stephpy/vim-yaml'

" JS Stuff
Plugin 'moll/vim-node'
Plugin 'walm/jshint.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'marijnh/tern_for_vim'

" HTML Related
Plugin 'mattn/emmet-vim'
Plugin 'edsono/vim-matchit'
Plugin 'tpope/vim-surround'
Plugin 'xsbeats/vim-blade.git'
Plugin 'othree/html5.vim'
Plugin 'gregsexton/MatchTag'

call vundle#end()

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""
" Post plugin config
""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile,BufReadPost *.md set filetype=markdown

let g:airline_theme='simple'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
"
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

let g:tagbar_width=26

let NERDTreeShowHidden=1

let g:NERDCustomDelimiters = {
  \ 'python' : { 'left': '# ', 'leftAlt': '', 'rightAlt': '' },
  \ 'ruby' : { 'left': '# ', 'leftAlt': '', 'rightAlt': '' }
\ }

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

let g:tagbar_ctags_bin='/usr/local/bin/ctags'
colorscheme molokai

