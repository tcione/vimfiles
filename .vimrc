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

set maxmempattern=5000

" Lines to be remembered
set history=700

" Update file when changed outside vim
set autoread
set clipboard=unnamed
set t_Co=256

set termguicolors

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
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

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
set wildignore+=**/vcr_cassettes/*
set wildignore+=vcr_cassettes/*
set wildignore+=*.mov
set wildignore+=*.mp4
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
set synmaxcol=200

" Always show the status line
set laststatus=2

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

" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2

set ai "Auto indent
set si "Smart indent
set wrap
set breakindent
set breakindentopt=shift:2,min:40,sbr

" Linebreak on 1000 characters
set linebreak
set tw=1000
set wm=2

" Using old regexp engine make the editor faster
set re=1

command! -nargs=* Wrap set wrap linebreak nolist

"""""""""""""""""""""""""""""""""""""
" Moving around
"""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Open file explorer
map <C-k><C-b> :Explore<cr>

" Reindent file
map <leader>fi g=GG

" Open notational vim
nnoremap <silent> <leader>s :NV<CR>

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
call plug#begin('~/.vim/plugged')

" Quality of life
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-vinegar'
Plug 'crusoexia/vim-monokai'
Plug 'danielwe/base16-vim'
Plug 'sheerun/vim-polyglot'
Plug 'benjifisher/matchit.zip'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/BufOnly.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/PreserveNoEOL'
Plug 'editorconfig/editorconfig-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-abolish'
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'

" Tools
Plug 'mileszs/ack.vim'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'janko-m/vim-test'

" Misc
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'vim-scripts/vim-misc'
Plug 'junegunn/goyo.vim'
Plug 'https://github.com/Alok/notational-fzf-vim'
Plug 'pedrohdz/vim-yaml-folds'

call plug#end()

filetype plugin indent on


""""""""""""""""""""""""""""""""""""""
" Manual syntax attribution
""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.prisma set filetype=graphql
autocmd BufNewFile,BufReadPost README set filetype=markdown
autocmd BufNewFile,BufReadPost todo.txt set filetype=todo
autocmd BufNewFile,BufReadPost *.axlsx set filetype=ruby
" autocmd BufNewFile,BufReadPost *_spec.rb set filetype=rspec
" autocmd BufNewFile,BufReadPost *_context.rb set filetype=rspec
autocmd BufNewFile,BufReadPost *.jb set filetype=ruby

""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

let base16colorspace=256

colorscheme base16-monokai

""""""""""""""""""""""""""""""""""""""
" FZF shortcurts
""""""""""""""""""""""""""""""""""""""
nmap ; :Buffers<CR>
nmap <Leader>p :Files<CR>
nmap <Leader>r :Tags<CR>

""""""""""""""""""""""""""""""""""""""
" A mode for human text :D
""""""""""""""""""""""""""""""""""""""
function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  set syntax=markdown
  let g:ycm_auto_trigger = 0
endfunction

command! ProseMode call ProseMode()
nmap \p :ProseMode<CR>

""""""""""""""""""""""""""""""""""""""
" A mode for human text :D
""""""""""""""""""""""""""""""""""""""

" vim-test
let g:test#strategy = 'vimterminal'
" Enable whenever working with docker
" let g:test#ruby#rspec#executable = 'docker-compose run --rm -e RAILS_ENV=test app rspec'
" let g:test#ruby#rspec#executable = 'docker-compose exec app rspec'

" ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" fzf
let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=log --exclude=vendor --exclude=bower_components --exclude=node_modules --exclude=vcr_cassettes *'

" Enable C-j C-k navigation in completion
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" vim-jsx
let g:jsx_ext_required=0

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

" alchemist / vim-elixir
let g:mix_format_on_save = 1

" Rust
let g:rustfmt_autosave = 1

" notational vim
let g:nv_search_paths = ['~/Documents/Notes']
let g:polyglot_disabled = ['markdown']

set noshowmode
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename', 'modified' ] ]
      \ }
      \ }

set rtp+=/usr/local/opt/fzf

