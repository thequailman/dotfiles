" Close list when buffer is empty
augroup CloseLoclistWindowGroup
    autocmd!
    autocmd QuitPre * if empty(&buftype) | cclose | endif
augroup END

" Close terminal on exit
function! s:termclose() abort
  let buf = expand('#')
  if !empty(buf) && buflisted(buf) && bufnr(buf) != bufnr('%')
    execute 'autocmd BufWinLeave <buffer> split' buf
  endif
endfunction
autocmd TermClose *:$SHELL,*:\$SHELL call s:termclose()

" Close if NERDtree is only open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
<<<<<<< Updated upstream
=======

" Exclude terminal from buffer list
autocmd TermOpen * set nobuflisted

>>>>>>> Stashed changes
