if has('nvim')
  function! TestStratNeovimManualClose(cmd)
    botright new | call termopen(a:cmd)
  endfunction
  let g:test#custom_strategies = {'neovim_manual_close': function('TestStratNeovimManualClose')}
  let g:test#strategy = 'neovim_manual_close'
else
  let g:test#strategy = 'vimterminal'
endif

" TODO: Improve this mess
" Enable whenever working with docker
" let g:test#ruby#rspec#executable = 'docker-compose run --rm -e RAILS_ENV=test app rspec'
" let g:test#ruby#rspec#executable = 'docker-compose exec app rspec'
