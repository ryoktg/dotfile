augroup CommonLsp
  au!
  autocmd FileType go,erlang,javascript,typescript,python,dart,php nnoremap <silent> <Leader>ff coc#refresh()
  autocmd FileType go,erlang,javascript,typescript,python,dart,php inoremap <silent> <expr> <C-c> pumvisible() ? "\<C-e>" : "\<C-c>"
  autocmd FileType go,erlang,javascript,typescript,python,dart,php inoremap <silent> <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
  autocmd FileType go,erlang,javascript,typescript,python,dart,php inoremap <silent> <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
  autocmd FileType go,erlang,javascript,typescript,python,dart,php inoremap <silent> <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
  autocmd FileType go,erlang,javascript,typescript,python,dart,php nmap <Leader>rr <Plug>(coc-rename)
  autocmd FileType go,erlang,javascript,typescript,python,dart,php nnoremap K :call CocAction('doHover')<CR>
  autocmd FileType go,erlang,javascript,typescript,python,dart,php nmap gd <Plug>(coc-definition)
  autocmd FileType go,erlang,javascript,typescript,python,dart,php nmap ge :CocList diagnostics<CR>
  autocmd FileType go,erlang,javascript,typescript,python,dart,php nmap gi <Plug>(coc-implementation)
  autocmd FileType go,erlang,javascript,typescript,python,dart,php nmap gr <Plug>(coc-references)
  autocmd FileType go,erlang,javascript,typescript,python,dart,php nmap gy <Plug>(coc-type-definition)
  autocmd FileType go,erlang,javascript,typescript,python,dart,php nmap g[ <Plug>(coc-diagnostic-prev-error)
  autocmd FileType go,erlang,javascript,typescript,python,dart,php nmap g] <Plug>(coc-diagnostic-next-error)
	autocmd FileType go,erlang,javascript,typescript,python,dart,php nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
	autocmd FileType go,erlang,javascript,typescript,python,dart,php nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
  autocmd FileType go,erlang,javascript,typescript,python,dart,php command! -nargs=0 Format :call Format()
augroup END

augroup PHP
  au!
  autocmd FileType php set tabstop=4 softtabstop=4 shiftwidth=4
augroup END

augroup Python
  au!
  autocmd FileType python command! -nargs=0 Exec execute "!python3 %"
augroup END

function! Format() abort
  if &filetype == 'go'
    if !executable('goimports')
      throw 'goimports is not executable.'
    endif
    let l:pos = getcurpos()
    let l:bufname = bufname()
    let l:formatted = systemlist('goimports '.l:bufname)
    execute ':w'
    call deletebufline('%', 1, '$')
    call appendbufline('%', 0, l:formatted)
    call setpos('.', l:pos)
  else
    call CocAction('format')
  endif
endfunction
