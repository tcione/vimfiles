" fzf
let g:fzf_tags_command = 'ctags -R --exclude=.git --exclude=log --exclude=vendor --exclude=bower_components --exclude=node_modules --exclude=vcr_cassettes *'

" Shortcuts
nmap ; :Buffers<CR>
nmap <Leader>p :Files<CR>
nmap <Leader>r :Tags<CR>

set rtp+=/usr/local/opt/fzf
