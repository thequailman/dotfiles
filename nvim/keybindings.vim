"Close terminal on exit
function! s:termclose() abort
  let buf = expand('#')
  if !empty(buf) && buflisted(buf) && bufnr(buf) != bufnr('%')
    execute 'autocmd BufWinLeave <buffer> split' buf
  endif
endfunction
autocmd TermClose *:$SHELL,*:\$SHELL call s:termclose()
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Have space be leader
let mapleader = "\<Space>"

" Map jk to escape
inoremap jk <Esc>

"Easy resizing
map = <c-w>>
map - <c-w><

" Have | split right
map <Bar> <C-W>v<C-W><Right>

" Have tab move between buffers
map <Tab> :bn<CR>
map <S-Tab> :bp<CR>

" Change to left split
nnoremap <C-H> <C-W><C-H>

" Change to bottom split
nnoremap <C-J> <C-W><C-J>

" Change to top split
nnoremap <C-K> <C-W><C-K>

" Change to right split
nnoremap <C-L> <C-W><C-L>

"Down is really the next line
nnoremap j gj
nnoremap k gk

" Return unsets search
nnoremap <CR> :noh<CR>

" Go to definition
nnoremap <Leader>d :ALEGoToDefinition<CR>

" Go to type definition
nnoremap <Leader>dt :ALEGoToTypeDefinition<CR>

" Find files
nnoremap <Leader>f :GFiles --cached --others --exclude-standard<CR>

" Find line
nnoremap <Leader>fl :Lines

" Git blame
nnoremap <Leader>gb :Gblame<CR>

" Git commit
nnoremap <Leader>gc :Gcommit<CR>
"
" Git diff
nnoremap <Leader>gd :Gdiff<CR>
" Git move
nnoremap <Leader>gm :Gmove<CR>

" Git remove
nnoremap <Leader>gr :Gdelete<CR>

" Git status
nnoremap <Leader>gs :Gstatus<CR>

" Info
nnoremap <Leader>i :ALEHover<CR>

" Next quickfix error
nnoremap <Leader>j :ALENextWrap<CR>

" Previous quickfix error
nnoremap <Leader>k :ALEPreviousWrap<CR>

" Toggle files
nnoremap <leader>n :NERDTreeToggle<CR><C-h>

" Open 10 line terminal below buffer
nnoremap <leader>o :10sp term://$SHELL<cr>i

" Quit window
nnoremap <Leader>q :q!<CR>

" Test current file
nnoremap <Leader>t :TestFile<CR>

" Quit window and save
nnoremap <Leader>w :wq!<CR>

" Remap escape for terminal
tnoremap <leader>o <C-\><C-n>
