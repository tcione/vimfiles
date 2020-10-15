call plug#begin('~/.vim/plugged')

" Quality of life
Plug 'scrooloose/nerdcommenter'
Plug 'tpope/vim-vinegar'
Plug 'crusoexia/vim-monokai'
Plug 'sheerun/vim-polyglot'
Plug 'danielwe/base16-vim'
Plug 'benjifisher/matchit.zip'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/BufOnly.vim'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/PreserveNoEOL'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-abolish'
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'ap/vim-css-color'
Plug 'gko/vim-coloresque'

" Tools
Plug 'mileszs/ack.vim'
Plug '~/.fzf'
Plug 'junegunn/fzf.vim'
Plug 'janko-m/vim-test'
Plug 'brooth/far.vim'

" Misc
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'vim-scripts/vim-misc'
Plug 'junegunn/goyo.vim'
Plug 'pedrohdz/vim-yaml-folds'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" LSPs and stuff
Plug 'neoclide/coc.nvim', {'branch': 'master'}

call plug#end()

filetype plugin indent on
