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
set clipboard=unnamed

" Remap leader for nice combos
let mapleader = ","
let g:mapleader = ","
let maplocalleader = "\\"

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
set wildignore+=**/vendor/*
" set wildignore+=**/plugins/*
set wildignore+=**/platforms/*
set wildignore+=**/node_modules/*
set wildignore+=**/bower_components/*
" set wildignore+=*.jpg
" set wildignore+=*.jpeg
" set wildignore+=*.png
" set wildignore+=*.gif
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
map <C-k><C-b> :Explore<cr>
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

Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'vim-scripts/PreserveNoEOL'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'tpope/vim-vinegar'
Plugin 'flazz/vim-colorschemes'
Plugin 'sickill/vim-monokai'
"Plugin 'Yggdroot/indentLine'
Plugin 'ctrlpvim/ctrlp.vim'
"Plugin 'tpope/vim-fugitive'
"Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/vim-misc'
Plugin 'mileszs/ack.vim'
" Plugin 'Valloric/YouCompleteMe'
"Plugin 'OmniSharp/omnisharp-vim'
"Plugin 'tpope/vim-dispatch'
"Plugin 'garbas/vim-snipmate'
"Plugin 'honza/vim-snippets'
"Plugin 'shawncplus/phpcomplete.vim'
"Plugin 'jiangmiao/auto-pairs'
"Plugin 'tpope/vim-endwise'
"Plugin 'godlygeek/tabular'
"Plugin 'scrooloose/syntastic'
Plugin 'neomake/neomake'
"Plugin 'tpope/vim-rails'
"Plugin 'tmhedberg/matchit'
Plugin 'benjifisher/matchit.zip'
"Plugin 'tpope/vim-surround'
"Plugin 'gregsexton/MatchTag'
Plugin 'sheerun/vim-polyglot'
"Plugin 'maxMEllon/vim-jsx-pretty'
"Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'neoclide/vim-jsx-improve'

call vundle#end()

filetype plugin indent on

""""""""""""""""""""""""""""""""""""""
" Post plugin config
""""""""""""""""""""""""""""""""""""""

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.exs set filetype=elixir
autocmd BufNewFile,BufReadPost *.ex set filetype=elixir
autocmd BufNewFile,BufReadPost *.eex set filetype=elixir
autocmd BufNewFile,BufReadPost *.conf set filetype=nginx
autocmd BufNewFile,BufReadPost README set filetype=markdown
autocmd BufNewFile,BufReadPost *.blade.php set filetype=blade
autocmd BufNewFile,BufReadPost todo.txt set filetype=todo
autocmd BufNewFile,BufReadPost *.hbs set filetype=html syntax=mustache

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

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_mode_map = { 'passive_filetypes': ['eruby', 'html'] }
"let g:syntastic_javascript_checkers = ['jshint']

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

let g:tagbar_ctags_bin='/usr/local/bin/ctags'
colorscheme molokai

let g:jsx_ext_required = 0
let g:ctrlp_max_files=0
let JSHintUpdateWriteOnly=1
let g:JSHintHighlightErrorLine = 0

let g:currentmode={
    \ 'n'  : 'N ',
    \ 'no' : 'N·Operator Pending ',
    \ 'v'  : 'V ',
    \ 'V'  : 'V·Line ',
    \ '^V' : 'V·Block ',
    \ 's'  : 'Select ',
    \ 'S'  : 'S·Line ',
    \ '^S' : 'S·Block ',
    \ 'i'  : 'I ',
    \ 'R'  : 'R ',
    \ 'Rv' : 'V·Replace ',
    \ 'c'  : 'Command ',
    \ 'cv' : 'Vim Ex ',
    \ 'ce' : 'Ex ',
    \ 'r'  : 'Prompt ',
    \ 'rm' : 'More ',
    \ 'r?' : 'Confirm ',
    \ '!'  : 'Shell ',
    \ 't'  : 'Terminal ',
    \}

" jamessan's
" taken from: http://got-ravings.blogspot.com.br/2008/08/vim-pr0n-making-statuslines-that-own.html
"set statusline=   " clear the statusline for when vimrc is reloaded
"set statusline+=%-3.3n\                      " buffer number
"set statusline+=%-3.3n\                      " buffer number
"set statusline+=%f\                          " file name
"set statusline+=%h%m%r%w                     " flags
"set statusline+=[%{strlen(&ft)?&ft:'none'},  " filetype
"set statusline+=%{strlen(&fenc)?&fenc:&enc}, " encoding
"set statusline+=%{&fileformat}]              " file format
"set statusline+=%=                           " right align
 "set statusline+=%{synIDattr(synID(line('.'),col('.'),1),'name')}\  " highlight
"set statusline+=%b,0x%-8B\                   " current char
"set statusline+=%-14.(%l,%c%V%)\ %<%P        " offset

"function! InsertStatuslineColor(mode)
  "if a:mode == 'i'
    "hi statusline ctermbg=magenta
  "elseif a:mode == 'r'
    "hi statusline ctermbg=blue
  "else
    "hi statusline ctermbg=red
  "endif
"endfunction

"au InsertEnter * call InsertStatuslineColor(v:insertmode)
"au InsertChange * call InsertStatuslineColor(v:insertmode)
"au InsertLeave * hi statusline ctermbg=green

 "default the statusline to green when entering Vim
"hi statusline ctermbg=green
"
"
" Automatically change the statusline color depending on mode
function! ChangeStatuslineColor()
  if (mode() =~# '\v(n|no)')
    exe 'hi! StatusLine ctermfg=008'
  elseif (mode() =~# '\v(v|V)' || g:currentmode[mode()] ==# 'V·Block' || get(g:currentmode, mode(), '') ==# 't')
    exe 'hi! StatusLine ctermfg=005'
  elseif (mode() ==# 'i')
    exe 'hi! StatusLine ctermfg=004'
  else
    exe 'hi! StatusLine ctermfg=006'
  endif

  return ''
endfunction

" Find out current buffer's size and output it.
function! FileSize()
  let bytes = getfsize(expand('%:p'))
  if (bytes >= 1024)
    let kbytes = bytes / 1024
  endif
  if (exists('kbytes') && kbytes >= 1000)
    let mbytes = kbytes / 1000
  endif

  if bytes <= 0
    return '0'
  endif

  if (exists('mbytes'))
    return mbytes . 'MB '
  elseif (exists('kbytes'))
    return kbytes . 'KB '
  else
    return bytes . 'B '
  endif
endfunction

function! ReadOnly()
  if &readonly || !&modifiable
    return '[RO]'
  else
    return ''
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return '¬| '.fugitive#head()
  else
    return ''
endfunction

set laststatus=2
set statusline=
set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=%8*\ [%n]                                " buffernr
"set statusline+=%8*\ %{GitInfo()}                        " Git Branch name
set statusline+=%8*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}             " Syntastic errors
set statusline+=%*
set statusline+=%9*\ %=                                  " Space
set statusline+=%8*\ %y\                                 " FileType
set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
"set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
set statusline+=%0*\ %3p%%\ l\ %l:\ %3c\                 " Rownumber/total (%)

hi User1 ctermfg=007
hi User2 ctermfg=008
hi User3 ctermfg=008
hi User4 ctermfg=008
hi User5 ctermfg=008
hi User7 ctermfg=008
hi User8 ctermfg=008
hi User9 ctermfg=007

hi TabLineFill ctermfg=239 ctermbg=239
hi TabLine ctermfg=246 ctermbg=239
hi TabLineSel ctermfg=237 ctermbg=250

" neomake settings
let g:neomake_open_list=0
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_jsx_enabled_makers = ['eslint']

autocmd! BufWritePost * Neomake

set re=1
