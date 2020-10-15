" Enable C-j C-k navigation in completion
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

let g:coc_global_extensions = [
  \ 'coc-flow',
  \ 'coc-eslint',
  \ 'coc-tsserver',
  \ 'coc-solargraph',
  \ 'coc-json',
  \ 'coc-sh',
  \ 'coc-diagnostic',
  \ 'coc-styled-components',
  \ 'coc-rls',
  \ ]
