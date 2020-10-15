" Friendly saving
nmap <leader>w :w!<cr>

" Remap VIM 0 to first non-blank character
map 0 ^

" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

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

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" nnoremap <c-j> :m .+1<CR>==
" nnoremap <c-k> :m .-2<CR>==
" inoremap <c-j> <Esc>:m .+1<CR>==gi
" inoremap <c-k> <Esc>:m .-2<CR>==gi
" vnoremap <c-j> :m '>+1<CR>gv=gv
" vnoremap <c-k> :m '<-2<CR>gv=gv
