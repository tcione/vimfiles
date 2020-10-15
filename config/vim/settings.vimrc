" Remap leader for nice combos
let mapleader = ","
let g:mapleader = ","
let maplocalleader = "\\"
let base16colorspace=256

filetype off

highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/
colorscheme base16-monokai

" be iMproved
set nocompatible

set maxmempattern=5000

" Lines to be remembered
set history=700

" Update file when changed outside vim
set autoread
set clipboard=unnamed
set t_Co=256

set termguicolors
set noruler
set noshowcmd

" Set utf8 as standard encoding
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn off backup files (not needed anymore =D)
set nobackup
set nowb
set noswapfile

" Show line numbers
set number

set guifont=Fira\ Mono:h18

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
set synmaxcol=1000

" Always show the status line
set laststatus=2

" Show white spaces
set listchars=eol:¬,tab:>-,trail:~,extends:>,precedes:<
set list

" Enable syntax highlighting
syntax enable

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

" Using new regexp engine make the editor faster
set re=0

" Remember info about open buffers on close
set viminfo^=%

" Disables Highlight_Matching_Pair
set noshowmatch
let g:loaded_matchparen=1
