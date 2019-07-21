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

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite * :call DeleteTrailingWS()

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

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

" Linebreak on 1000 characters
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
Plug 'w0rp/ale'
Plug 'benjifisher/matchit.zip'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/BufOnly.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/PreserveNoEOL'
Plug 'editorconfig/editorconfig-vim'

" Tools
Plug 'mileszs/ack.vim'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'janko-m/vim-test'
Plug 'majutsushi/tagbar'

" Syntax
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'maxMEllon/vim-jsx-pretty'
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'slashmili/alchemist.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'mhinz/vim-mix-format'

" Completion
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'zxqfl/tabnine-vim'

" Misc
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'vim-scripts/vim-misc'
Plug 'junegunn/goyo.vim'
Plug 'https://github.com/Alok/notational-fzf-vim'

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

""""""""""""""""""""""""""""""""""""""
" Colors
""""""""""""""""""""""""""""""""""""""
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

let base16colorspace=256

colorscheme base16-monokai


""""""""""""""""""""""""""""""""""""""
" Status line config
""""""""""""""""""""""""""""""""""""""
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

set laststatus=2
set statusline=
set statusline+=%{ChangeStatuslineColor()}               " Changing the statusline color
set statusline+=%0*\ %{toupper(g:currentmode[mode()])}   " Current mode
set statusline+=%8*\ [%n]                                " buffernr
set statusline+=%8*\ %<%F\ %{ReadOnly()}\ %m\ %w\        " File+path
set statusline+=%#warningmsg#
set statusline+=%*
set statusline+=%9*\ %=                                  " Space
set statusline+=%8*\ %y\                                 " FileType
set statusline+=%7*\ %{(&fenc!=''?&fenc:&enc)}\[%{&ff}]\ " Encoding & Fileformat
set statusline+=%8*\ %-3(%{FileSize()}%)                 " File size
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

""""""""""""""""""""""""""""""""""""""
" FZF shortcurts
""""""""""""""""""""""""""""""""""""""
nmap ; :Buffers<CR>
nmap <Leader>p :Files<CR>
nmap <Leader>r :Tags<CR>
nmap <Leader>t :TagbarToggle<CR>

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
" let g:test#ruby#rspec#executable = 'docker-compose run --rm -e RAILS_ENV=test web rspec'

" ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" fzf
let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=log --exclude=vendor --exclude=bower_components *'

" YCM / Tabnine
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']

" ale
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0

" vim-jsx
let g:jsx_ext_required=0

" alchemist / vim-elixir
let g:mix_format_on_save = 1
