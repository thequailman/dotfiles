" Limit loclist size
autocmd User ALELintPost call s:ale_loclist_limit()
function! s:ale_loclist_limit()
  if exists("b:ale_list_window_size_max")
    let b:ale_list_window_size = min([len(ale#engine#GetLoclist(bufnr('%'))), b:ale_list_window_size_max])
  elseif exists("g:ale_list_window_size_max")
    let b:ale_list_window_size = min([len(ale#engine#GetLoclist(bufnr('%'))), g:ale_list_window_size_max])
  endif
endfunction

" Close loclist automatically
autocmd BufWinEnter olcationkfix nnoremap <silent> <buffer>
\   q :cclose<cr>:lclose<cr>
autocmd BufEnter * if (winnr('$') == 1 && &buftype ==# 'quickfix' ) |
\   bd|
\   q | endif

" Exclude quickfix from buffer list
augroup qf
  autocmd!
  autocmd FileType qf set nobuflisted
augroup END


let g:ale_completion_enabled = 1
let g:ale_open_list = 1
let g:ale_linters = {
\  'go': [
\     'golangci-lint',
\     'gopls'
\ ]
\}
let g:ale_go_golangci_lint_package = 1
let g:ale_go_golangci_lint_options = ''
let g:ale_list_window_size_max = 10
let g:ale_set_balloons = 1
let g:ale_set_quickfix = 1

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" : "\<TAB>"
