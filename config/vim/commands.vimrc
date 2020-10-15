autocmd BufWrite * :call DeleteTrailingWS()
command! -nargs=* Wrap set wrap linebreak nolist

" Return to last edit position when opening files
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif

autocmd BufNewFile,BufReadPost *.md set filetype=markdown
autocmd BufNewFile,BufReadPost *.prisma set filetype=graphql
autocmd BufNewFile,BufReadPost README set filetype=markdown
autocmd BufNewFile,BufReadPost todo.txt set filetype=todo
autocmd BufNewFile,BufReadPost *.axlsx set filetype=ruby
autocmd BufNewFile,BufReadPost *.jb set filetype=ruby
