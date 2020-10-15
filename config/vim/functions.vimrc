" Returns true if paste mode is enabled
function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

" Delete trailing white space on save
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

" A mode for human text :D
function! ProseMode()
  call goyo#execute(0, [])
  set spell noci nosi noai nolist noshowmode noshowcmd
  set complete+=s
  set syntax=markdown
  let g:ycm_auto_trigger = 0
endfunction
command! ProseMode call ProseMode()

" Make json pretty
function! FormatJson()
  system("python -m json.tool")
endfunction
command! FormatJson call FormatJson()
