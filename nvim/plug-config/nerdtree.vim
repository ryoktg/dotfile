autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | wincmd l | Startify | endif
autocmd VimEnter * if argc() == 1 && argv(0) == '.' | call InitLayout() | endif
nnoremap <Leader>pv :call InitLayout()<CR>
let g:NERDTreeMinimalUI=1
let g:NERDTreeMapJumpNextSibling='<Nop>'
let g:NERDTreeMapJumpPrevSibling='<Nop>'

function! InitLayout() abort
  execute ":NERDTreeFocus"
  let l:win_count = winnr('$')
  if l:win_count == 1
    execute ":wincmd v | :vertical resize 30 | :wincmd l | :Startify"
  else
    execute ":vertical resize 30"
  endif
endfunction

