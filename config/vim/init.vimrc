"""""""""""""""""""""""""""""""""""""
" Based on several sources and mine own exp
" Sources:
" - http://amix.dk/vim/vimrc.html
""""""""""""""""""""""""""""""""""""""

source ~/.config/vim/plugins.vimrc
source ~/.config/vim/functions.vimrc
source ~/.config/vim/settings.vimrc
source ~/.config/vim/mappings.vimrc
source ~/.config/vim/commands.vimrc
for f in split(glob('~/.config/vim/plugin-settings/*.vimrc'), '\n')
  exe 'source' f
endfor
